#include "Analysis/OpenMPAnalysis.h"

#include "IR/IRImpls.h"
#include "LanguageModel/OpenMP.h"
#include "Trace/Event.h"
#include "Trace/ThreadTrace.h"

using namespace race;
using namespace llvm;

namespace {

const llvm::GetElementPtrInst *getArrayAccess(const MemAccessEvent *event) {
  return llvm::dyn_cast<llvm::GetElementPtrInst>(event->getIRInst()->getAccessedValue()->stripPointerCasts());
}

// move add operation out the (sext ) SCEV
class BitExtSCEVRewriter : public llvm::SCEVRewriteVisitor<BitExtSCEVRewriter> {
 private:
  const SCEV *rewriteCastExpr(const SCEVCastExpr *Expr);

 public:
  using super = SCEVRewriteVisitor<BitExtSCEVRewriter>;
  explicit BitExtSCEVRewriter(llvm::ScalarEvolution &SE) : super(SE) {}

  const SCEV *visit(const SCEV *S);

  inline const SCEV *visitZeroExtendExpr(const SCEVZeroExtendExpr *Expr) { return rewriteCastExpr(Expr); };

  inline const SCEV *visitSignExtendExpr(const SCEVSignExtendExpr *Expr) { return rewriteCastExpr(Expr); }
};

class SCEVBoundApplier : public llvm::SCEVRewriteVisitor<SCEVBoundApplier> {
 private:
  using super = SCEVRewriteVisitor<SCEVBoundApplier>;
  const llvm::Loop *ompLoop;

 public:
  SCEVBoundApplier(const llvm::Loop *ompLoop, llvm::ScalarEvolution &SE) : super(SE), ompLoop(ompLoop) {}

  const llvm::SCEV *visitAddRecExpr(const llvm::SCEVAddRecExpr *Expr);
};

class OpenMPLoopManager {
 private:
  Function *F;

  // dependent pass from LLVM
  DominatorTree *DT;

  // cached result. TODO: use const pointer
  SmallDenseMap<BasicBlock *, CallBase *, 4> ompStaticInitBlocks;
  SmallDenseMap<BasicBlock *, CallBase *, 4> ompDispatchInitBlocks;

  void init();

  Optional<int64_t> resolveBoundValue(const AllocaInst *V, const CallBase *initCall) const;

 public:
  // constructor
  OpenMPLoopManager(AnalysisManager<Function> &FAM, Function &fun)
      : F(&fun), DT(&FAM.getResult<DominatorTreeAnalysis>(fun)) {
    init();
  }

  // getter
  [[nodiscard]] inline Function *getTargetFunction() const { return F; }

  // query.
  // TODO: handle dynamic dispatch calls.
  inline CallBase *getStaticInitCallIfExist(const BasicBlock *block) const {
    auto it = ompStaticInitBlocks.find(block);
    return it == ompStaticInitBlocks.end() ? nullptr : it->second;
  }

  // TODO: handle dynamic dispatch for loop
  inline CallBase *getStaticInitCallIfExist(const Loop *L) const {
    if (L->getLoopPreheader() == nullptr) {
      return nullptr;
    }

    auto initBlock = L->getLoopPreheader()->getUniquePredecessor();
    return getStaticInitCallIfExist(initBlock);
  }

  std::pair<Optional<int64_t>, Optional<int64_t>> resolveOMPLoopBound(const Loop *L) const {
    return resolveOMPLoopBound(getStaticInitCallIfExist(L));
  }
  std::pair<Optional<int64_t>, Optional<int64_t>> resolveOMPLoopBound(const CallBase *initForCall) const;

  const SCEVAddRecExpr *getOMPLoopSCEV(const llvm::SCEV *root) const;

