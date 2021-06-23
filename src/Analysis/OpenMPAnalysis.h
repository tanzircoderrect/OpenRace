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

#include <llvm/Passes/PassBuilder.h>

#include "Trace/Event.h"
#include "Trace/ThreadTrace.h"

namespace race {

struct Region {
  EventID start;
  EventID end;

  Region(EventID start, EventID end) : start(start), end(end) {}

  inline bool contains(EventID e) const { return end >= e && e >= start; }
};

class ReduceAnalysis {
  using ReduceInst = const llvm::Instruction*;

  // cached map of reduce instructions to the blocks that make up the reduction code
  mutable std::map<ReduceInst, std::vector<const llvm::BasicBlock*>> reduceBlocks;

  // Compute list of blocks, insert into reduceBlocks cache, and return
  std::vector<const llvm::BasicBlock*>& computeGuardedBlocks(ReduceInst reduce) const;

  // list of blocks guarded by a reduce. Check cache first, else compute and store in cache
  const std::vector<const llvm::BasicBlock*>& getReduceBlocks(ReduceInst reduce) const;

 public:
  // return true if inst is inside of code blocks making up belonging to reduce
  bool reduceContains(const llvm::Instruction* reduce, const llvm::Instruction* inst) const;
};

class SimpleGetThreadNumAnalysis {
  // map of blocks to the tid they are guarded by
  // simple implementation can only handle one block being guarded
  std::map<const llvm::BasicBlock*, u_int64_t> guardedBlocks;

  // compute any guarded blocks for this omp_get_thread call and add them to the guardedBlocks map
  void computeGuardedBlocks(const Event* event);

  // set of functions who's guarded blocks have already been computed
  std::set<const llvm::Function*> visited;

  // Get the tid that guards this event or None if it is not guarded
  std::optional<u_int64_t> getGuardedBy(const Event* event) const;

 public:
  SimpleGetThreadNumAnalysis(const ProgramTrace& program);

  // Check if both events are guaranteed to be executed by a particular thread
  // via a branch on omp_get_thread_num checked against a constant value
  bool guardedBySameTid(const Event* event1, const Event* event2) const;
};

class OpenMPAnalysis {
  llvm::PassBuilder PB;
  llvm::FunctionAnalysisManager FAM;

  ReduceAnalysis reduceAnalysis;
  SimpleGetThreadNumAnalysis getThreadNumAnalysis;

  // Start/End of omp loop
  using LoopRegion = Region;

  // per-thread map of omp for loop regions
  std::map<ThreadID, std::vector<LoopRegion>> ompForLoops;

  // get cached list of loop regions, else create them
  const std::vector<LoopRegion>& getOmpForLoops(const ThreadTrace& trace);

  bool inParallelFor(const race::MemAccessEvent* event);

 public:
  OpenMPAnalysis(const ProgramTrace& program);

  // return true if events are array accesses who's access sets could overlap
  bool canIndexOverlap(const race::MemAccessEvent* event1, const race::MemAccessEvent* event2);

  // return true if both events are array accesses in an omp loop
  bool isLoopArrayAccess(const race::MemAccessEvent* event1, const race::MemAccessEvent* event2);

  // return true if event is an array access, not every getelementptr is an array access
  bool isArrayAccess(const llvm::GetElementPtrInst* gep);

  // return true if both events are part of the same omp team
  bool fromSameParallelRegion(const Event* event1, const Event* event2) const;

  // return true if both events are in the same single region
  // Call assumes the events are on different threads but in the same team
  bool inSameSingleBlock(const Event* event1, const Event* event2) const;

  // return true if both events are inside of the same reduce region
  // we do not distinguise between reduce and reduce_nowait
  bool inSameReduce(const Event* event1, const Event* event2) const;

  // return true if both events are inside any master region of the same team
  // similar with single; only one thread executes, but for master, a specific thread executes
  bool bothInMasterBlock(const Event* event1, const Event* event2) const;

  // return true if both events are in compatible sections
  static bool insideCompatibleSections(const Event* event1, const Event* event2);

  // return true if both events are gauranteed to execute on the same thread
  // by a check against omp_get_thread_num
  bool guardedBySameTid(const Event* event1, const Event* event2) const {
    return getThreadNumAnalysis.guardedBySameTid(event1, event2);
  }
};

}  // namespace race
