/* Copyright 2021 Coderrect Inc. All Rights Reserved.
Licensed under the GNU Affero General Public License, version 3 or later (“AGPL”), as published by the Free Software
Foundation. You may not use this file except in compliance with the License. You may obtain a copy of the License at
https://www.gnu.org/licenses/agpl-3.0.en.html
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an “AS IS” BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/

#include "LanguageModel/RaceModel.h"

#include "IR/IRImpls.h"
#include "LanguageModel/OpenMP.h"
#include "LanguageModel/pthread.h"

using namespace pta;

RaceModel::RaceModel(llvm::Module *M, llvm::StringRef entry) : Super(M, entry) {
  originCtx::setOriginRules([&](const originCtx *context, const llvm::Instruction *I) -> bool {
    return this->isInvokingAnOrigin(context, I);
  });
}

InterceptResult RaceModel::interceptFunction(const ctx * /* callerCtx */, const ctx * /* calleeCtx */,
                                             const llvm::Function *F, const llvm::Instruction *callsite) {
  auto funcName = F->getName();

  // Skip intrinsic in PTA
  if (F->isIntrinsic()) {
    return {nullptr, InterceptResult::Option::IGNORE_FUN};
  }

  if (PthreadModel::isPthreadCreate(funcName)) {
    race::PthreadCreate create(llvm::cast<CallBase>(callsite));
    auto callback = create.getThreadEntry()->stripPointerCasts();
    return {callback, InterceptResult::Option::EXPAND_BODY};
  }

  if (OpenMPModel::isFork(funcName)) {
    race::OpenMPFork fork(llvm::cast<CallBase>(callsite));
    return {fork.getThreadEntry(), InterceptResult::Option::EXPAND_BODY};
  }

  if (OpenMPModel::isTask(funcName) || OpenMPModel::isTaskAlloc(funcName)) {
    race::OpenMPTask task(llvm::cast<CallBase>(callsite));
    return {task.getThreadEntry(), InterceptResult::Option::EXPAND_BODY};
  }

  // By default always try to expand the function body
  return {F, InterceptResult::Option::EXPAND_BODY};
}

bool RaceModel::interceptCallSite(const CtxFunction<ctx> *caller, const CtxFunction<ctx> *callee,
                                  const llvm::Function *originalTarget, const llvm::Instruction *callsite) {
  assert(originalTarget != nullptr);
  assert(CT::contextEvolve(caller->getContext(), callsite) == callee->getContext());

  auto const call = llvm::dyn_cast<llvm::CallBase>(callsite);
  if (!call || !call->getCalledFunction() || !call->getCalledFunction()->hasName()) return false;

  auto const funcName = call->getCalledFunction()->getName();

  if (PthreadModel::isPthreadCreate(funcName)) {
    // pthread_create passes a single void* arg
    //  pthread_create(null, foo, null, arg)
    //  foo(void *arg)
    // link 4th arg of caller to 1st arg of callee
    PtrNode *formal = this->getPtrNode(callee->getContext(), &*callee->getFunction()->arg_begin());
    PtrNode *actual = this->getPtrNode(caller->getContext(), call->getArgOperand(3));
    this->consGraph->addConstraints(actual, formal, Constraints::copy);
    return true;
  }

  if (OpenMPModel::isFork(funcName)) {
    // omp fork spawns thread that executes outline:
    //     omp_fork_call(a, b, outlined, n, n+1, n+2, ...)
    //     outlined(x, y, m, m+1, m+2, ...)
    // non global shared args are passed as pointers n, n+1, n+2, ...
    // and received by outlined func as m, m+1, m+2, ...

    // Need to link 4th arg of caller (n) to 3rd arg of callee (m)
    // and 4th arg of caller (n+1) to 4th arg of callee (m+1)
    // and so on

    auto calleeArg = callee->getFunction()->arg_begin();
    auto callerArg = call->arg_begin();
    std::advance(calleeArg, 2);
    std::advance(callerArg, 3);
    for (auto const end = callee->getFunction()->arg_end(); calleeArg != end; ++calleeArg, ++callerArg) {
      // Only link args with pointer type
      if (calleeArg->getType()->isPointerTy()) {
        PtrNode *formal = this->getPtrNode(callee->getContext(), calleeArg);
        PtrNode *actual = this->getPtrNode(caller->getContext(), *callerArg);
        this->consGraph->addConstraints(actual, formal, Constraints::copy);
      }
    }

    return true;
  }
  if (OpenMPModel::isTask(funcName)) {
    // Link 3rd arg of __kmpc_omp_task (kmp_tsking.cpp:1684)
    // With generated task function's 2nd argument that is heap allocated 
    // struct containing pointers to the shared variables
    auto calleeArg = callee->getFunction()->args().begin(); 
    std::advance(calleeArg, 1);
    PtrNode *formal = this->getPtrNode(callee->getContext(), calleeArg);

    PtrNode *actual = this->getPtrNode(caller->getContext(), call->getArgOperand(2));
    this->consGraph->addConstraints(actual, formal, Constraints::copy);
    return true;
  }

  return false;
}