  // TODO: handle dynamic dispatch for loop
  inline bool isOMPForLoop(const Loop *L) const { return this->getStaticInitCallIfExist(L) != nullptr; }
};

template <typename PredTy>
const SCEV *findSCEVExpr(const llvm::SCEV *Root, PredTy Pred) {
  struct FindClosure {
    const SCEV *Found = nullptr;
    PredTy Pred;

    FindClosure(PredTy Pred) : Pred(Pred) {}

    bool follow(const llvm::SCEV *S) {
      if (!Pred(S)) return true;

      Found = S;
      return false;
    }

    bool isDone() const { return Found != nullptr; }
  };

  FindClosure FC(Pred);
  visitAll(Root, FC);
  return FC.Found;
}

inline const SCEV *stripSCEVBaseAddr(const SCEV *root) {
  return findSCEVExpr(root, [](const llvm::SCEV *S) -> bool { return isa<llvm::SCEVAddRecExpr>(S); });
}

const SCEV *getNextIterSCEV(const SCEVAddRecExpr *root, ScalarEvolution &SE) {
  auto step = root->getOperand(1);
  return SE.getAddRecExpr(SE.getAddExpr(root->getOperand(0), step), step, root->getLoop(), root->getNoWrapFlags());
}
bool regionEndLessThan(const Region &region1, const Region &region2) { return region1.end < region2.end; }

}  // namespace

const SCEV *BitExtSCEVRewriter::visit(const SCEV *S) {
  auto result = super::visit(S);
  // recursively into the sub expression
  while (result != S) {
    S = result;
    result = super::visit(S);
  }
  return result;
}

const SCEV *BitExtSCEVRewriter::rewriteCastExpr(const SCEVCastExpr *Expr) {
  auto buildCastExpr = [&](const SCEV *op, Type *type) -> const SCEV * {
    switch (Expr->getSCEVType()) {
      case scSignExtend:
        return SE.getSignExtendExpr(op, type);
      case scZeroExtend:
        return SE.getZeroExtendExpr(op, type);
      default:
        llvm_unreachable("unhandled type of scev cast expression");
    }
  };

  const llvm::SCEV *Operand = super::visit(Expr->getOperand());
  if (auto add = llvm::dyn_cast<llvm::SCEVNAryExpr>(Operand)) {
    llvm::SmallVector<const llvm::SCEV *, 2> Operands;
    for (auto op : add->operands()) {
      Operands.push_back(buildCastExpr(op, Expr->getType()));
    }
    switch (add->getSCEVType()) {
      case llvm::scMulExpr:
        return SE.getMulExpr(Operands);
      case llvm::scAddExpr:
        return SE.getAddExpr(Operands);
      case llvm::scAddRecExpr:
        auto addRec = llvm::dyn_cast<llvm::SCEVAddRecExpr>(add);
        return SE.getAddRecExpr(Operands, addRec->getLoop(), addRec->getNoWrapFlags());
    }
  }
  return Operand == Expr->getOperand() ? Expr : buildCastExpr(Operand, Expr->getType());
}

const llvm::SCEV *SCEVBoundApplier::visitAddRecExpr(const llvm::SCEVAddRecExpr *Expr) {
  // stop at the OpenMP Loop
  if (Expr->getLoop() == ompLoop) {
    return Expr;
  }

  if (Expr->isAffine()) {
    auto op = visit(Expr->getOperand(0));
    auto step = Expr->getOperand(1);

    auto backEdgeCount = SE.getBackedgeTakenCount(Expr->getLoop());
    if (isa<SCEVConstant>(backEdgeCount)) {
      auto bounded = SE.getAddExpr(op, SE.getMulExpr(backEdgeCount, step));
      return bounded;
    }
  }
  return Expr;
}

void OpenMPLoopManager::init() {
  // initialize the map to the omp related calls
  for (auto &BB : *F) {
    for (auto &I : BB) {
      if (auto call = dyn_cast<CallBase>(&I)) {
        if (call->getCalledFunction() != nullptr && call->getCalledFunction()->hasName()) {
          auto funcName = call->getCalledFunction()->getName();
          if (OpenMPModel::isForStaticInit(funcName)) {
            this->ompStaticInitBlocks.insert(std::make_pair(&BB, call));
          } else if (OpenMPModel::isForDispatchInit(funcName)) {
            this->ompDispatchInitBlocks.insert(std::make_pair(&BB, call));
          }
        }
      }
    }
  }
}

