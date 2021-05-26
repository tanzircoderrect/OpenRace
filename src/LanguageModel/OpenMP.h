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

#pragma once

#include <IR/IRImpls.h>
#include <llvm/ADT/StringRef.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/Instructions.h>

#include "IR/IR.h"
#include "LanguageModel/LanguageModeller.h"

namespace OpenMPModel {

class Modeller : public LanguageModeller {
 public:
  [[nodiscard]] std::vector<std::shared_ptr<const race::IR>> getFuncIRRepr(
      llvm::BasicBlock::const_iterator& it, const llvm::CallBase* callInst,
      const llvm::StringRef& funcName) const override;
};

namespace {
// return true of funcName equals any name in names
bool matchesAny(const llvm::StringRef& funcName, const std::vector<llvm::StringRef>& names) {
  for (auto const& name : names) {
    if (funcName.equals(name)) return true;
  }
  return false;
}
}  // namespace

inline bool isFork(const llvm::StringRef& funcName) { return funcName.equals("__kmpc_fork_call"); }
inline bool isFork(const llvm::CallBase* callInst) {
  if (!callInst) return false;
  auto const func = callInst->getCalledFunction();
  if (!func->hasName()) return false;
  return isFork(func->getName());
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

class OpenMPFork : public race::ForkIR {
  // https://github.com/llvm/llvm-project/blob/ef32c611aa214dea855364efd7ba451ec5ec3f74/openmp/runtime/src/kmp_csupport.cpp#L262
  // @param loc  source location information
  // @param argc  total number of arguments in the ellipsis
  // @param microtask  pointer to callback routine consisting of outlined parallel
  // construct
  // @param ...  pointers to shared variables that aren't global
  constexpr static unsigned int threadHandleOffset = 0;
  constexpr static unsigned int threadEntryOffset = 2;
  const llvm::CallBase* inst;

 public:
  explicit OpenMPFork(const llvm::CallBase* inst) : ForkIR(Type::OpenMPFork), inst(inst) {}

  [[nodiscard]] inline const llvm::CallBase* getInst() const override { return inst; }

  [[nodiscard]] const llvm::Value* getThreadHandle() const override {
    return inst->getArgOperand(threadHandleOffset)->stripPointerCasts();
  }

  [[nodiscard]] const llvm::Value* getThreadEntry() const override {
    return inst->getArgOperand(threadEntryOffset)->stripPointerCasts();
  }

  // Used for llvm style RTTI (isa, dyn_cast, etc.)
  static inline bool classof(const IR* e) { return e->type == Type::OpenMPFork; }
};

// This actually corresponds to a OpenMP fork instruction, as the fork call acts as both a fork and join in one call
class OpenMPJoin : public race::JoinIR {
  std::shared_ptr<OpenMPFork> fork;

 public:
  explicit OpenMPJoin(const std::shared_ptr<OpenMPFork> fork) : JoinIR(Type::OpenMPJoin), fork(fork) {}

  [[nodiscard]] inline const llvm::CallBase* getInst() const override { return fork->getInst(); }

  [[nodiscard]] const llvm::Value* getThreadHandle() const override { return fork->getThreadHandle(); }

  // Used for llvm style RTTI (isa, dyn_cast, etc.)
  static inline bool classof(const IR* e) { return e->type == Type::OpenMPJoin; }
};

class OpenMPCriticalStart : public race::LockIR {
  // https://github.com/llvm/llvm-project/blob/ef32c611aa214dea855364efd7ba451ec5ec3f74/openmp/runtime/src/kmp_csupport.cpp#L1157
  // @param loc  source location information
  // @param global_tid  global thread number
  // @param crit identity of the critical section. This could be a pointer to a lock
  // associated with the critical section, or some other suitably unique value
  const unsigned int identityOffset = 2;
  const llvm::CallBase* inst;

 public:
  explicit OpenMPCriticalStart(const llvm::CallBase* call) : LockIR(Type::OpenMPCriticalStart), inst(call) {}

  [[nodiscard]] inline const llvm::CallBase* getInst() const override { return inst; }

  [[nodiscard]] const llvm::Value* getLockValue() const override {
    return inst->getArgOperand(identityOffset)->stripPointerCasts();
  }

  static inline bool classof(const IR* e) { return e->type == Type::OpenMPCriticalStart; }
};

class OpenMPCriticalEnd : public race::UnlockIR {
  // https://github.com/llvm/llvm-project/blob/ef32c611aa214dea855364efd7ba451ec5ec3f74/openmp/runtime/src/kmp_csupport.cpp#L1512
  // @param loc  source location information
  // @param global_tid  global thread number
  // @param crit identity of the critical section. This could be a pointer to a lock
  // associated with the critical section, or some other suitably unique value
  const unsigned int identityOffset = 2;
  const llvm::CallBase* inst;

 public:
  explicit OpenMPCriticalEnd(const llvm::CallBase* call) : UnlockIR(Type::OpenMPCriticalEnd), inst(call) {}

  [[nodiscard]] inline const llvm::CallBase* getInst() const override { return inst; }

  [[nodiscard]] const llvm::Value* getLockValue() const override {
    return inst->getArgOperand(identityOffset)->stripPointerCasts();
  }

  static inline bool classof(const IR* e) { return e->type == Type::OpenMPCriticalEnd; }
};

// https://github.com/llvm/llvm-project/blob/d32170dbd5b0d54436537b6b75beaf44324e0c28/openmp/runtime/src/kmp_csupport.cpp#L713
class OpenMPBarrier : public race::BarrierIR {
  const llvm::CallBase* inst;

 public:
  explicit OpenMPBarrier(const llvm::CallBase* call) : BarrierIR(Type::OpenMPBarrier), inst(call) {}

  [[nodiscard]] inline const llvm::CallBase* getInst() const override { return inst; }
};

using OmpForInit = race::CallIRImpl<race::IR::Type::OpenMPForInit>;
using OmpForFini = race::CallIRImpl<race::IR::Type::OpenMPForFini>;

using OpenMPSingleStart = race::CallIRImpl<race::IR::Type::OpenMPSingleStart>;
using OpenMPSingleEnd = race::CallIRImpl<race::IR::Type::OpenMPSingleEnd>;

using OpenMPReduce = race::CallIRImpl<race::IR::Type::OpenMPReduce>;

using OpenMPMasterStart = race::CallIRImpl<race::IR::Type::OpenMPMasterStart>;
using OpenMPMasterEnd = race::CallIRImpl<race::IR::Type::OpenMPMasterEnd>;

}  // namespace OpenMPModel