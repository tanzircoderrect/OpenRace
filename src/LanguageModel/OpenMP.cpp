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

#include "LanguageModel/OpenMP.h"

namespace OpenMPModel {

bool isFork(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_fork_call"); }
bool isFork(const llvm::CallBase* callInst) {
  if (!callInst) return false;
  auto const func = callInst->getCalledFunction();
  if (!func->hasName()) return false;
  return isFork(func->getName());
}

// return true of funcName equals any name in names
bool matchesAny(const llvm::StringRef& funcName, const std::vector<llvm::StringRef>& names) {
  return std::any_of(names.begin(), names.end(), [&funcName](auto& name) { return funcName.equals(name); });
}

inline bool isForStaticInit(const llvm::StringRef& funcName) {
  // Each version functions the same, only argument types slightly differ
  return matchesAny(funcName, {"__kmpc_for_static_init_4", "__kmpc_for_static_init_4u", "__kmpc_for_static_init_8",
                               "__kmpc_for_static_init_8u"});
}
inline bool isForStaticFini(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_for_static_fini"); }

inline bool isSingleStart(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_single"); }
inline bool isSingleEnd(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_end_single"); }

inline bool isBarrier(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_barrier"); }

inline bool isReduceStart(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_reduce"); }
inline bool isReduceEnd(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_end_reduce"); }

inline bool isReduceNowaitStart(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_reduce_nowait"); }
inline bool isReduceNowaitEnd(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_end_reduce_nowait"); }

inline bool isCriticalStart(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_critical"); }
inline bool isCriticalEnd(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_end_critical"); }

inline bool isMasterStart(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_master"); }
inline bool isMasterEnd(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_end_master"); }

// Return true for omp calls that do not need to be modelled (e.g. push_num_threads)
inline bool isNoEffect(const llvm::StringRef& funcName) {
  return matchesAny(funcName, {"__kmpc_push_num_threads", "__kmpc_global_thread_num"})
         // we dont rely on reduce end to find end of reduce region
         || isReduceEnd(funcName) || isReduceNowaitEnd(funcName);
}

// Used only for debug to try and catch unhandled OpenMP calls
inline bool isOpenMP(const llvm::StringRef& funcName) { return funcName.startswith("__kmpc"); }

// Assuming ompForkCall points to a OpenMP fork call, the next inst should be a duplicate omp fork call
// this returns that omp fork or null if the next inst is not a omp fork call
std::shared_ptr<OpenMPFork> getTwinOmpFork(const llvm::CallBase* ompForkCall) {
  auto next = ompForkCall->getNextNode();
  if (!next) return nullptr;

  auto twinOmpForkInst = llvm::dyn_cast<llvm::Instruction>(next);
  if (!twinOmpForkInst) return nullptr;

  auto twinCallInst = llvm::dyn_cast<llvm::CallBase>(twinOmpForkInst);
  if (!twinCallInst) return nullptr;
  if (!OpenMPModel::isFork(twinCallInst)) return nullptr;

  return std::make_shared<OpenMPFork>(twinCallInst);
}

std::vector<std::shared_ptr<const race::IR>> Modeller::getFuncIRRepr(llvm::BasicBlock::const_iterator& it,
                                                                     const llvm::CallBase* callInst,
                                                                     const llvm::StringRef& funcName) const {
  std::vector<std::shared_ptr<const race::IR>> instructions;
  if (isForStaticInit(funcName)) {
    instructions.push_back(std::make_shared<OmpForInit>(callInst));
  } else if (isForStaticFini(funcName)) {
    instructions.push_back(std::make_shared<OmpForFini>(callInst));
  } else if (isSingleStart(funcName)) {
    instructions.push_back(std::make_shared<OpenMPSingleStart>(callInst));
  } else if (isSingleEnd(funcName)) {
    instructions.push_back(std::make_shared<OpenMPSingleEnd>(callInst));
  } else if (isMasterStart(funcName)) {
    instructions.push_back(std::make_shared<OpenMPMasterStart>(callInst));
  } else if (isMasterEnd(funcName)) {
    instructions.push_back(std::make_shared<OpenMPMasterEnd>(callInst));
  } else if (isBarrier(funcName)) {
    instructions.push_back(std::make_shared<OpenMPBarrier>(callInst));
  } else if (isReduceStart(funcName)) {
    instructions.push_back(std::make_shared<OpenMPReduce>(callInst));
  } else if (isReduceNowaitStart(funcName)) {
    instructions.push_back(std::make_shared<OpenMPReduce>(callInst));
  } else if (isCriticalStart(funcName)) {
    instructions.push_back(std::make_shared<OpenMPCriticalStart>(callInst));
  } else if (isCriticalEnd(funcName)) {
    instructions.push_back(std::make_shared<OpenMPCriticalEnd>(callInst));
  } else if (isFork(funcName)) {
    // duplicate omp preprocessing should duplicate all omp fork calls
    auto ompFork = std::make_shared<OpenMPFork>(callInst);
    auto twinOmpFork = getTwinOmpFork(callInst);
    if (!twinOmpFork) {
      // without duplicated fork we cannot detect any races in omp region so just skip it
      llvm::errs() << "Encountered non-duplicated omp fork instruction: " << *callInst << "\n";
      llvm::errs() << "Next Inst was: " << *callInst->getNextNode() << "\n";
      llvm::errs() << "Skipping entire OpenMP region\n";
      return instructions;
    }
    // We matched the next inst as twin omp fork
    ++it;

    // push the two forks and joins such tha the two threads created for the parallel region are in parallel
    instructions.push_back(ompFork);
    instructions.push_back(twinOmpFork);

    // omp fork has implicit join, so immediately join both threads
    instructions.push_back(std::make_shared<OpenMPJoin>(ompFork));
    instructions.push_back(std::make_shared<OpenMPJoin>(twinOmpFork));
  } else {
    // Used to make sure we are not implicitly ignoring any OpenMP features
    // We should instead make sure we take the correct action for any OpenMP call
    assert((!OpenMPModel::isOpenMP(funcName) || OpenMPModel::isNoEffect(funcName)) && "Unhandled OpenMP Call!");
  }
  return instructions;
}

}  // namespace OpenMPModel
