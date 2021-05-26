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

#include "IR/Builder.h"

#include <llvm/Analysis/PostDominators.h>
#include <llvm/IR/Dominators.h>
#include <llvm/IR/Instructions.h>

#include "IR/IRImpls.h"
#include "LanguageModel/Intrinsic.h"
#include "LanguageModel/LanguageModeller.h"
#include "LanguageModel/OpenMP.h"
#include "LanguageModel/pthread.h"

using namespace race;

namespace {
bool hasNoAliasMD(const llvm::Instruction *inst) {
  llvm::AAMDNodes AAMD;
  inst->getAAMetadata(AAMD);
  return AAMD.NoAlias != nullptr;
}

bool hasThreadLocalOperand(const llvm::Instruction *inst) {
  auto ptr = getPointerOperand(inst);
  assert(ptr);
  if (auto global = llvm::dyn_cast<llvm::GlobalVariable>(ptr)) {
    return global->isThreadLocal();
  }
  return false;
}

}  // namespace

FunctionSummary race::generateFunctionSummary(const llvm::Function *func) {
  assert(func != nullptr);
  return generateFunctionSummary(*func);
}

FunctionSummary race::generateFunctionSummary(const llvm::Function &func) {
  // TODO move this to a field in a function summary generator type
  std::vector<std::shared_ptr<const LanguageModeller>> modellers = {std::make_shared<OpenMPModel::Modeller>(),
                                                                    std::make_shared<PthreadModel::Modeller>(),
                                                                    /* std::make_shared<IntrinsicModel::Modeller>() */};
  FunctionSummary instructions;

  for (auto const &basicblock : func.getBasicBlockList()) {
  instruction_iteration:
    for (auto it = basicblock.begin(), end = basicblock.end(); it != end; ++it) {
      auto inst = llvm::cast<llvm::Instruction>(it);

      // TODO: try switch on inst->getOpCode instead
      if (auto loadInst = llvm::dyn_cast<llvm::LoadInst>(inst)) {
        if (loadInst->isAtomic() || loadInst->isVolatile() || hasNoAliasMD(loadInst) ||
            hasThreadLocalOperand(loadInst)) {
          continue;
        }
        instructions.push_back(std::make_shared<race::Load>(loadInst));
      } else if (auto storeInst = llvm::dyn_cast<llvm::StoreInst>(inst)) {
        if (storeInst->isAtomic() || storeInst->isVolatile() || hasNoAliasMD(storeInst) ||
            hasThreadLocalOperand(storeInst)) {
          continue;
        }
        instructions.push_back(std::make_shared<race::Store>(storeInst));
      } else if (auto retInst = llvm::dyn_cast<llvm::ReturnInst>(inst)) {
        // TODO: what should this do?
      } else if (auto branchInst = llvm::dyn_cast<llvm::BranchInst>(inst)) {
        // TODO: what should this do?
      } else if (auto switchInst = llvm::dyn_cast<llvm::SwitchInst>(inst)) {
        // TODO: what should this do?
      } else if (auto callInst = llvm::dyn_cast<llvm::CallBase>(inst)) {
        if (callInst->isIndirectCall()) {
          // let trace deal with indirect calls
          instructions.push_back(std::make_shared<race::CallIR>(callInst));
          continue;
        }

        auto calledFunc = callInst->getCalledFunction();
        if (calledFunc == nullptr || !calledFunc->hasName()) {
          // TODO: Log warning
          llvm::errs() << "could not find called func: " << *callInst << "\n";
          continue;
        }

        // TODO: System for usOhers to register new function recognizers here
        auto funcName = calledFunc->getName();
        bool recognised = false;
        auto modellerIter = modellers.begin();
        while (modellerIter != modellers.end() && !recognised) {
          recognised = modellerIter->get()->addFuncIRRepr(instructions, it, callInst, funcName);
          ++modellerIter;
        }

        if (!recognised) {
          // push it, but don't do anything else with it
          instructions.push_back(std::make_shared<race::CallIR>(callInst));
        }
      }
    }
  }

  return instructions;
}