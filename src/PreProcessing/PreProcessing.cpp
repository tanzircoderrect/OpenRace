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

#include "PreProcessing/PreProcessing.h"

// #include <llvm/Analysis/ScalarEvolution.h>
// #include <llvm/IR/Dominators.h>
// #include <llvm/IR/PassManager.h>
// #include <llvm/Passes/PassBuilder.h>
// #include <polly/ScopDetection.h>

#include <llvm/ADT/Triple.h>
#include <llvm/Analysis/GlobalsModRef.h>           // createGlobalsAAWrapperPass
#include <llvm/Analysis/ScopedNoAliasAA.h>         // createScopedNoAliasAAWrapperPass
#include <llvm/Analysis/TypeBasedAliasAnalysis.h>  // createTypeBasedAAWrapperPass
#include <llvm/IR/LegacyPassManager.h>             // createForceFunctionAttrsLegacyPass
#include <llvm/InitializePasses.h>                 // initialize*(PassRegistry) functions
#include <llvm/PassRegistry.h>                     // legacy Pass stuff
#include <llvm/Transforms/IPO.h>  // createIPSCCPPass, createCalledValuePropagationPass, createGlobalOptimizerPass, createDeadArgEliminationPass, createPruneEHPass, createArgumentPromotionPass
#include <llvm/Transforms/IPO/AlwaysInliner.h>        // createAlwaysInlinerLegacyPass
#include <llvm/Transforms/IPO/Attributor.h>           // createAttributorLegacyPass
#include <llvm/Transforms/IPO/ForceFunctionAttrs.h>   // createForceFunctionAttrsLegacyPass
#include <llvm/Transforms/IPO/FunctionAttrs.h>        // createPostOrderFunctionAttrsLegacyPass
#include <llvm/Transforms/IPO/InferFunctionAttrs.h>   // createInferFunctionAttrsLegacyPass
#include <llvm/Transforms/InstCombine/InstCombine.h>  // LLVMAddInstructionCombiningPass
#include <llvm/Transforms/Scalar.h>  // createSROAPass, createEarlyCSEPass, createLowerExpectIntrinsicPass, createCallSiteSplittingPass
#include <llvm/Transforms/Scalar/SimplifyCFG.h>  // createCFGSimplificationPass
#include <llvm/Transforms/Utils.h>               // createEntryExitInstrumenterPass, createCFGSimplificationPass
#include <llvm/Transforms/Utils/Mem2Reg.h>       // createPromoteMemoryToRegisterPass

#include "PreProcessing/Passes/DuplicateOpenMPForks.h"