Optional<int64_t> OpenMPLoopManager::resolveBoundValue(const AllocaInst *V, const CallBase *initCall) const {
  const llvm::StoreInst *storeInst = nullptr;
  for (auto user : V->users()) {
    if (auto SI = llvm::dyn_cast<llvm::StoreInst>(user)) {
      // simple cases, only has one store instruction
      if (storeInst == nullptr) {
        if (this->DT->dominates(SI, initCall)) {
          storeInst = SI;
        }
      } else {
        if (this->DT->dominates(SI, initCall)) {
          return Optional<int64_t>();
        }
      }
    }
  }

  if (storeInst) {
    auto bound = dyn_cast<ConstantInt>(storeInst->getValueOperand());
    if (bound) {
      return bound->getSExtValue();
    }
    return Optional<int64_t>();
  } else {
    // LOG_DEBUG("omp bound has no store??");
    return Optional<int64_t>();
  }
}

std::pair<Optional<int64_t>, Optional<int64_t>> OpenMPLoopManager::resolveOMPLoopBound(
    const CallBase *initForCall) const {
  Value *ompLB = nullptr, *ompUB = nullptr;  // up bound and lower bound
  if (OpenMPModel::isForStaticInit(initForCall->getCalledFunction()->getName())) {
    ompLB = initForCall->getArgOperand(4);
    ompUB = initForCall->getArgOperand(5);
  } else if (OpenMPModel::isForDispatchInit(initForCall->getCalledFunction()->getName())) {
    ompLB = initForCall->getArgOperand(3);
    ompUB = initForCall->getArgOperand(4);
  } else {
    return std::make_pair(Optional<int64_t>(), Optional<int64_t>());
  }

  auto allocaLB = llvm::dyn_cast<llvm::AllocaInst>(ompLB);
  auto allocaUB = llvm::dyn_cast<llvm::AllocaInst>(ompUB);

  // omp.ub and omp.lb are always alloca?
  if (allocaLB == nullptr || allocaUB == nullptr) {
    return std::make_pair(Optional<int64_t>(), Optional<int64_t>());
  }

  auto LB = resolveBoundValue(allocaLB, initForCall);
  auto UB = resolveBoundValue(allocaUB, initForCall);
  return std::make_pair(LB, UB);
}

const SCEVAddRecExpr *OpenMPLoopManager::getOMPLoopSCEV(const llvm::SCEV *root) const {
  // get the outter-most loop (omp loop should always be the outter-most
  // loop within an OpenMP region)
  auto omp = findSCEVExpr(root, [&](const llvm::SCEV *S) -> bool {
    if (auto addRec = llvm::dyn_cast<llvm::SCEVAddRecExpr>(S)) {
      if (this->isOMPForLoop(addRec->getLoop())) {
        return true;
      }
    }
    return false;
  });

  return llvm::dyn_cast_or_null<llvm::SCEVAddRecExpr>(omp);
}

OpenMPAnalysis::OpenMPAnalysis() { PB.registerFunctionAnalyses(FAM); }

