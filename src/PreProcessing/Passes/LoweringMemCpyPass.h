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

#include <llvm/IR/PassManager.h>
#include <llvm/Pass.h>

class LoweringMemcpyPass : public llvm::PassInfoMixin<LoweringMemcpyPass> {
 public:
  llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &AM);
  static bool isRequired() { return true; }
};

// Kept for PTA unit test only
class LoweringMemCpyLegacyPass : public llvm::ModulePass {
 public:
  static char ID;
  explicit LoweringMemCpyLegacyPass() : llvm::ModulePass(ID) {}

  bool runOnModule(llvm::Module &) override;
};