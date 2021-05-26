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

#include <llvm/IR/Instructions.h>

#include "IR/IR.h"
#include "IR/IRImpls.h"
#include "LanguageModel/LanguageModeller.h"
#include "llvm/ADT/StringRef.h"

namespace PthreadModel {

bool isPthreadCreate(const llvm::StringRef &funcName);

class Modeller : public LanguageModeller {
 public:
  [[nodiscard]] bool addFuncIRRepr(std::vector<std::shared_ptr<const race::IR>> &instructions,
                                   llvm::BasicBlock::const_iterator &it, const llvm::CallBase *callInst,
                                   const llvm::StringRef &funcName) const override;
};

class Create : public race::ForkIR {
  constexpr static unsigned int threadHandleOffset = 0;
  constexpr static unsigned int threadEntryOffset = 2;
  const llvm::CallBase *inst;

 public:
  explicit Create(const llvm::CallBase *inst) : ForkIR(Type::PthreadCreate), inst(inst) {}

  [[nodiscard]] inline const llvm::CallBase *getInst() const override { return inst; }

  [[nodiscard]] const llvm::Value *getThreadHandle() const override {
    return inst->getArgOperand(threadHandleOffset)->stripPointerCasts();
  }

  [[nodiscard]] const llvm::Value *getThreadEntry() const override {
    return inst->getArgOperand(threadEntryOffset)->stripPointerCasts();
  }

  // Used for llvm style RTTI (isa, dyn_cast, etc.)
  static inline bool classof(const IR *e) { return e->type == Type::PthreadCreate; }
};

class Join : public race::JoinIR {
  const unsigned int threadHandleOffset = 0;
  const llvm::CallBase *inst;

 public:
  explicit Join(const llvm::CallBase *inst) : JoinIR(Type::PthreadJoin), inst(inst) {}

  [[nodiscard]] inline const llvm::CallBase *getInst() const override { return inst; }

  [[nodiscard]] const llvm::Value *getThreadHandle() const override {
    return inst->getArgOperand(threadHandleOffset)->stripPointerCasts();
  }

  // Used for llvm style RTTI (isa, dyn_cast, etc.)
  static inline bool classof(const IR *e) { return e->type == Type::PthreadJoin; }
};

// NOTE: if a specific API semantic is the same as default impl,
// create a type alias.
using MutexLock = race::LockIRImpl<race::IR::Type::PthreadMutexLock>;
using SpinLock = race::LockIRImpl<race::IR::Type::PthreadSpinLock>;

// NOTE: if a specific API semantic is the same as default impl,
// create a type alias.
using MutexUnlock = race::UnlockIRImpl<race::IR::Type::PthreadMutexUnlock>;
using PthreadSpinUnlock = race::UnlockIRImpl<race::IR::Type::PthreadSpinUnlock>;

}  // namespace PthreadModel