bool OpenMPAnalysis::canIndexOverlap(const race::MemAccessEvent *event1, const race::MemAccessEvent *event2) {
  auto gep1 = getArrayAccess(event1);
  if (!gep1) return false;

  auto gep2 = getArrayAccess(event2);
  if (!gep2) return false;

  // should be in same function
  if (gep1->getFunction() != gep2->getFunction()) {
    return false;
  }

  // TODO: get rid of const cast?
  auto &targetFun = *const_cast<llvm::Function *>(gep1->getFunction());
  auto &scev = FAM.getResult<ScalarEvolutionAnalysis>(targetFun);

  BitExtSCEVRewriter rewriter(scev);
  auto scev1 = scev.getSCEV(const_cast<llvm::Value *>(llvm::cast<llvm::Value>(gep1)));
  auto scev2 = scev.getSCEV(const_cast<llvm::Value *>(llvm::cast<llvm::Value>(gep2)));

  // the rewriter here move sext adn zext operations into the deepest scope
  // e.g., (4 + (4 * (sext i32 (2 * %storemerge2) to i64))<nsw> + %a) will be rewritten to
  //   ==> (4 + (8 * (sext i32 %storemerge2 to i64)) + %a)
  // this will simplied the scev expression as sext and zext are considered as variable instead of constant
  // during the computation between two scev expression.
  scev1 = rewriter.visit(scev1);
  scev2 = rewriter.visit(scev2);
  auto diff = dyn_cast<SCEVConstant>(scev.getMinusSCEV(scev1, scev2));

  if (diff == nullptr) {
    // TODO: we are unable to analyze unknown gap array index for now.
    return true;
  }

  if (diff->isZero()) {
    // simplest case, array access patterns are perfectly aligned an there is not overlap
    return false;
  }

  OpenMPLoopManager ompManager(FAM, targetFun);

  // Get the SCEV expression containing only OpenMP loop induction variable.
  auto omp1 = ompManager.getOMPLoopSCEV(scev1);
  auto omp2 = ompManager.getOMPLoopSCEV(scev2);

  // the scev expression does not contains OpenMP for loop
  if (!omp1 || !omp2) {
    return true;
  }

  if (!omp1->isAffine() || !omp2->isAffine()) {
    return true;
  }

  // different OpenMP loop, should never happen though
  if (omp1->getLoop() != omp2->getLoop()) {
    return true;
  }

  /* stripSCEVBaseAddr simplifies SCEV expressions when there is a nested parallel loop

  float A[N][N];
  for (int i = 0; ....)
   #pragma omp parallel for
   for (int j = 0; ...)
      A[i][j] = ...

  Before Strip:
  ((160 * (sext i32 %14 to i64))<nsw> + {((8 * (sext i32 %12 to i64))<nsw> + %a),+,8}<nw><%omp.inner.for.body.i>)
  |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|
                  Base
  After Strip:
                                        {((8 * (sext i32 %12 to i64))<nsw> + %a),+,8}<nw><%omp.inner.for.body.i>

  From OpenMP's perspective there is no multi-dimensional array in this case.
  The outlined OpenMP region will see (i*sizeof(float)) + A as the base address and j as the *only* induction variable.
  stripSCEVBaseAddr strips (i*sizeof(float)) from the SCEV.

  Because this base value is constant with regard to the OpenMP region, the stripped portion can be safely ignored. */
  scev1 = stripSCEVBaseAddr(scev1);
  scev2 = stripSCEVBaseAddr(scev2);

  // This will be true when the parallel loop is nested in a non-parallel outer loop
  if (omp1 == scev1 && omp2 == scev2) {
    uint64_t distance = diff->getAPInt().abs().getLimitedValue();
    auto step = omp1->getOperand(1);

    if (auto constStep = llvm::dyn_cast<llvm::SCEVConstant>(step)) {
      // the step of the loop
      uint64_t loopStep = constStep->getAPInt().abs().getLimitedValue();
      // assume we iterate at least one time
      if (distance == loopStep) {
        return true;
      }

      /* When the loopStep is greater than distance, overlapping accesses are not possible
        Consider the following loop
          for (int i = 0; i < N; i+=2)
            A[i] = i;
            A[i+1] = i;
        The two accesses being considered are A[i] and A[i+1].
        The distance between these two accesses is 1
        As long as the step is greater than this distance there will be no overlap
          i=0 {0, 1} | i=2 {2, 3} | i=4 {4, 5} | ...
        But iof the loopstep is not greater, there may be an overlap.
        Consider a loopstep of 1
          i=0 {0, 1} | i=1 {1, 2} | ...
        Iterations 0 and 1 both access A at an offset of 1*/
      if (distance < loopStep) {
        return false;
      }

      auto bounds = ompManager.resolveOMPLoopBound(omp1->getLoop());
      if (bounds.first.hasValue() && bounds.second.hasValue()) {
        // do we need special handling for negative bound?
        int64_t lowerBound = std::abs(bounds.first.getValue());
        int64_t upperBound = std::abs(bounds.second.getValue());

        // if both bound are resolvable
        // FIXME: why do we need to divide by loopstep?
        assert(std::max(lowerBound, upperBound) >= 0);  // both bounds should be >=0, isn't it?
        long unsigned int maxBound = static_cast<long unsigned int>(std::max(lowerBound, upperBound));
        if (maxBound < (distance / loopStep)) {
          return false;
        }
      }
    }
  } else {
    // FIXME: what is this check doing and why does it work?
    SCEVBoundApplier boundApplier(omp1->getLoop(), scev);

    // this scev represent the largest array elements that will be accessed in the nested loop
    auto b1 = boundApplier.visit(scev1);
    auto b2 = boundApplier.visit(scev2);

    // thus if the largest index is smaller than the smallest index in the next OpenMP loop iteration
    // there is no race
    // TODO: negative loop? are they canonicalized?
    auto n1 = getNextIterSCEV(omp1, scev);
    auto n2 = getNextIterSCEV(omp2, scev);

    std::vector<const SCEV *> gaps = {scev.getMinusSCEV(n1, b1), scev.getMinusSCEV(n1, b2), scev.getMinusSCEV(n2, b1),
                                      scev.getMinusSCEV(n2, b2)};

    if (std::all_of(gaps.begin(), gaps.end(), [](const SCEV *expr) -> bool {
          if (auto constExpr = dyn_cast<SCEVConstant>(expr)) {
            // the gaps are smaller or equal to zero
            return !constExpr->getAPInt().isNonPositive();
          }
          return false;
        })) {
      // then there is no race
      return false;
    }
  }

  // If unsure report they do alias
  llvm::errs() << "unsure so reporting alias\n";
  return true;
}

