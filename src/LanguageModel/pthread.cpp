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

#include "LanguageModel/pthread.h"

namespace PthreadModel {

std::vector<std::shared_ptr<const race::IR>> Modeller::getFuncIRRepr(llvm::BasicBlock::const_iterator& it,
                                                                     const llvm::CallBase* callInst,
                                                                     const llvm::StringRef& funcName) const {
  std::vector<std::shared_ptr<const race::IR>> instructions;
  if (isPthreadCreate(funcName)) {
    instructions.push_back(std::make_shared<PthreadCreate>(callInst));
  } else if (isPthreadJoin(funcName)) {
    instructions.push_back(std::make_shared<PthreadJoin>(callInst));
  } else if (isPthreadMutexLock(funcName)) {
    instructions.push_back(std::make_shared<PthreadMutexLock>(callInst));
  } else if (isPthreadMutexUnlock(funcName)) {
    instructions.push_back(std::make_shared<PthreadMutexUnlock>(callInst));
  } else if (isPthreadSpinLock(funcName)) {
    instructions.push_back(std::make_shared<PthreadSpinLock>(callInst));
  } else if (isPthreadSpinUnlock(funcName)) {
    instructions.push_back(std::make_shared<PthreadSpinUnlock>(callInst));
  }
  return instructions;
}

}  // namespace PthreadModel