bool RaceModel::isCompatible(const llvm::Instruction * /* callsite */, const llvm::Function * /* target */) {
  llvm_unreachable("unrecognizable function");
}

void RaceModel::interceptHeapAllocSite(const CtxFunction<ctx>* caller, const CtxFunction<ctx>* callee,
                                       const llvm::Instruction* callsite) {
  // GrB_Matrix_new and GB_new take a pointer pointer of a Matrix to initialize
  // therefore we need to create a fake pointer node representing the pointer of a Matrix
  if (heapModel.isHeapInitFun(callee->getFunction())) {
      Type *type = callsite->getOperand(0)->getType()->getPointerElementType()->getPointerElementType();
      PtrNode *ptr = this->getPtrNode(caller->getContext(), callsite->getOperand(0));
      PtrNode *fakePtr = this->createAnonPtrNode();
      ObjNode *obj = this->allocHeapObj(caller->getContext(), callsite, type);

      this->consGraph->addConstraints(obj, fakePtr, Constraints::addr_of);
      this->consGraph->addConstraints(fakePtr, ptr, Constraints::store);
      return;
  } else if (heapModel.isHeapAllocFun(callee->getFunction())) {
      if (callee->getFunction()->getName().equals(".coderrect.recursive.allocation")) {
          Type *type = heapModel.inferHeapAllocType(callee->getFunction(), callsite);

          PtrNode *ptr = this->getPtrNode(caller->getContext(), callsite);
          ObjNode *obj = MMT::template allocateAnonObj<PT>(
              this->getMemModel(), caller->getContext(), this->getLLVMModule()->getDataLayout(),
              type == nullptr ? nullptr : type, callsite,
              true);  // init the object recursively if it is an aggeragate type

          this->consGraph->addConstraints(obj, ptr, Constraints::addr_of);
          return;
      }

      if (OpenMPModel::isTaskAlloc(callee->getFunction()->getName())) {
          // the type will be something like %struct.kmp_task_t_with_privates
          Type *type = heapModel.inferHeapAllocType(callee->getFunction(), callsite);

          if (type == nullptr) {
              LOG_ERROR("cannot infer type for omp task alloc? callsite={}", *callsite);
              // return;
          }

          ObjNode *taskObj = allocHeapObj(caller->getContext(), callsite, type);
          ObjNode *sharedObj = MMT::template allocateAnonObj<PT>(
              this->getMemModel(), caller->getContext(), this->getLLVMModule()->getDataLayout(),
              type == nullptr ? nullptr : type->getPointerElementType(), nullptr,
              false);  // do not initialized its element

          // ObjNode *sharedObj = allocHeapObj(caller->getContext(), callsite, type->getPointerElementType());
          PtrNode *ptr = this->getPtrNode(caller->getContext(), callsite);

          this->consGraph->addConstraints(sharedObj, taskObj, Constraints::addr_of);
          this->consGraph->addConstraints(taskObj, ptr, Constraints::addr_of);

          return;
      }

      if (callee->getFunction()->getName().equals("f90_alloc04_chka_i8") ||
          callee->getFunction()->getName().equals("f90_ptr_alloc04a_i8")) {
          PtrNode *ptr = this->getPtrNode(caller->getContext(), llvm::cast<CallBase>(callsite)->getArgOperand(4));
          ObjNode *obj = this->allocHeapObj(caller->getContext(), callsite,
                                            getUnboundedArrayTy(IntegerType::get(callsite->getContext(), 8)));

          this->consGraph->addConstraints(obj->getAddrTakenNode(), ptr, Constraints::store);
          return;
      }

      Type *type = heapModel.inferHeapAllocType(callee->getFunction(), callsite);
      PtrNode *ptr = this->getPtrNode(caller->getContext(), callsite);
      ObjNode *obj = this->allocHeapObj(caller->getContext(), callsite, type);

      this->consGraph->addConstraints(obj, ptr, Constraints::addr_of);
      return;
  }
  return;

                                       
}

bool RaceModel::isHeapAllocAPI(const llvm::Function *F, const llvm::Instruction * /* callsite */) {
  if (!F->hasName()) return false;
  auto const name = F->getName();
  return name.equals("malloc") || name.equals("calloc") || name.equals("_Zname") || name.equals("_Znwm")  || name.equals("__kmpc_omp_task_alloc");
}

namespace {
// TODO: better way of handling these
const std::set<llvm::StringRef> origins{"pthread_create", "__kmpc_fork_call", "__kmpc_omp_task", "__kmpc_omp_task_alloc"};
}  // namespace

bool RaceModel::isInvokingAnOrigin(const originCtx * /* prevCtx */, const llvm::Instruction *I) {
  auto call = llvm::dyn_cast<CallBase>(I);
  if (!call || !call->getCalledFunction() || !call->getCalledFunction()->hasName()) return false;

  auto const name = call->getCalledFunction()->getName();
  return origins.find(name) != origins.end();
}