namespace {

// return true if both events belong to the same OpenMP team
// This function is split out so that it can be called from the template functions below (in, inSame, etc)
bool _inSameTeam(const Event *event1, const Event *event2) {
  // Check both spawn events are OpenMP forks
  auto e1Spawn = event1->getThread().spawnSite;
  if (!e1Spawn || (e1Spawn.value()->getIRInst()->type != IR::Type::OpenMPFork)) return false;

  auto e2Spawn = event2->getThread().spawnSite;
  if (!e2Spawn || (e2Spawn.value()->getIRInst()->type != IR::Type::OpenMPFork)) return false;

  // Check they are spawned from same thread
  if (e1Spawn.value()->getThread().id != e2Spawn.value()->getThread().id) return false;

  // Check that they are adjacent. Only matching omp forks can be adjacent, because they are always followed by joins
  auto const eid1 = e1Spawn.value()->getID();
  auto const eid2 = e2Spawn.value()->getID();
  auto const diff = (eid1 > eid2) ? (eid1 - eid2) : (eid2 - eid1);
  return diff == 1;
}

// Get list of (non-nested) event regions
// template definition can be in cpp as long as we dont expose the template outside of this file
template <IR::Type Start, IR::Type End>
std::vector<Region> getRegions(const ThreadTrace &thread) {
  std::vector<Region> regions;

  std::optional<EventID> start;
  for (auto const &event : thread.getEvents()) {
    switch (event->getIRInst()->type) {
      case Start: {
        if (event->getIRInst()->type != IR::Type::OpenMPSingleStart) {
          assert(!start.has_value() && "encountered two start types in a row");
        }
        start = event->getID();
        break;
      }
      case End: {
        assert(start.has_value() && "encountered end type without a matching start type");
        regions.emplace_back(start.value(), event->getID());
         // hack for kmpc_end_task showing 2ice, must be fixed in general
        if (event->getIRInst()->type != IR::Type::OpenMPSingleEnd) {
          start.reset();
        }
        break;
      }
      default:
        // Nothing
        break;
    }
  }

  return regions;
}

auto constexpr _getLoopRegions = getRegions<IR::Type::OpenMPForInit, IR::Type::OpenMPForFini>;

// return true if event is inside of a region marked by Start and End
// see getRegions for more detail on regions
template <IR::Type Start, IR::Type End>
bool in(const race::Event *event) {
  auto const regions = getRegions<Start, End>(event->getThread());
  auto const eid = event->getID();
  auto it = lower_bound(regions.begin(), regions.end(), Region(eid, eid), regionEndLessThan);
  if (it != regions.end()) {
    if (it->contains(eid)) return true;
  }
  return false;
}

// return true if both events are inside of the region marked by Start and End
// see getRegions for more detail on regions
template <IR::Type Start, IR::Type End>
bool inSame(const Event *event1, const Event *event2) {
  assert(_inSameTeam(event1, event2) && "events must be in same omp team");

  auto const eid1 = event1->getID();
  auto const eid2 = event2->getID();

  // Trace events are ordered, so we can save time by finding the region containing the smaller
  // ID first, and then checking if that region also contains the bigger ID.
  auto const minID = (eid1 < eid2) ? eid1 : eid2;
  auto const maxID = (eid1 > eid2) ? eid1 : eid2;

  // Omp threads in same team will have identical traces so we only need one set of events
  auto const regions = getRegions<Start, End>(event1->getThread());
  auto it = lower_bound(regions.begin(), regions.end(), Region(minID, minID), regionEndLessThan);
  if (it != regions.end()) {
    if (it->contains(minID)) {
      return it->contains(maxID);
    }
  }
  return false;
}

auto const _inSameSingleBlock = inSame<IR::Type::OpenMPSingleStart, IR::Type::OpenMPSingleEnd>;
auto const _inMasterBlock = in<IR::Type::OpenMPMasterStart, IR::Type::OpenMPMasterEnd>;

}  // namespace

