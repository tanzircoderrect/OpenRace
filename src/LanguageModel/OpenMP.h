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

bool isFork(const llvm::StringRef& funcName);
bool isFork(const llvm::CallBase* callInst);

class Modeller : public LanguageModeller {
 public:
  [[nodiscard]] bool addFuncIRRepr(std::vector<std::shared_ptr<const race::IR>>& instructions,
                                   llvm::BasicBlock::const_iterator& it, const llvm::CallBase* callInst,
                                   const llvm::StringRef& funcName) const override;
};

class Fork : public race::ForkIR {
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
  explicit Fork(const llvm::CallBase* inst);

  [[nodiscard]] const llvm::CallBase* getInst() const override;

  [[nodiscard]] const llvm::Value* getThreadHandle() const override;

  [[nodiscard]] const llvm::Value* getThreadEntry() const override;

  // Used for llvm style RTTI (isa, dyn_cast, etc.)
  static bool classof(const IR* e);
};

// This actually corresponds to a OpenMP fork instruction, as the fork call acts as both a fork and join in one call
class Join : public race::JoinIR {
  std::shared_ptr<Fork> fork;

 public:
  explicit Join(std::shared_ptr<Fork> fork);

  [[nodiscard]] const llvm::CallBase* getInst() const override;

  [[nodiscard]] const llvm::Value* getThreadHandle() const override;

  // Used for llvm style RTTI (isa, dyn_cast, etc.)
  static bool classof(const IR* e);
};

class CriticalStart : public race::LockIR {
  // https://github.com/llvm/llvm-project/blob/ef32c611aa214dea855364efd7ba451ec5ec3f74/openmp/runtime/src/kmp_csupport.cpp#L1157
  // @param loc  source location information
  // @param global_tid  global thread number
  // @param crit identity of the critical section. This could be a pointer to a lock
  // associated with the critical section, or some other suitably unique value
  const unsigned int identityOffset = 2;
  const llvm::CallBase* inst;

 public:
  explicit CriticalStart(const llvm::CallBase* call);

  [[nodiscard]] const llvm::CallBase* getInst() const override;

  [[nodiscard]] const llvm::Value* getLockValue() const override;

  static bool classof(const IR* e);
};

class CriticalEnd : public race::UnlockIR {
  // https://github.com/llvm/llvm-project/blob/ef32c611aa214dea855364efd7ba451ec5ec3f74/openmp/runtime/src/kmp_csupport.cpp#L1512
  // @param loc  source location information
  // @param global_tid  global thread number
  // @param crit identity of the critical section. This could be a pointer to a lock
  // associated with the critical section, or some other suitably unique value
  const unsigned int identityOffset = 2;
  const llvm::CallBase* inst;

 public:
  explicit CriticalEnd(const llvm::CallBase* call);

  [[nodiscard]] const llvm::CallBase* getInst() const override;

  [[nodiscard]] const llvm::Value* getLockValue() const override;

  static bool classof(const IR* e);
};

// https://github.com/llvm/llvm-project/blob/d32170dbd5b0d54436537b6b75beaf44324e0c28/openmp/runtime/src/kmp_csupport.cpp#L713
class Barrier : public race::BarrierIR {
  const llvm::CallBase* inst;

 public:
  explicit Barrier(const llvm::CallBase* call);

  [[nodiscard]] const llvm::CallBase* getInst() const override;
};

using ForInit = race::CallIRImpl<race::IR::Type::OpenMPForInit>;
using ForFini = race::CallIRImpl<race::IR::Type::OpenMPForFini>;

using SingleStart = race::CallIRImpl<race::IR::Type::OpenMPSingleStart>;
using SingleEnd = race::CallIRImpl<race::IR::Type::OpenMPSingleEnd>;

using Reduce = race::CallIRImpl<race::IR::Type::OpenMPReduce>;

using MasterStart = race::CallIRImpl<race::IR::Type::OpenMPMasterStart>;
using MasterEnd = race::CallIRImpl<race::IR::Type::OpenMPMasterEnd>;

}  // namespace OpenMPModel