namespace {

void oldPassPipeline(llvm::Module &module) {
  // Initialize llvm's static PassRegistry
  auto &registry = *llvm::PassRegistry::getPassRegistry();
  llvm::initializeCore(registry);
  llvm::initializeScalarOpts(registry);
  llvm::initializeIPO(registry);
  llvm::initializeAnalysis(registry);
  llvm::initializeTransformUtils(registry);
  llvm::initializeInstCombine(registry);
  llvm::initializeAggressiveInstCombine(registry);
  llvm::initializeInstrumentation(registry);
  llvm::initializeTarget(registry);

  llvm::Triple ModuleTriple(module.getTargetTriple());

  llvm::legacy::PassManager passes;
  llvm::legacy::PassManager prepasses;
  llvm::legacy::FunctionPassManager funcPasses(&module);

  // populateFunctionPassManager
  funcPasses.add(llvm::createEntryExitInstrumenterPass());
  funcPasses.add(llvm::createTypeBasedAAWrapperPass());
  funcPasses.add(llvm::createScopedNoAliasAAWrapperPass());
  funcPasses.add(llvm::createSROAPass());
  funcPasses.add(llvm::createCFGSimplificationPass());
  funcPasses.add(llvm::createSROAPass());
  funcPasses.add(llvm::createEarlyCSEPass());
  funcPasses.add(llvm::createLowerExpectIntrinsicPass());

  // populateModulePassManager
  passes.add(llvm::createForceFunctionAttrsLegacyPass());
  // passes.add(new StandardHeapAPIRewritePass()); // custom pass
  passes.add(llvm::createTypeBasedAAWrapperPass());
  passes.add(llvm::createScopedNoAliasAAWrapperPass());
  passes.add(llvm::createInferFunctionAttrsLegacyPass());
  passes.add(llvm::createCallSiteSplittingPass());
  passes.add(llvm::createIPSCCPPass());
  passes.add(llvm::createCalledValuePropagationPass());
  passes.add(llvm::createAttributorLegacyPass());
  passes.add(llvm::createGlobalOptimizerPass());
  passes.add(llvm::createPromoteMemoryToRegisterPass());
  passes.add(llvm::createDeadArgEliminationPass());
  // LLVMAddInstructionCombiningPass(passes); // off by default
  passes.add(llvm::createCFGSimplificationPass());
  // beforeInlineHooks(passes) // TODO
  passes.add(llvm::createGlobalsAAWrapperPass());
  passes.add(llvm::createPruneEHPass());
  passes.add(llvm::createAlwaysInlinerLegacyPass());
  passes.add(llvm::createPostOrderFunctionAttrsLegacyPass());
  passes.add(llvm::createArgumentPromotionPass());
  // addFunctionSimplificationPasses(MPM); // TODO
  // passes.add(new WrapperFunIdentifyPass()); // custom pass
  passes.add(llvm::createAlwaysInlinerLegacyPass());
  passes.add(llvm::createPostOrderFunctionAttrsLegacyPass());
  passes.add(llvm::createArgumentPromotionPass());
  // addFunctionSimplificationPasses(MPM); // TODO
  passes.add(llvm::createBarrierNoopPass());
  passes.add(llvm::createEliminateAvailableExternallyPass());
  passes.add(llvm::createReversePostOrderFunctionAttrsPass());
  passes.add(llvm::createGlobalOptimizerPass());
  passes.add(llvm::createGlobalDCEPass());
  passes.add(llvm::createLoopSimplifyPass());
  passes.add(llvm::createIndVarSimplifyPass());

  // populatePreProcessingModuleManager
  // prepasses.add(new LoweringMemCpyPass()); // custom
  // prepasses.add(new TransformCallInstBitCastPass()); // custom

  prepasses.run(module);

  funcPasses.doInitialization();
  for (auto &func : module.getFunctionList()) {
    funcPasses.run(func);
  }
  funcPasses.doFinalization();

  passes.run(module);
}

}  // namespace

void preprocess(llvm::Module &module) {
  // llvm::FunctionAnalysisManager FAM;
  // llvm::FunctionPassManager FPM;
  // FPM.addPass(llvm::ScalarEvolutionWrapperPass());
  // FPM.run(module.getFunctionList().front(), FAM);

  // llvm::ModuleAnalysisManager MAM;
  // llvm::ModulePassManager MPM;
  // MPM.addPass(llvm::createModuleToFunctionPassAdaptor(std::move(FPM)));
  // MPM.run(module, MAM);

  // llvm::ScalarEvolutionAnalysis SCEV;
  // llvm::FunctionAnalysisManager FAM;
  // FAM.registerPass([&] { return llvm::LoopAnalysis(); });
  // FAM.registerPass([&] { return llvm::PassInstrumentationAnalysis(); });
  // FAM.registerPass([&] { return llvm::DominatorTreeAnalysis(); });
  // FAM.registerPass([&] { return llvm::TargetLibraryAnalysis(); });
  // auto result = SCEV.run(module.getFunctionList().front(), FAM);
  // result.print(llvm::outs());

  // llvm::PassBuilder PB;
  // llvm::FunctionAnalysisManager FAM;
  // llvm::FunctionPassManager FPM;
  // FPM.addPass(polly::ScopAnalysisPrinterPass(llvm::errs()));
  // // auto FPM = PB.buildFunctionSimplificationPipeline(llvm::PassBuilder::OptimizationLevel::O2,
  // //                                                   llvm::PassBuilder::ThinLTOPhase::None);
  // PB.registerFunctionAnalyses(FAM);
  // auto &scev = FAM.getResult<llvm::ScalarEvolutionAnalysis>(*module.getFunction(".omp_outlined._debug__"));
  // scev.print(llvm::outs());
  // scev.getSCEV()

  duplicateOpenMPForks(module);
}