const std::vector<OpenMPAnalysis::LoopRegion> &OpenMPAnalysis::getOmpForLoops(const ThreadTrace &thread) {
  // Check if result is already computed
  auto it = ompForLoops.find(thread.id);
  if (it != ompForLoops.end()) {
    return it->second;
  }

  // Else find the loop regions
  auto const loopRegions = _getLoopRegions(thread);
  ompForLoops[thread.id] = loopRegions;

  return ompForLoops.at(thread.id);
}

bool OpenMPAnalysis::inParallelFor(const race::MemAccessEvent *event) {
  auto loopRegions = getOmpForLoops(event->getThread());
  auto const eid = event->getID();

  auto it = lower_bound(loopRegions.begin(), loopRegions.end(), Region(eid, eid), regionEndLessThan);
  if (it != loopRegions.end()) {
    if (it->contains(eid)) return true;
  }

  return false;
}

bool OpenMPAnalysis::isLoopArrayAccess(const race::MemAccessEvent *event1, const race::MemAccessEvent *event2) {
  auto gep1 = getArrayAccess(event1);
  if (!gep1) return false;

  auto gep2 = getArrayAccess(event2);
  if (!gep2) return false;

  return inParallelFor(event1) && inParallelFor(event2);
}

bool OpenMPAnalysis::inSameTeam(const Event *event1, const Event *event2) const { return _inSameTeam(event1, event2); }

bool OpenMPAnalysis::inSameSingleBlock(const Event *event1, const Event *event2) const {
  return _inSameSingleBlock(event1, event2);
}

bool OpenMPAnalysis::bothInMasterBlock(const Event *event1, const Event *event2) const {
  assert(_inSameTeam(event1, event2) && "events must be in same omp team");
  return _inMasterBlock(event1) && _inMasterBlock(event2);
}

std::vector<const llvm::BasicBlock *> &ReduceAnalysis::computeGuardedBlocks(ReduceInst reduce) const {
  assert(reduceBlocks.find(reduce) == reduceBlocks.end() &&
         "Should not call compute if results have already been computed");

  // compute results, cache them, then return them
  auto &blocks = reduceBlocks[reduce];

  /* We are expecting the reduce code produced by clang to follow a specific pattern:
    -------------------------------------------------
      %15 = call i32 @__kmpc_reduce(...)
      switch i32 %15, label %.omp.reduction.default [
        i32 1, label %.omp.reduction.case1
        i32 2, label %.omp.reduction.case2
      ]

    .omp.reduction.case1:
      ...
      call void @__kmpc_end_reduce(...)
      br label %.omp.reduction.default

    .omp.reduction.case2:
      ...
      call void @__kmpc_end_reduce(...)
      br label %.omp.reduction.default

    .omp.reduction.default:
      ...
    -------------------------------------------------

    Our logic makes the following assumptions:
      - There is a switch after the reduce call
      - the default case on the switch is the end fo the reduce code
      - The default case post-dominates the switch

    If these assumptions are true, we can get the blocks that make up
    the reduction code by getting all blocks that are reachable from the switch but
    stop when we reach the default case block (end of the reduce code)
  */

  auto const switchInst = llvm::dyn_cast<llvm::SwitchInst>(reduce->getNextNode());
  assert(switchInst && "instruction after reduce should always be switch");

  // Default dest marks the end of the reduce
  auto const exitBlock = switchInst->getDefaultDest();

  std::vector<const llvm::BasicBlock *> worklist;
  std::set<const llvm::BasicBlock *> visited;
  for (auto const succ : successors(switchInst)) {
    worklist.push_back(succ);
  }

  while (!worklist.empty()) {
    auto block = worklist.back();
    worklist.pop_back();
    visited.insert(block);

    // Stop traversing when we reach end of reduce code
    if (block == exitBlock) continue;

    // add to list of blocks covered by this reduce
    blocks.push_back(block);

    // sanity check that all succ must eventually reach exitBlock
    assert(llvm::succ_size(block) > 0 && "block should have successors");

    // Keep traversing
    for (auto const succ : llvm::successors(block)) {
      if (visited.find(succ) == visited.end()) {
        worklist.push_back(succ);
      }
    }
  }

  return blocks;
}

const std::vector<const llvm::BasicBlock *> &ReduceAnalysis::getReduceBlocks(ReduceInst reduce) const {
  // Check cache first
  if (auto it = reduceBlocks.find(reduce); it != reduceBlocks.end()) {
    return it->second;
  }

  // Else compute
  return computeGuardedBlocks(reduce);
}

bool ReduceAnalysis::reduceContains(const llvm::Instruction *reduce, const llvm::Instruction *inst) const {
  auto const &blocks = getReduceBlocks(reduce);
  return std::find(blocks.begin(), blocks.end(), inst->getParent()) != blocks.end();
}

bool OpenMPAnalysis::inSameReduce(const Event *event1, const Event *event2) const {
  // Find reduce events
  for (auto const &event : event1->getThread().getEvents()) {
    // If an event e is inside of a reduce block it must occur *after* the reduce event
    // so, if either event is encountered before finding a reduce that contains both event1 and event2
    // we know that they are not in the same reduce block
    if (event->getID() == event1->getID() || event->getID() == event2->getID()) return false;

    // Once a reduce is found, check that it contains both events (true)
    // or that it contains neither event (keep searching)
    // if it contains one but not the other, return false
    if (event->getIRInst()->type == IR::Type::OpenMPReduce) {
      auto const reduce = event->getInst();
      auto const contains1 = reduceAnalysis.reduceContains(reduce, event1->getInst());
      auto const contains2 = reduceAnalysis.reduceContains(reduce, event2->getInst());
      if (contains1 && contains2) return true;
      if (contains1 || contains2) return false;
    }
  }

  return false;
}

bool OpenMPAnalysis::insideCompatibleSections(const Event *event1, const Event *event2) {
  // assertion: threads of the same team are identical
  // assertion: we aren't given events from threads in different parallel sections blocks because those would be
  //            different teams

  // observation: we only enter a section if any event in the queue passes through a section case
  // assertion: this vector is distinct but ordered because a given section isn't a descendent of another section
  std::vector<const Event *> sections;
  auto lastID = std::max(event1->getID(), event2->getID());
  for (auto &event : event1->getThread().getEvents()) {
    auto block = event->getInst()->getParent();
    if ((sections.empty() || block != sections.back()->getInst()->getParent()) && block->hasName() &&
        block->getName().startswith(".omp.sections.case")) {  // add for body check
      sections.push_back(event.get());
    }
    // this is our end event; anything beyond this is not worth capturing
    if (event->getID() > lastID) {
      break;
    }
  }

  if (sections.empty()) {
    return false;
  }

  std::vector<const Event *> events;
  events.reserve(event1->getThread().getEvents().size());
  std::transform(event1->getThread().getEvents().begin(), event1->getThread().getEvents().end(),
                 std::back_inserter(events), [&](const auto &event) { return event.get(); });

  const Event *ev1sec = nullptr;
  const Event *ev2sec = nullptr;

  auto currSecEv = sections.begin();
  for (auto currEvent = std::find(events.begin(), events.end(), *currSecEv); (*currEvent)->getID() <= lastID;
       ++currSecEv) {
    do {
      if (event1->getID() == (*currEvent)->getID()) {
        ev1sec = *currSecEv;
      }
      if (event2->getID() == (*currEvent)->getID()) {
        ev2sec = *currSecEv;
      }

      if (ev1sec != nullptr && ev2sec != nullptr) {
        if (ev1sec == ev2sec) {
          return true;
        } else {
          return false;
        }
      }
      ++currEvent;
    } while (std::find(sections.begin(), sections.end(), *currEvent) == sections.end());
  }

  return false;
}
