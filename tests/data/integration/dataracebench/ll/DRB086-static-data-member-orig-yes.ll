; ModuleID = 'DRB086-static-data-member-orig-yes.cpp'
source_filename = "DRB086-static-data-member-orig-yes.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%class.A = type { i8 }
%struct.ident_t = type { i32, i32, i32, i32, i8* }
%"class.std::basic_ostream" = type { i32 (...)**, %"class.std::basic_ios" }
%"class.std::basic_ios" = type { %"class.std::ios_base", %"class.std::basic_ostream"*, i8, i8, %"class.std::basic_streambuf"*, %"class.std::ctype"*, %"class.std::num_put"*, %"class.std::num_get"* }
%"class.std::ios_base" = type { i32 (...)**, i64, i64, i32, i32, i32, %"struct.std::ios_base::_Callback_list"*, %"struct.std::ios_base::_Words", [8 x %"struct.std::ios_base::_Words"], i32, %"struct.std::ios_base::_Words"*, %"class.std::locale" }
%"struct.std::ios_base::_Callback_list" = type { %"struct.std::ios_base::_Callback_list"*, void (i32, %"class.std::ios_base"*, i32)*, i32, i32 }
%"struct.std::ios_base::_Words" = type { i8*, i64 }
%"class.std::locale" = type { %"class.std::locale::_Impl"* }
%"class.std::locale::_Impl" = type { i32, %"class.std::locale::facet"**, i64, %"class.std::locale::facet"**, i8** }
%"class.std::locale::facet" = type <{ i32 (...)**, i32, [4 x i8] }>
%"class.std::basic_streambuf" = type { i32 (...)**, i8*, i8*, i8*, i8*, i8*, i8*, %"class.std::locale" }
%"class.std::ctype" = type <{ %"class.std::locale::facet.base", [4 x i8], %struct.__locale_struct*, i8, [7 x i8], i32*, i32*, i16*, i8, [256 x i8], [256 x i8], i8, [6 x i8] }>
%"class.std::locale::facet.base" = type <{ i32 (...)**, i32 }>
%struct.__locale_struct = type { [13 x %struct.__locale_data*], i16*, i32*, i32*, [13 x i8*] }
%struct.__locale_data = type opaque
%"class.std::num_put" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::num_get" = type { %"class.std::locale::facet.base", [4 x i8] }
%"class.std::ios_base::Init" = type { i8 }

$__clang_call_terminate = comdat any

$_ZTWN1A8pcounterE = comdat any

@a = dso_local global %class.A zeroinitializer, align 1, !dbg !0
@_ZN1A7counterE = dso_local global i32 0, align 4, !dbg !35
@_ZN1A8pcounterE = dso_local thread_local global i32 0, align 4, !dbg !41
@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr global %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [52 x i8] c";DRB086-static-data-member-orig-yes.cpp;main;78;3;;\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"A::pcounter == 1\00", align 1
@.str.2 = private unnamed_addr constant [39 x i8] c"DRB086-static-data-member-orig-yes.cpp\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@_ZSt4cout = external dso_local global %"class.std::basic_ostream", align 8
@.str.3 = private unnamed_addr constant [2 x i8] c" \00", align 1
@_ZStL8__ioinit = internal global %"class.std::ios_base::Init" zeroinitializer, align 1, !dbg !8
@__dso_handle = external hidden global i8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_DRB086_static_data_member_orig_yes.cpp, i8* null }]

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @_Z3foov() #0 !dbg !936 {
entry:
  %0 = load i32, i32* @_ZN1A7counterE, align 4, !dbg !937
  %inc = add nsw i32 %0, 1, !dbg !937
  store i32 %inc, i32* @_ZN1A7counterE, align 4, !dbg !937
  %1 = load i32, i32* @_ZN1A8pcounterE, align 4, !dbg !938
  %inc1 = add nsw i32 %1, 1, !dbg !938
  store i32 %inc1, i32* @_ZN1A8pcounterE, align 4, !dbg !938
  ret void, !dbg !939
}

; Function Attrs: noinline norecurse optnone uwtable
define dso_local i32 @main() #1 !dbg !940 {
entry:
  %retval = alloca i32, align 4
  %.kmpc_loc.addr = alloca %struct.ident_t, align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %struct.ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 24, i1 false)
  store i32 0, i32* %retval, align 4
  %2 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !941
  store i8* getelementptr inbounds ([52 x i8], [52 x i8]* @1, i32 0, i32 0), i8** %2, align 8, !dbg !941
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* %.kmpc_loc.addr, i32 0, void (i32*, i32*, ...)* bitcast (void (i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*)), !dbg !941
  %3 = load i32, i32* @_ZN1A8pcounterE, align 4, !dbg !942
  %cmp = icmp eq i32 %3, 1, !dbg !942
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !942

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !942

cond.false:                                       ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.2, i64 0, i64 0), i32 82, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #12, !dbg !942
  unreachable, !dbg !942

4:                                                ; No predecessors!
  br label %cond.end, !dbg !942

cond.end:                                         ; preds = %4, %cond.true
  %5 = load i32, i32* @_ZN1A7counterE, align 4, !dbg !943
  %call = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* @_ZSt4cout, i32 %5), !dbg !944
  %call1 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272) %call, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)), !dbg !945
  %6 = load i32, i32* @_ZN1A8pcounterE, align 4, !dbg !946
  %call2 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"* %call1, i32 %6), !dbg !947
  %call3 = call dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"* %call2, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_), !dbg !948
  ret i32 0, !dbg !949
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined._debug__(i32* noalias %.global_tid., i32* noalias %.bound_tid.) #2 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) !dbg !950 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !957, metadata !DIExpression()), !dbg !958
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !959, metadata !DIExpression()), !dbg !958
  invoke void @_Z3foov()
          to label %invoke.cont unwind label %terminate.lpad, !dbg !960

invoke.cont:                                      ; preds = %entry
  ret void, !dbg !962

terminate.lpad:                                   ; preds = %entry
  %0 = landingpad { i8*, i32 }
          catch i8* null, !dbg !960
  %1 = extractvalue { i8*, i32 } %0, 0, !dbg !960
  call void @__clang_call_terminate(i8* %1) #12, !dbg !960
  unreachable, !dbg !960
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) #4 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #10
  call void @_ZSt9terminatev() #12
  unreachable
}

declare dso_local i8* @__cxa_begin_catch(i8*)

declare dso_local void @_ZSt9terminatev()

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid.) #2 !dbg !963 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !964, metadata !DIExpression()), !dbg !965
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !966, metadata !DIExpression()), !dbg !965
  %0 = load i32*, i32** %.global_tid..addr, align 8, !dbg !967
  %1 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !967
  call void @.omp_outlined._debug__(i32* %0, i32* %1) #10, !dbg !967
  ret void, !dbg !967
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare !callback !968 dso_local void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...)

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #6

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc(%"class.std::basic_ostream"* dereferenceable(272), i8*) #7

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEi(%"class.std::basic_ostream"*, i32) #7

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZNSolsEPFRSoS_E(%"class.std::basic_ostream"*, %"class.std::basic_ostream"* (%"class.std::basic_ostream"*)*) #7

declare dso_local dereferenceable(272) %"class.std::basic_ostream"* @_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_(%"class.std::basic_ostream"* dereferenceable(272)) #7

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #8 section ".text.startup" !dbg !970 {
entry:
  call void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"* @_ZStL8__ioinit), !dbg !971
  %0 = call i32 @__cxa_atexit(void (i8*)* bitcast (void (%"class.std::ios_base::Init"*)* @_ZNSt8ios_base4InitD1Ev to void (i8*)*), i8* getelementptr inbounds (%"class.std::ios_base::Init", %"class.std::ios_base::Init"* @_ZStL8__ioinit, i32 0, i32 0), i8* @__dso_handle) #10, !dbg !971
  ret void, !dbg !971
}

declare dso_local void @_ZNSt8ios_base4InitC1Ev(%"class.std::ios_base::Init"*) unnamed_addr #7

; Function Attrs: nounwind
declare dso_local void @_ZNSt8ios_base4InitD1Ev(%"class.std::ios_base::Init"*) unnamed_addr #9

; Function Attrs: nounwind
declare dso_local i32 @__cxa_atexit(void (i8*)*, i8*, i8*) #10

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_DRB086_static_data_member_orig_yes.cpp() #8 section ".text.startup" !dbg !972 {
entry:
  call void @__cxx_global_var_init(), !dbg !974
  ret void
}

; Function Attrs: noinline uwtable
define weak_odr hidden i32* @_ZTWN1A8pcounterE() #11 comdat {
  ret i32* @_ZN1A8pcounterE
}

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone speculatable willreturn }
attributes #4 = { noinline noreturn nounwind }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #8 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #9 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #10 = { nounwind }
attributes #11 = { noinline uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #12 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!932, !933, !934}
!llvm.ident = !{!935}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 68, type: !38, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !3, producer: "clang version 10.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, imports: !43, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "DRB086-static-data-member-orig-yes.cpp", directory: "/home/yanze/code/OpenRace/tests/data/integration/dataracebench")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!7 = !{!8, !35, !41, !0}
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "__ioinit", linkageName: "_ZStL8__ioinit", scope: !10, file: !11, line: 74, type: !12, isLocal: true, isDefinition: true)
!10 = !DINamespace(name: "std", scope: null)
!11 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/iostream", directory: "")
!12 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Init", scope: !14, file: !13, line: 603, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !15, identifier: "_ZTSNSt8ios_base4InitE")
!13 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/bits/ios_base.h", directory: "")
!14 = !DICompositeType(tag: DW_TAG_class_type, name: "ios_base", scope: !10, file: !13, line: 228, flags: DIFlagFwdDecl)
!15 = !{!16, !20, !21, !25, !26, !31}
!16 = !DIDerivedType(tag: DW_TAG_member, name: "_S_refcount", scope: !12, file: !13, line: 616, baseType: !17, flags: DIFlagStaticMember)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Atomic_word", file: !18, line: 32, baseType: !19)
!18 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/x86_64-pc-linux-gnu/bits/atomic_word.h", directory: "")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "_S_synced_with_stdio", scope: !12, file: !13, line: 617, baseType: !6, flags: DIFlagStaticMember)
!21 = !DISubprogram(name: "Init", scope: !12, file: !13, line: 607, type: !22, scopeLine: 607, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!22 = !DISubroutineType(types: !23)
!23 = !{null, !24}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!25 = !DISubprogram(name: "~Init", scope: !12, file: !13, line: 608, type: !22, scopeLine: 608, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!26 = !DISubprogram(name: "Init", scope: !12, file: !13, line: 611, type: !27, scopeLine: 611, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!27 = !DISubroutineType(types: !28)
!28 = !{null, !24, !29}
!29 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !30, size: 64)
!30 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !12)
!31 = !DISubprogram(name: "operator=", linkageName: "_ZNSt8ios_base4InitaSERKS0_", scope: !12, file: !13, line: 612, type: !32, scopeLine: 612, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!32 = !DISubroutineType(types: !33)
!33 = !{!34, !24, !29}
!34 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !12, size: 64)
!35 = !DIGlobalVariableExpression(var: !36, expr: !DIExpression())
!36 = distinct !DIGlobalVariable(name: "counter", linkageName: "_ZN1A7counterE", scope: !2, file: !3, line: 65, type: !19, isLocal: false, isDefinition: true, declaration: !37)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "counter", scope: !38, file: !3, line: 60, baseType: !19, flags: DIFlagPublic | DIFlagStaticMember)
!38 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "A", file: !3, line: 58, size: 8, flags: DIFlagTypePassByValue, elements: !39, identifier: "_ZTS1A")
!39 = !{!37, !40}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "pcounter", scope: !38, file: !3, line: 61, baseType: !19, flags: DIFlagPublic | DIFlagStaticMember)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(name: "pcounter", linkageName: "_ZN1A8pcounterE", scope: !2, file: !3, line: 66, type: !19, isLocal: false, isDefinition: true, declaration: !40)
!43 = !{!44, !63, !66, !71, !79, !87, !91, !98, !102, !106, !108, !110, !114, !126, !130, !136, !142, !144, !148, !152, !156, !160, !172, !174, !178, !182, !186, !188, !194, !198, !202, !204, !206, !210, !218, !222, !226, !230, !232, !238, !240, !247, !252, !256, !261, !265, !269, !273, !275, !277, !281, !285, !289, !291, !295, !299, !301, !303, !307, !313, !318, !323, !324, !325, !326, !327, !328, !329, !330, !331, !332, !333, !388, !392, !396, !403, !407, !410, !413, !416, !418, !420, !422, !425, !428, !431, !434, !437, !439, !444, !448, !451, !454, !456, !458, !460, !462, !465, !468, !471, !474, !477, !479, !483, !487, !492, !498, !500, !502, !504, !506, !508, !510, !512, !514, !516, !518, !520, !522, !524, !528, !532, !538, !542, !547, !549, !553, !557, !561, !571, !575, !579, !583, !587, !591, !595, !599, !603, !607, !611, !615, !619, !621, !625, !629, !633, !639, !643, !647, !649, !653, !657, !663, !665, !669, !673, !677, !681, !685, !689, !693, !694, !695, !696, !698, !699, !700, !701, !702, !703, !704, !708, !714, !719, !723, !725, !727, !729, !731, !738, !742, !746, !750, !754, !758, !763, !767, !769, !773, !779, !783, !788, !790, !792, !796, !800, !802, !804, !806, !808, !812, !814, !816, !820, !824, !828, !832, !836, !840, !842, !846, !850, !854, !858, !860, !862, !866, !870, !871, !872, !873, !874, !875, !881, !884, !885, !887, !889, !891, !893, !897, !899, !901, !903, !905, !907, !909, !911, !913, !917, !921, !923, !927, !931}
!44 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !45, file: !62, line: 64)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !46, line: 6, baseType: !47)
!46 = !DIFile(filename: "/usr/include/bits/types/mbstate_t.h", directory: "")
!47 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !48, line: 21, baseType: !49)
!48 = !DIFile(filename: "/usr/include/bits/types/__mbstate_t.h", directory: "")
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !48, line: 13, size: 64, flags: DIFlagTypePassByValue, elements: !50, identifier: "_ZTS11__mbstate_t")
!50 = !{!51, !52}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "__count", scope: !49, file: !48, line: 15, baseType: !19, size: 32)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "__value", scope: !49, file: !48, line: 20, baseType: !53, size: 32, offset: 32)
!53 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !49, file: !48, line: 16, size: 32, flags: DIFlagTypePassByValue, elements: !54, identifier: "_ZTSN11__mbstate_tUt_E")
!54 = !{!55, !57}
!55 = !DIDerivedType(tag: DW_TAG_member, name: "__wch", scope: !53, file: !48, line: 18, baseType: !56, size: 32)
!56 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "__wchb", scope: !53, file: !48, line: 19, baseType: !58, size: 32)
!58 = !DICompositeType(tag: DW_TAG_array_type, baseType: !59, size: 32, elements: !60)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !{!61}
!61 = !DISubrange(count: 4)
!62 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/cwchar", directory: "")
!63 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !64, file: !62, line: 141)
!64 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !65, line: 20, baseType: !56)
!65 = !DIFile(filename: "/usr/include/bits/types/wint_t.h", directory: "")
!66 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !67, file: !62, line: 143)
!67 = !DISubprogram(name: "btowc", scope: !68, file: !68, line: 284, type: !69, flags: DIFlagPrototyped, spFlags: 0)
!68 = !DIFile(filename: "/usr/include/wchar.h", directory: "")
!69 = !DISubroutineType(types: !70)
!70 = !{!64, !19}
!71 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !72, file: !62, line: 144)
!72 = !DISubprogram(name: "fgetwc", scope: !68, file: !68, line: 729, type: !73, flags: DIFlagPrototyped, spFlags: 0)
!73 = !DISubroutineType(types: !74)
!74 = !{!64, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !77, line: 5, baseType: !78)
!77 = !DIFile(filename: "/usr/include/bits/types/__FILE.h", directory: "")
!78 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !77, line: 4, flags: DIFlagFwdDecl, identifier: "_ZTS8_IO_FILE")
!79 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !80, file: !62, line: 145)
!80 = !DISubprogram(name: "fgetws", scope: !68, file: !68, line: 758, type: !81, flags: DIFlagPrototyped, spFlags: 0)
!81 = !DISubroutineType(types: !82)
!82 = !{!83, !85, !19, !86}
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !84, size: 64)
!84 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!85 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !83)
!86 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !75)
!87 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !88, file: !62, line: 146)
!88 = !DISubprogram(name: "fputwc", scope: !68, file: !68, line: 743, type: !89, flags: DIFlagPrototyped, spFlags: 0)
!89 = !DISubroutineType(types: !90)
!90 = !{!64, !84, !75}
!91 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !92, file: !62, line: 147)
!92 = !DISubprogram(name: "fputws", scope: !68, file: !68, line: 765, type: !93, flags: DIFlagPrototyped, spFlags: 0)
!93 = !DISubroutineType(types: !94)
!94 = !{!19, !95, !86}
!95 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !97, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !84)
!98 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !99, file: !62, line: 148)
!99 = !DISubprogram(name: "fwide", scope: !68, file: !68, line: 573, type: !100, flags: DIFlagPrototyped, spFlags: 0)
!100 = !DISubroutineType(types: !101)
!101 = !{!19, !75, !19}
!102 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !103, file: !62, line: 149)
!103 = !DISubprogram(name: "fwprintf", scope: !68, file: !68, line: 580, type: !104, flags: DIFlagPrototyped, spFlags: 0)
!104 = !DISubroutineType(types: !105)
!105 = !{!19, !86, !95, null}
!106 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !107, file: !62, line: 150)
!107 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !68, file: !68, line: 642, type: !104, flags: DIFlagPrototyped, spFlags: 0)
!108 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !109, file: !62, line: 151)
!109 = !DISubprogram(name: "getwc", scope: !68, file: !68, line: 730, type: !73, flags: DIFlagPrototyped, spFlags: 0)
!110 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !111, file: !62, line: 152)
!111 = !DISubprogram(name: "getwchar", scope: !68, file: !68, line: 736, type: !112, flags: DIFlagPrototyped, spFlags: 0)
!112 = !DISubroutineType(types: !113)
!113 = !{!64}
!114 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !115, file: !62, line: 153)
!115 = !DISubprogram(name: "mbrlen", scope: !68, file: !68, line: 307, type: !116, flags: DIFlagPrototyped, spFlags: 0)
!116 = !DISubroutineType(types: !117)
!117 = !{!118, !121, !118, !124}
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !119, line: 46, baseType: !120)
!119 = !DIFile(filename: "llvm-project/build/lib/clang/10.0.1/include/stddef.h", directory: "/home/yanze/code")
!120 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!121 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !122)
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !123, size: 64)
!123 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !59)
!124 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !125)
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!126 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !127, file: !62, line: 154)
!127 = !DISubprogram(name: "mbrtowc", scope: !68, file: !68, line: 296, type: !128, flags: DIFlagPrototyped, spFlags: 0)
!128 = !DISubroutineType(types: !129)
!129 = !{!118, !85, !121, !118, !124}
!130 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !131, file: !62, line: 155)
!131 = !DISubprogram(name: "mbsinit", scope: !68, file: !68, line: 292, type: !132, flags: DIFlagPrototyped, spFlags: 0)
!132 = !DISubroutineType(types: !133)
!133 = !{!19, !134}
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 64)
!135 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !45)
!136 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !137, file: !62, line: 156)
!137 = !DISubprogram(name: "mbsrtowcs", scope: !68, file: !68, line: 337, type: !138, flags: DIFlagPrototyped, spFlags: 0)
!138 = !DISubroutineType(types: !139)
!139 = !{!118, !85, !140, !118, !124}
!140 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !141)
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!142 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !143, file: !62, line: 157)
!143 = !DISubprogram(name: "putwc", scope: !68, file: !68, line: 744, type: !89, flags: DIFlagPrototyped, spFlags: 0)
!144 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !145, file: !62, line: 158)
!145 = !DISubprogram(name: "putwchar", scope: !68, file: !68, line: 750, type: !146, flags: DIFlagPrototyped, spFlags: 0)
!146 = !DISubroutineType(types: !147)
!147 = !{!64, !84}
!148 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !149, file: !62, line: 160)
!149 = !DISubprogram(name: "swprintf", scope: !68, file: !68, line: 590, type: !150, flags: DIFlagPrototyped, spFlags: 0)
!150 = !DISubroutineType(types: !151)
!151 = !{!19, !85, !118, !95, null}
!152 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !153, file: !62, line: 162)
!153 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !68, file: !68, line: 649, type: !154, flags: DIFlagPrototyped, spFlags: 0)
!154 = !DISubroutineType(types: !155)
!155 = !{!19, !95, !95, null}
!156 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !157, file: !62, line: 163)
!157 = !DISubprogram(name: "ungetwc", scope: !68, file: !68, line: 773, type: !158, flags: DIFlagPrototyped, spFlags: 0)
!158 = !DISubroutineType(types: !159)
!159 = !{!64, !64, !75}
!160 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !161, file: !62, line: 164)
!161 = !DISubprogram(name: "vfwprintf", scope: !68, file: !68, line: 598, type: !162, flags: DIFlagPrototyped, spFlags: 0)
!162 = !DISubroutineType(types: !163)
!163 = !{!19, !86, !95, !164}
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !3, size: 192, flags: DIFlagTypePassByValue, elements: !166, identifier: "_ZTS13__va_list_tag")
!166 = !{!167, !168, !169, !171}
!167 = !DIDerivedType(tag: DW_TAG_member, name: "gp_offset", scope: !165, file: !3, baseType: !56, size: 32)
!168 = !DIDerivedType(tag: DW_TAG_member, name: "fp_offset", scope: !165, file: !3, baseType: !56, size: 32, offset: 32)
!169 = !DIDerivedType(tag: DW_TAG_member, name: "overflow_arg_area", scope: !165, file: !3, baseType: !170, size: 64, offset: 64)
!170 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "reg_save_area", scope: !165, file: !3, baseType: !170, size: 64, offset: 128)
!172 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !173, file: !62, line: 166)
!173 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !68, file: !68, line: 696, type: !162, flags: DIFlagPrototyped, spFlags: 0)
!174 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !175, file: !62, line: 169)
!175 = !DISubprogram(name: "vswprintf", scope: !68, file: !68, line: 611, type: !176, flags: DIFlagPrototyped, spFlags: 0)
!176 = !DISubroutineType(types: !177)
!177 = !{!19, !85, !118, !95, !164}
!178 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !179, file: !62, line: 172)
!179 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !68, file: !68, line: 703, type: !180, flags: DIFlagPrototyped, spFlags: 0)
!180 = !DISubroutineType(types: !181)
!181 = !{!19, !95, !95, !164}
!182 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !183, file: !62, line: 174)
!183 = !DISubprogram(name: "vwprintf", scope: !68, file: !68, line: 606, type: !184, flags: DIFlagPrototyped, spFlags: 0)
!184 = !DISubroutineType(types: !185)
!185 = !{!19, !95, !164}
!186 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !187, file: !62, line: 176)
!187 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !68, file: !68, line: 700, type: !184, flags: DIFlagPrototyped, spFlags: 0)
!188 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !189, file: !62, line: 178)
!189 = !DISubprogram(name: "wcrtomb", scope: !68, file: !68, line: 301, type: !190, flags: DIFlagPrototyped, spFlags: 0)
!190 = !DISubroutineType(types: !191)
!191 = !{!118, !192, !84, !124}
!192 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !193)
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!194 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !195, file: !62, line: 179)
!195 = !DISubprogram(name: "wcscat", scope: !68, file: !68, line: 97, type: !196, flags: DIFlagPrototyped, spFlags: 0)
!196 = !DISubroutineType(types: !197)
!197 = !{!83, !85, !95}
!198 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !199, file: !62, line: 180)
!199 = !DISubprogram(name: "wcscmp", scope: !68, file: !68, line: 106, type: !200, flags: DIFlagPrototyped, spFlags: 0)
!200 = !DISubroutineType(types: !201)
!201 = !{!19, !96, !96}
!202 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !203, file: !62, line: 181)
!203 = !DISubprogram(name: "wcscoll", scope: !68, file: !68, line: 131, type: !200, flags: DIFlagPrototyped, spFlags: 0)
!204 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !205, file: !62, line: 182)
!205 = !DISubprogram(name: "wcscpy", scope: !68, file: !68, line: 87, type: !196, flags: DIFlagPrototyped, spFlags: 0)
!206 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !207, file: !62, line: 183)
!207 = !DISubprogram(name: "wcscspn", scope: !68, file: !68, line: 187, type: !208, flags: DIFlagPrototyped, spFlags: 0)
!208 = !DISubroutineType(types: !209)
!209 = !{!118, !96, !96}
!210 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !211, file: !62, line: 184)
!211 = !DISubprogram(name: "wcsftime", scope: !68, file: !68, line: 837, type: !212, flags: DIFlagPrototyped, spFlags: 0)
!212 = !DISubroutineType(types: !213)
!213 = !{!118, !85, !118, !95, !214}
!214 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !215)
!215 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !216, size: 64)
!216 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !217)
!217 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !68, line: 83, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!218 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !219, file: !62, line: 185)
!219 = !DISubprogram(name: "wcslen", scope: !68, file: !68, line: 222, type: !220, flags: DIFlagPrototyped, spFlags: 0)
!220 = !DISubroutineType(types: !221)
!221 = !{!118, !96}
!222 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !223, file: !62, line: 186)
!223 = !DISubprogram(name: "wcsncat", scope: !68, file: !68, line: 101, type: !224, flags: DIFlagPrototyped, spFlags: 0)
!224 = !DISubroutineType(types: !225)
!225 = !{!83, !85, !95, !118}
!226 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !227, file: !62, line: 187)
!227 = !DISubprogram(name: "wcsncmp", scope: !68, file: !68, line: 109, type: !228, flags: DIFlagPrototyped, spFlags: 0)
!228 = !DISubroutineType(types: !229)
!229 = !{!19, !96, !96, !118}
!230 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !231, file: !62, line: 188)
!231 = !DISubprogram(name: "wcsncpy", scope: !68, file: !68, line: 92, type: !224, flags: DIFlagPrototyped, spFlags: 0)
!232 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !233, file: !62, line: 189)
!233 = !DISubprogram(name: "wcsrtombs", scope: !68, file: !68, line: 343, type: !234, flags: DIFlagPrototyped, spFlags: 0)
!234 = !DISubroutineType(types: !235)
!235 = !{!118, !192, !236, !118, !124}
!236 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !237)
!237 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !96, size: 64)
!238 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !239, file: !62, line: 190)
!239 = !DISubprogram(name: "wcsspn", scope: !68, file: !68, line: 191, type: !208, flags: DIFlagPrototyped, spFlags: 0)
!240 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !241, file: !62, line: 191)
!241 = !DISubprogram(name: "wcstod", scope: !68, file: !68, line: 377, type: !242, flags: DIFlagPrototyped, spFlags: 0)
!242 = !DISubroutineType(types: !243)
!243 = !{!244, !95, !245}
!244 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!245 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !246)
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!247 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !248, file: !62, line: 193)
!248 = !DISubprogram(name: "wcstof", scope: !68, file: !68, line: 382, type: !249, flags: DIFlagPrototyped, spFlags: 0)
!249 = !DISubroutineType(types: !250)
!250 = !{!251, !95, !245}
!251 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!252 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !253, file: !62, line: 195)
!253 = !DISubprogram(name: "wcstok", scope: !68, file: !68, line: 217, type: !254, flags: DIFlagPrototyped, spFlags: 0)
!254 = !DISubroutineType(types: !255)
!255 = !{!83, !85, !95, !245}
!256 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !257, file: !62, line: 196)
!257 = !DISubprogram(name: "wcstol", scope: !68, file: !68, line: 428, type: !258, flags: DIFlagPrototyped, spFlags: 0)
!258 = !DISubroutineType(types: !259)
!259 = !{!260, !95, !245, !19}
!260 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!261 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !262, file: !62, line: 197)
!262 = !DISubprogram(name: "wcstoul", scope: !68, file: !68, line: 433, type: !263, flags: DIFlagPrototyped, spFlags: 0)
!263 = !DISubroutineType(types: !264)
!264 = !{!120, !95, !245, !19}
!265 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !266, file: !62, line: 198)
!266 = !DISubprogram(name: "wcsxfrm", scope: !68, file: !68, line: 135, type: !267, flags: DIFlagPrototyped, spFlags: 0)
!267 = !DISubroutineType(types: !268)
!268 = !{!118, !85, !95, !118}
!269 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !270, file: !62, line: 199)
!270 = !DISubprogram(name: "wctob", scope: !68, file: !68, line: 288, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!271 = !DISubroutineType(types: !272)
!272 = !{!19, !64}
!273 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !274, file: !62, line: 200)
!274 = !DISubprogram(name: "wmemcmp", scope: !68, file: !68, line: 258, type: !228, flags: DIFlagPrototyped, spFlags: 0)
!275 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !276, file: !62, line: 201)
!276 = !DISubprogram(name: "wmemcpy", scope: !68, file: !68, line: 262, type: !224, flags: DIFlagPrototyped, spFlags: 0)
!277 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !278, file: !62, line: 202)
!278 = !DISubprogram(name: "wmemmove", scope: !68, file: !68, line: 267, type: !279, flags: DIFlagPrototyped, spFlags: 0)
!279 = !DISubroutineType(types: !280)
!280 = !{!83, !83, !96, !118}
!281 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !282, file: !62, line: 203)
!282 = !DISubprogram(name: "wmemset", scope: !68, file: !68, line: 271, type: !283, flags: DIFlagPrototyped, spFlags: 0)
!283 = !DISubroutineType(types: !284)
!284 = !{!83, !83, !84, !118}
!285 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !286, file: !62, line: 204)
!286 = !DISubprogram(name: "wprintf", scope: !68, file: !68, line: 587, type: !287, flags: DIFlagPrototyped, spFlags: 0)
!287 = !DISubroutineType(types: !288)
!288 = !{!19, !95, null}
!289 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !290, file: !62, line: 205)
!290 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !68, file: !68, line: 646, type: !287, flags: DIFlagPrototyped, spFlags: 0)
!291 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !292, file: !62, line: 206)
!292 = !DISubprogram(name: "wcschr", scope: !68, file: !68, line: 164, type: !293, flags: DIFlagPrototyped, spFlags: 0)
!293 = !DISubroutineType(types: !294)
!294 = !{!83, !96, !84}
!295 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !296, file: !62, line: 207)
!296 = !DISubprogram(name: "wcspbrk", scope: !68, file: !68, line: 201, type: !297, flags: DIFlagPrototyped, spFlags: 0)
!297 = !DISubroutineType(types: !298)
!298 = !{!83, !96, !96}
!299 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !300, file: !62, line: 208)
!300 = !DISubprogram(name: "wcsrchr", scope: !68, file: !68, line: 174, type: !293, flags: DIFlagPrototyped, spFlags: 0)
!301 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !302, file: !62, line: 209)
!302 = !DISubprogram(name: "wcsstr", scope: !68, file: !68, line: 212, type: !297, flags: DIFlagPrototyped, spFlags: 0)
!303 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !304, file: !62, line: 210)
!304 = !DISubprogram(name: "wmemchr", scope: !68, file: !68, line: 253, type: !305, flags: DIFlagPrototyped, spFlags: 0)
!305 = !DISubroutineType(types: !306)
!306 = !{!83, !96, !84, !118}
!307 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !309, file: !62, line: 251)
!308 = !DINamespace(name: "__gnu_cxx", scope: null)
!309 = !DISubprogram(name: "wcstold", scope: !68, file: !68, line: 384, type: !310, flags: DIFlagPrototyped, spFlags: 0)
!310 = !DISubroutineType(types: !311)
!311 = !{!312, !95, !245}
!312 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!313 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !314, file: !62, line: 260)
!314 = !DISubprogram(name: "wcstoll", scope: !68, file: !68, line: 441, type: !315, flags: DIFlagPrototyped, spFlags: 0)
!315 = !DISubroutineType(types: !316)
!316 = !{!317, !95, !245, !19}
!317 = !DIBasicType(name: "long long int", size: 64, encoding: DW_ATE_signed)
!318 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !319, file: !62, line: 261)
!319 = !DISubprogram(name: "wcstoull", scope: !68, file: !68, line: 448, type: !320, flags: DIFlagPrototyped, spFlags: 0)
!320 = !DISubroutineType(types: !321)
!321 = !{!322, !95, !245, !19}
!322 = !DIBasicType(name: "long long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!323 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !309, file: !62, line: 267)
!324 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !314, file: !62, line: 268)
!325 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !319, file: !62, line: 269)
!326 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !248, file: !62, line: 283)
!327 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !173, file: !62, line: 286)
!328 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !179, file: !62, line: 289)
!329 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !187, file: !62, line: 292)
!330 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !309, file: !62, line: 296)
!331 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !314, file: !62, line: 297)
!332 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !319, file: !62, line: 298)
!333 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !334, file: !335, line: 58)
!334 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !336, file: !335, line: 80, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !337, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!335 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/bits/exception_ptr.h", directory: "")
!336 = !DINamespace(name: "__exception_ptr", scope: !10)
!337 = !{!338, !339, !343, !346, !347, !352, !353, !357, !363, !367, !371, !374, !375, !378, !381}
!338 = !DIDerivedType(tag: DW_TAG_member, name: "_M_exception_object", scope: !334, file: !335, line: 82, baseType: !170, size: 64)
!339 = !DISubprogram(name: "exception_ptr", scope: !334, file: !335, line: 84, type: !340, scopeLine: 84, flags: DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!340 = !DISubroutineType(types: !341)
!341 = !{null, !342, !170}
!342 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !334, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!343 = !DISubprogram(name: "_M_addref", linkageName: "_ZNSt15__exception_ptr13exception_ptr9_M_addrefEv", scope: !334, file: !335, line: 86, type: !344, scopeLine: 86, flags: DIFlagPrototyped, spFlags: 0)
!344 = !DISubroutineType(types: !345)
!345 = !{null, !342}
!346 = !DISubprogram(name: "_M_release", linkageName: "_ZNSt15__exception_ptr13exception_ptr10_M_releaseEv", scope: !334, file: !335, line: 87, type: !344, scopeLine: 87, flags: DIFlagPrototyped, spFlags: 0)
!347 = !DISubprogram(name: "_M_get", linkageName: "_ZNKSt15__exception_ptr13exception_ptr6_M_getEv", scope: !334, file: !335, line: 89, type: !348, scopeLine: 89, flags: DIFlagPrototyped, spFlags: 0)
!348 = !DISubroutineType(types: !349)
!349 = !{!170, !350}
!350 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !351, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!351 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !334)
!352 = !DISubprogram(name: "exception_ptr", scope: !334, file: !335, line: 97, type: !344, scopeLine: 97, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!353 = !DISubprogram(name: "exception_ptr", scope: !334, file: !335, line: 99, type: !354, scopeLine: 99, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!354 = !DISubroutineType(types: !355)
!355 = !{null, !342, !356}
!356 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !351, size: 64)
!357 = !DISubprogram(name: "exception_ptr", scope: !334, file: !335, line: 102, type: !358, scopeLine: 102, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!358 = !DISubroutineType(types: !359)
!359 = !{null, !342, !360}
!360 = !DIDerivedType(tag: DW_TAG_typedef, name: "nullptr_t", scope: !10, file: !361, line: 264, baseType: !362)
!361 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/x86_64-pc-linux-gnu/bits/c++config.h", directory: "")
!362 = !DIBasicType(tag: DW_TAG_unspecified_type, name: "decltype(nullptr)")
!363 = !DISubprogram(name: "exception_ptr", scope: !334, file: !335, line: 106, type: !364, scopeLine: 106, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!364 = !DISubroutineType(types: !365)
!365 = !{null, !342, !366}
!366 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !334, size: 64)
!367 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSERKS0_", scope: !334, file: !335, line: 119, type: !368, scopeLine: 119, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!368 = !DISubroutineType(types: !369)
!369 = !{!370, !342, !356}
!370 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !334, size: 64)
!371 = !DISubprogram(name: "operator=", linkageName: "_ZNSt15__exception_ptr13exception_ptraSEOS0_", scope: !334, file: !335, line: 123, type: !372, scopeLine: 123, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!372 = !DISubroutineType(types: !373)
!373 = !{!370, !342, !366}
!374 = !DISubprogram(name: "~exception_ptr", scope: !334, file: !335, line: 130, type: !344, scopeLine: 130, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!375 = !DISubprogram(name: "swap", linkageName: "_ZNSt15__exception_ptr13exception_ptr4swapERS0_", scope: !334, file: !335, line: 133, type: !376, scopeLine: 133, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!376 = !DISubroutineType(types: !377)
!377 = !{null, !342, !370}
!378 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt15__exception_ptr13exception_ptrcvbEv", scope: !334, file: !335, line: 145, type: !379, scopeLine: 145, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: 0)
!379 = !DISubroutineType(types: !380)
!380 = !{!6, !350}
!381 = !DISubprogram(name: "__cxa_exception_type", linkageName: "_ZNKSt15__exception_ptr13exception_ptr20__cxa_exception_typeEv", scope: !334, file: !335, line: 154, type: !382, scopeLine: 154, flags: DIFlagPublic | DIFlagPrototyped, spFlags: 0)
!382 = !DISubroutineType(types: !383)
!383 = !{!384, !350}
!384 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !385, size: 64)
!385 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !386)
!386 = !DICompositeType(tag: DW_TAG_class_type, name: "type_info", scope: !10, file: !387, line: 88, flags: DIFlagFwdDecl)
!387 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/typeinfo", directory: "")
!388 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !336, entity: !389, file: !335, line: 74)
!389 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !10, file: !335, line: 70, type: !390, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!390 = !DISubroutineType(types: !391)
!391 = !{null, !334}
!392 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !393, entity: !394, file: !395, line: 58)
!393 = !DINamespace(name: "__gnu_debug", scope: null)
!394 = !DINamespace(name: "__debug", scope: !10)
!395 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/debug/debug.h", directory: "")
!396 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !397, file: !402, line: 47)
!397 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !398, line: 24, baseType: !399)
!398 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "")
!399 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !400, line: 37, baseType: !401)
!400 = !DIFile(filename: "/usr/include/bits/types.h", directory: "")
!401 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!402 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/cstdint", directory: "")
!403 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !404, file: !402, line: 48)
!404 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !398, line: 25, baseType: !405)
!405 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !400, line: 39, baseType: !406)
!406 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!407 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !408, file: !402, line: 49)
!408 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !398, line: 26, baseType: !409)
!409 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !400, line: 41, baseType: !19)
!410 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !411, file: !402, line: 50)
!411 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !398, line: 27, baseType: !412)
!412 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !400, line: 44, baseType: !260)
!413 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !414, file: !402, line: 52)
!414 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast8_t", file: !415, line: 58, baseType: !401)
!415 = !DIFile(filename: "/usr/include/stdint.h", directory: "")
!416 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !417, file: !402, line: 53)
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast16_t", file: !415, line: 60, baseType: !260)
!418 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !419, file: !402, line: 54)
!419 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast32_t", file: !415, line: 61, baseType: !260)
!420 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !421, file: !402, line: 55)
!421 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_fast64_t", file: !415, line: 62, baseType: !260)
!422 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !423, file: !402, line: 57)
!423 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least8_t", file: !415, line: 43, baseType: !424)
!424 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least8_t", file: !400, line: 52, baseType: !399)
!425 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !426, file: !402, line: 58)
!426 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least16_t", file: !415, line: 44, baseType: !427)
!427 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least16_t", file: !400, line: 54, baseType: !405)
!428 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !429, file: !402, line: 59)
!429 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least32_t", file: !415, line: 45, baseType: !430)
!430 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least32_t", file: !400, line: 56, baseType: !409)
!431 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !432, file: !402, line: 60)
!432 = !DIDerivedType(tag: DW_TAG_typedef, name: "int_least64_t", file: !415, line: 46, baseType: !433)
!433 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int_least64_t", file: !400, line: 58, baseType: !412)
!434 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !435, file: !402, line: 62)
!435 = !DIDerivedType(tag: DW_TAG_typedef, name: "intmax_t", file: !415, line: 101, baseType: !436)
!436 = !DIDerivedType(tag: DW_TAG_typedef, name: "__intmax_t", file: !400, line: 72, baseType: !260)
!437 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !438, file: !402, line: 63)
!438 = !DIDerivedType(tag: DW_TAG_typedef, name: "intptr_t", file: !415, line: 87, baseType: !260)
!439 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !440, file: !402, line: 65)
!440 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !441, line: 24, baseType: !442)
!441 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "")
!442 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !400, line: 38, baseType: !443)
!443 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!444 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !445, file: !402, line: 66)
!445 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !441, line: 25, baseType: !446)
!446 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !400, line: 40, baseType: !447)
!447 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!448 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !449, file: !402, line: 67)
!449 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !441, line: 26, baseType: !450)
!450 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !400, line: 42, baseType: !56)
!451 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !452, file: !402, line: 68)
!452 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !441, line: 27, baseType: !453)
!453 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !400, line: 45, baseType: !120)
!454 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !455, file: !402, line: 70)
!455 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast8_t", file: !415, line: 71, baseType: !443)
!456 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !457, file: !402, line: 71)
!457 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast16_t", file: !415, line: 73, baseType: !120)
!458 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !459, file: !402, line: 72)
!459 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast32_t", file: !415, line: 74, baseType: !120)
!460 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !461, file: !402, line: 73)
!461 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_fast64_t", file: !415, line: 75, baseType: !120)
!462 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !463, file: !402, line: 75)
!463 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least8_t", file: !415, line: 49, baseType: !464)
!464 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least8_t", file: !400, line: 53, baseType: !442)
!465 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !466, file: !402, line: 76)
!466 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least16_t", file: !415, line: 50, baseType: !467)
!467 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least16_t", file: !400, line: 55, baseType: !446)
!468 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !469, file: !402, line: 77)
!469 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least32_t", file: !415, line: 51, baseType: !470)
!470 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least32_t", file: !400, line: 57, baseType: !450)
!471 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !472, file: !402, line: 78)
!472 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint_least64_t", file: !415, line: 52, baseType: !473)
!473 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint_least64_t", file: !400, line: 59, baseType: !453)
!474 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !475, file: !402, line: 80)
!475 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintmax_t", file: !415, line: 102, baseType: !476)
!476 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintmax_t", file: !400, line: 73, baseType: !120)
!477 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !478, file: !402, line: 81)
!478 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !415, line: 90, baseType: !120)
!479 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !480, file: !482, line: 53)
!480 = !DICompositeType(tag: DW_TAG_structure_type, name: "lconv", file: !481, line: 51, flags: DIFlagFwdDecl, identifier: "_ZTS5lconv")
!481 = !DIFile(filename: "/usr/include/locale.h", directory: "")
!482 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/clocale", directory: "")
!483 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !484, file: !482, line: 54)
!484 = !DISubprogram(name: "setlocale", scope: !481, file: !481, line: 122, type: !485, flags: DIFlagPrototyped, spFlags: 0)
!485 = !DISubroutineType(types: !486)
!486 = !{!193, !19, !122}
!487 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !488, file: !482, line: 55)
!488 = !DISubprogram(name: "localeconv", scope: !481, file: !481, line: 125, type: !489, flags: DIFlagPrototyped, spFlags: 0)
!489 = !DISubroutineType(types: !490)
!490 = !{!491}
!491 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !480, size: 64)
!492 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !493, file: !497, line: 64)
!493 = !DISubprogram(name: "isalnum", scope: !494, file: !494, line: 108, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!494 = !DIFile(filename: "/usr/include/ctype.h", directory: "")
!495 = !DISubroutineType(types: !496)
!496 = !{!19, !19}
!497 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/cctype", directory: "")
!498 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !499, file: !497, line: 65)
!499 = !DISubprogram(name: "isalpha", scope: !494, file: !494, line: 109, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!500 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !501, file: !497, line: 66)
!501 = !DISubprogram(name: "iscntrl", scope: !494, file: !494, line: 110, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!502 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !503, file: !497, line: 67)
!503 = !DISubprogram(name: "isdigit", scope: !494, file: !494, line: 111, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!504 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !505, file: !497, line: 68)
!505 = !DISubprogram(name: "isgraph", scope: !494, file: !494, line: 113, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!506 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !507, file: !497, line: 69)
!507 = !DISubprogram(name: "islower", scope: !494, file: !494, line: 112, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!508 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !509, file: !497, line: 70)
!509 = !DISubprogram(name: "isprint", scope: !494, file: !494, line: 114, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!510 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !511, file: !497, line: 71)
!511 = !DISubprogram(name: "ispunct", scope: !494, file: !494, line: 115, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!512 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !513, file: !497, line: 72)
!513 = !DISubprogram(name: "isspace", scope: !494, file: !494, line: 116, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!514 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !515, file: !497, line: 73)
!515 = !DISubprogram(name: "isupper", scope: !494, file: !494, line: 117, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!516 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !517, file: !497, line: 74)
!517 = !DISubprogram(name: "isxdigit", scope: !494, file: !494, line: 118, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!518 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !519, file: !497, line: 75)
!519 = !DISubprogram(name: "tolower", scope: !494, file: !494, line: 122, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!520 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !521, file: !497, line: 76)
!521 = !DISubprogram(name: "toupper", scope: !494, file: !494, line: 125, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!522 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !523, file: !497, line: 87)
!523 = !DISubprogram(name: "isblank", scope: !494, file: !494, line: 130, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!524 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !525, file: !527, line: 52)
!525 = !DISubprogram(name: "abs", scope: !526, file: !526, line: 840, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!526 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!527 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/bits/std_abs.h", directory: "")
!528 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !529, file: !531, line: 127)
!529 = !DIDerivedType(tag: DW_TAG_typedef, name: "div_t", file: !526, line: 62, baseType: !530)
!530 = !DICompositeType(tag: DW_TAG_structure_type, file: !526, line: 58, flags: DIFlagFwdDecl, identifier: "_ZTS5div_t")
!531 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/cstdlib", directory: "")
!532 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !533, file: !531, line: 128)
!533 = !DIDerivedType(tag: DW_TAG_typedef, name: "ldiv_t", file: !526, line: 70, baseType: !534)
!534 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !526, line: 66, size: 128, flags: DIFlagTypePassByValue, elements: !535, identifier: "_ZTS6ldiv_t")
!535 = !{!536, !537}
!536 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !534, file: !526, line: 68, baseType: !260, size: 64)
!537 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !534, file: !526, line: 69, baseType: !260, size: 64, offset: 64)
!538 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !539, file: !531, line: 130)
!539 = !DISubprogram(name: "abort", scope: !526, file: !526, line: 591, type: !540, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!540 = !DISubroutineType(types: !541)
!541 = !{null}
!542 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !543, file: !531, line: 134)
!543 = !DISubprogram(name: "atexit", scope: !526, file: !526, line: 595, type: !544, flags: DIFlagPrototyped, spFlags: 0)
!544 = !DISubroutineType(types: !545)
!545 = !{!19, !546}
!546 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !540, size: 64)
!547 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !548, file: !531, line: 137)
!548 = !DISubprogram(name: "at_quick_exit", scope: !526, file: !526, line: 600, type: !544, flags: DIFlagPrototyped, spFlags: 0)
!549 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !550, file: !531, line: 140)
!550 = !DISubprogram(name: "atof", scope: !526, file: !526, line: 101, type: !551, flags: DIFlagPrototyped, spFlags: 0)
!551 = !DISubroutineType(types: !552)
!552 = !{!244, !122}
!553 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !554, file: !531, line: 141)
!554 = !DISubprogram(name: "atoi", scope: !526, file: !526, line: 104, type: !555, flags: DIFlagPrototyped, spFlags: 0)
!555 = !DISubroutineType(types: !556)
!556 = !{!19, !122}
!557 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !558, file: !531, line: 142)
!558 = !DISubprogram(name: "atol", scope: !526, file: !526, line: 107, type: !559, flags: DIFlagPrototyped, spFlags: 0)
!559 = !DISubroutineType(types: !560)
!560 = !{!260, !122}
!561 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !562, file: !531, line: 143)
!562 = !DISubprogram(name: "bsearch", scope: !526, file: !526, line: 820, type: !563, flags: DIFlagPrototyped, spFlags: 0)
!563 = !DISubroutineType(types: !564)
!564 = !{!170, !565, !565, !118, !118, !567}
!565 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !566, size: 64)
!566 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!567 = !DIDerivedType(tag: DW_TAG_typedef, name: "__compar_fn_t", file: !526, line: 808, baseType: !568)
!568 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !569, size: 64)
!569 = !DISubroutineType(types: !570)
!570 = !{!19, !565, !565}
!571 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !572, file: !531, line: 144)
!572 = !DISubprogram(name: "calloc", scope: !526, file: !526, line: 542, type: !573, flags: DIFlagPrototyped, spFlags: 0)
!573 = !DISubroutineType(types: !574)
!574 = !{!170, !118, !118}
!575 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !576, file: !531, line: 145)
!576 = !DISubprogram(name: "div", scope: !526, file: !526, line: 852, type: !577, flags: DIFlagPrototyped, spFlags: 0)
!577 = !DISubroutineType(types: !578)
!578 = !{!529, !19, !19}
!579 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !580, file: !531, line: 146)
!580 = !DISubprogram(name: "exit", scope: !526, file: !526, line: 617, type: !581, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!581 = !DISubroutineType(types: !582)
!582 = !{null, !19}
!583 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !584, file: !531, line: 147)
!584 = !DISubprogram(name: "free", scope: !526, file: !526, line: 565, type: !585, flags: DIFlagPrototyped, spFlags: 0)
!585 = !DISubroutineType(types: !586)
!586 = !{null, !170}
!587 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !588, file: !531, line: 148)
!588 = !DISubprogram(name: "getenv", scope: !526, file: !526, line: 634, type: !589, flags: DIFlagPrototyped, spFlags: 0)
!589 = !DISubroutineType(types: !590)
!590 = !{!193, !122}
!591 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !592, file: !531, line: 149)
!592 = !DISubprogram(name: "labs", scope: !526, file: !526, line: 841, type: !593, flags: DIFlagPrototyped, spFlags: 0)
!593 = !DISubroutineType(types: !594)
!594 = !{!260, !260}
!595 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !596, file: !531, line: 150)
!596 = !DISubprogram(name: "ldiv", scope: !526, file: !526, line: 854, type: !597, flags: DIFlagPrototyped, spFlags: 0)
!597 = !DISubroutineType(types: !598)
!598 = !{!533, !260, !260}
!599 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !600, file: !531, line: 151)
!600 = !DISubprogram(name: "malloc", scope: !526, file: !526, line: 539, type: !601, flags: DIFlagPrototyped, spFlags: 0)
!601 = !DISubroutineType(types: !602)
!602 = !{!170, !118}
!603 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !604, file: !531, line: 153)
!604 = !DISubprogram(name: "mblen", scope: !526, file: !526, line: 922, type: !605, flags: DIFlagPrototyped, spFlags: 0)
!605 = !DISubroutineType(types: !606)
!606 = !{!19, !122, !118}
!607 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !608, file: !531, line: 154)
!608 = !DISubprogram(name: "mbstowcs", scope: !526, file: !526, line: 933, type: !609, flags: DIFlagPrototyped, spFlags: 0)
!609 = !DISubroutineType(types: !610)
!610 = !{!118, !85, !121, !118}
!611 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !612, file: !531, line: 155)
!612 = !DISubprogram(name: "mbtowc", scope: !526, file: !526, line: 925, type: !613, flags: DIFlagPrototyped, spFlags: 0)
!613 = !DISubroutineType(types: !614)
!614 = !{!19, !85, !121, !118}
!615 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !616, file: !531, line: 157)
!616 = !DISubprogram(name: "qsort", scope: !526, file: !526, line: 830, type: !617, flags: DIFlagPrototyped, spFlags: 0)
!617 = !DISubroutineType(types: !618)
!618 = !{null, !170, !118, !118, !567}
!619 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !620, file: !531, line: 160)
!620 = !DISubprogram(name: "quick_exit", scope: !526, file: !526, line: 623, type: !581, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!621 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !622, file: !531, line: 163)
!622 = !DISubprogram(name: "rand", scope: !526, file: !526, line: 453, type: !623, flags: DIFlagPrototyped, spFlags: 0)
!623 = !DISubroutineType(types: !624)
!624 = !{!19}
!625 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !626, file: !531, line: 164)
!626 = !DISubprogram(name: "realloc", scope: !526, file: !526, line: 550, type: !627, flags: DIFlagPrototyped, spFlags: 0)
!627 = !DISubroutineType(types: !628)
!628 = !{!170, !170, !118}
!629 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !630, file: !531, line: 165)
!630 = !DISubprogram(name: "srand", scope: !526, file: !526, line: 455, type: !631, flags: DIFlagPrototyped, spFlags: 0)
!631 = !DISubroutineType(types: !632)
!632 = !{null, !56}
!633 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !634, file: !531, line: 166)
!634 = !DISubprogram(name: "strtod", scope: !526, file: !526, line: 117, type: !635, flags: DIFlagPrototyped, spFlags: 0)
!635 = !DISubroutineType(types: !636)
!636 = !{!244, !121, !637}
!637 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !638)
!638 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !193, size: 64)
!639 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !640, file: !531, line: 167)
!640 = !DISubprogram(name: "strtol", scope: !526, file: !526, line: 176, type: !641, flags: DIFlagPrototyped, spFlags: 0)
!641 = !DISubroutineType(types: !642)
!642 = !{!260, !121, !637, !19}
!643 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !644, file: !531, line: 168)
!644 = !DISubprogram(name: "strtoul", scope: !526, file: !526, line: 180, type: !645, flags: DIFlagPrototyped, spFlags: 0)
!645 = !DISubroutineType(types: !646)
!646 = !{!120, !121, !637, !19}
!647 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !648, file: !531, line: 169)
!648 = !DISubprogram(name: "system", scope: !526, file: !526, line: 784, type: !555, flags: DIFlagPrototyped, spFlags: 0)
!649 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !650, file: !531, line: 171)
!650 = !DISubprogram(name: "wcstombs", scope: !526, file: !526, line: 937, type: !651, flags: DIFlagPrototyped, spFlags: 0)
!651 = !DISubroutineType(types: !652)
!652 = !{!118, !192, !95, !118}
!653 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !654, file: !531, line: 172)
!654 = !DISubprogram(name: "wctomb", scope: !526, file: !526, line: 929, type: !655, flags: DIFlagPrototyped, spFlags: 0)
!655 = !DISubroutineType(types: !656)
!656 = !{!19, !193, !84}
!657 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !658, file: !531, line: 200)
!658 = !DIDerivedType(tag: DW_TAG_typedef, name: "lldiv_t", file: !526, line: 80, baseType: !659)
!659 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !526, line: 76, size: 128, flags: DIFlagTypePassByValue, elements: !660, identifier: "_ZTS7lldiv_t")
!660 = !{!661, !662}
!661 = !DIDerivedType(tag: DW_TAG_member, name: "quot", scope: !659, file: !526, line: 78, baseType: !317, size: 64)
!662 = !DIDerivedType(tag: DW_TAG_member, name: "rem", scope: !659, file: !526, line: 79, baseType: !317, size: 64, offset: 64)
!663 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !664, file: !531, line: 206)
!664 = !DISubprogram(name: "_Exit", scope: !526, file: !526, line: 629, type: !581, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: 0)
!665 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !666, file: !531, line: 210)
!666 = !DISubprogram(name: "llabs", scope: !526, file: !526, line: 844, type: !667, flags: DIFlagPrototyped, spFlags: 0)
!667 = !DISubroutineType(types: !668)
!668 = !{!317, !317}
!669 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !670, file: !531, line: 216)
!670 = !DISubprogram(name: "lldiv", scope: !526, file: !526, line: 858, type: !671, flags: DIFlagPrototyped, spFlags: 0)
!671 = !DISubroutineType(types: !672)
!672 = !{!658, !317, !317}
!673 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !674, file: !531, line: 227)
!674 = !DISubprogram(name: "atoll", scope: !526, file: !526, line: 112, type: !675, flags: DIFlagPrototyped, spFlags: 0)
!675 = !DISubroutineType(types: !676)
!676 = !{!317, !122}
!677 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !678, file: !531, line: 228)
!678 = !DISubprogram(name: "strtoll", scope: !526, file: !526, line: 200, type: !679, flags: DIFlagPrototyped, spFlags: 0)
!679 = !DISubroutineType(types: !680)
!680 = !{!317, !121, !637, !19}
!681 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !682, file: !531, line: 229)
!682 = !DISubprogram(name: "strtoull", scope: !526, file: !526, line: 205, type: !683, flags: DIFlagPrototyped, spFlags: 0)
!683 = !DISubroutineType(types: !684)
!684 = !{!322, !121, !637, !19}
!685 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !686, file: !531, line: 231)
!686 = !DISubprogram(name: "strtof", scope: !526, file: !526, line: 123, type: !687, flags: DIFlagPrototyped, spFlags: 0)
!687 = !DISubroutineType(types: !688)
!688 = !{!251, !121, !637}
!689 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !690, file: !531, line: 232)
!690 = !DISubprogram(name: "strtold", scope: !526, file: !526, line: 126, type: !691, flags: DIFlagPrototyped, spFlags: 0)
!691 = !DISubroutineType(types: !692)
!692 = !{!312, !121, !637}
!693 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !658, file: !531, line: 240)
!694 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !664, file: !531, line: 242)
!695 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !666, file: !531, line: 244)
!696 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !697, file: !531, line: 245)
!697 = !DISubprogram(name: "div", linkageName: "_ZN9__gnu_cxx3divExx", scope: !308, file: !531, line: 213, type: !671, flags: DIFlagPrototyped, spFlags: 0)
!698 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !670, file: !531, line: 246)
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !674, file: !531, line: 248)
!700 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !686, file: !531, line: 249)
!701 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !678, file: !531, line: 250)
!702 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !682, file: !531, line: 251)
!703 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !690, file: !531, line: 252)
!704 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !705, file: !707, line: 98)
!705 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !706, line: 7, baseType: !78)
!706 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "")
!707 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/cstdio", directory: "")
!708 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !709, file: !707, line: 99)
!709 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !710, line: 84, baseType: !711)
!710 = !DIFile(filename: "/usr/include/stdio.h", directory: "")
!711 = !DIDerivedType(tag: DW_TAG_typedef, name: "__fpos_t", file: !712, line: 14, baseType: !713)
!712 = !DIFile(filename: "/usr/include/bits/types/__fpos_t.h", directory: "")
!713 = !DICompositeType(tag: DW_TAG_structure_type, name: "_G_fpos_t", file: !712, line: 10, flags: DIFlagFwdDecl, identifier: "_ZTS9_G_fpos_t")
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !715, file: !707, line: 101)
!715 = !DISubprogram(name: "clearerr", scope: !710, file: !710, line: 762, type: !716, flags: DIFlagPrototyped, spFlags: 0)
!716 = !DISubroutineType(types: !717)
!717 = !{null, !718}
!718 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !705, size: 64)
!719 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !720, file: !707, line: 102)
!720 = !DISubprogram(name: "fclose", scope: !710, file: !710, line: 213, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!721 = !DISubroutineType(types: !722)
!722 = !{!19, !718}
!723 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !724, file: !707, line: 103)
!724 = !DISubprogram(name: "feof", scope: !710, file: !710, line: 764, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!725 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !726, file: !707, line: 104)
!726 = !DISubprogram(name: "ferror", scope: !710, file: !710, line: 766, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!727 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !728, file: !707, line: 105)
!728 = !DISubprogram(name: "fflush", scope: !710, file: !710, line: 218, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!729 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !730, file: !707, line: 106)
!730 = !DISubprogram(name: "fgetc", scope: !710, file: !710, line: 489, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!731 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !732, file: !707, line: 107)
!732 = !DISubprogram(name: "fgetpos", scope: !710, file: !710, line: 736, type: !733, flags: DIFlagPrototyped, spFlags: 0)
!733 = !DISubroutineType(types: !734)
!734 = !{!19, !735, !736}
!735 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !718)
!736 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !737)
!737 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !709, size: 64)
!738 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !739, file: !707, line: 108)
!739 = !DISubprogram(name: "fgets", scope: !710, file: !710, line: 568, type: !740, flags: DIFlagPrototyped, spFlags: 0)
!740 = !DISubroutineType(types: !741)
!741 = !{!193, !192, !19, !735}
!742 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !743, file: !707, line: 109)
!743 = !DISubprogram(name: "fopen", scope: !710, file: !710, line: 246, type: !744, flags: DIFlagPrototyped, spFlags: 0)
!744 = !DISubroutineType(types: !745)
!745 = !{!718, !121, !121}
!746 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !747, file: !707, line: 110)
!747 = !DISubprogram(name: "fprintf", scope: !710, file: !710, line: 326, type: !748, flags: DIFlagPrototyped, spFlags: 0)
!748 = !DISubroutineType(types: !749)
!749 = !{!19, !735, !121, null}
!750 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !751, file: !707, line: 111)
!751 = !DISubprogram(name: "fputc", scope: !710, file: !710, line: 525, type: !752, flags: DIFlagPrototyped, spFlags: 0)
!752 = !DISubroutineType(types: !753)
!753 = !{!19, !19, !718}
!754 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !755, file: !707, line: 112)
!755 = !DISubprogram(name: "fputs", scope: !710, file: !710, line: 631, type: !756, flags: DIFlagPrototyped, spFlags: 0)
!756 = !DISubroutineType(types: !757)
!757 = !{!19, !121, !735}
!758 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !759, file: !707, line: 113)
!759 = !DISubprogram(name: "fread", scope: !710, file: !710, line: 651, type: !760, flags: DIFlagPrototyped, spFlags: 0)
!760 = !DISubroutineType(types: !761)
!761 = !{!118, !762, !118, !118, !735}
!762 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !170)
!763 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !764, file: !707, line: 114)
!764 = !DISubprogram(name: "freopen", scope: !710, file: !710, line: 252, type: !765, flags: DIFlagPrototyped, spFlags: 0)
!765 = !DISubroutineType(types: !766)
!766 = !{!718, !121, !121, !735}
!767 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !768, file: !707, line: 115)
!768 = !DISubprogram(name: "fscanf", linkageName: "__isoc99_fscanf", scope: !710, file: !710, line: 410, type: !748, flags: DIFlagPrototyped, spFlags: 0)
!769 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !770, file: !707, line: 116)
!770 = !DISubprogram(name: "fseek", scope: !710, file: !710, line: 689, type: !771, flags: DIFlagPrototyped, spFlags: 0)
!771 = !DISubroutineType(types: !772)
!772 = !{!19, !718, !260, !19}
!773 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !774, file: !707, line: 117)
!774 = !DISubprogram(name: "fsetpos", scope: !710, file: !710, line: 741, type: !775, flags: DIFlagPrototyped, spFlags: 0)
!775 = !DISubroutineType(types: !776)
!776 = !{!19, !718, !777}
!777 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !778, size: 64)
!778 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !709)
!779 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !780, file: !707, line: 118)
!780 = !DISubprogram(name: "ftell", scope: !710, file: !710, line: 694, type: !781, flags: DIFlagPrototyped, spFlags: 0)
!781 = !DISubroutineType(types: !782)
!782 = !{!260, !718}
!783 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !784, file: !707, line: 119)
!784 = !DISubprogram(name: "fwrite", scope: !710, file: !710, line: 657, type: !785, flags: DIFlagPrototyped, spFlags: 0)
!785 = !DISubroutineType(types: !786)
!786 = !{!118, !787, !118, !118, !735}
!787 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !565)
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !789, file: !707, line: 120)
!789 = !DISubprogram(name: "getc", scope: !710, file: !710, line: 490, type: !721, flags: DIFlagPrototyped, spFlags: 0)
!790 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !791, file: !707, line: 121)
!791 = !DISubprogram(name: "getchar", scope: !710, file: !710, line: 496, type: !623, flags: DIFlagPrototyped, spFlags: 0)
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !793, file: !707, line: 126)
!793 = !DISubprogram(name: "perror", scope: !710, file: !710, line: 780, type: !794, flags: DIFlagPrototyped, spFlags: 0)
!794 = !DISubroutineType(types: !795)
!795 = !{null, !122}
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !797, file: !707, line: 127)
!797 = !DISubprogram(name: "printf", scope: !710, file: !710, line: 332, type: !798, flags: DIFlagPrototyped, spFlags: 0)
!798 = !DISubroutineType(types: !799)
!799 = !{!19, !121, null}
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !801, file: !707, line: 128)
!801 = !DISubprogram(name: "putc", scope: !710, file: !710, line: 526, type: !752, flags: DIFlagPrototyped, spFlags: 0)
!802 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !803, file: !707, line: 129)
!803 = !DISubprogram(name: "putchar", scope: !710, file: !710, line: 532, type: !495, flags: DIFlagPrototyped, spFlags: 0)
!804 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !805, file: !707, line: 130)
!805 = !DISubprogram(name: "puts", scope: !710, file: !710, line: 637, type: !555, flags: DIFlagPrototyped, spFlags: 0)
!806 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !807, file: !707, line: 131)
!807 = !DISubprogram(name: "remove", scope: !710, file: !710, line: 146, type: !555, flags: DIFlagPrototyped, spFlags: 0)
!808 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !809, file: !707, line: 132)
!809 = !DISubprogram(name: "rename", scope: !710, file: !710, line: 148, type: !810, flags: DIFlagPrototyped, spFlags: 0)
!810 = !DISubroutineType(types: !811)
!811 = !{!19, !122, !122}
!812 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !813, file: !707, line: 133)
!813 = !DISubprogram(name: "rewind", scope: !710, file: !710, line: 699, type: !716, flags: DIFlagPrototyped, spFlags: 0)
!814 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !815, file: !707, line: 134)
!815 = !DISubprogram(name: "scanf", linkageName: "__isoc99_scanf", scope: !710, file: !710, line: 413, type: !798, flags: DIFlagPrototyped, spFlags: 0)
!816 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !817, file: !707, line: 135)
!817 = !DISubprogram(name: "setbuf", scope: !710, file: !710, line: 304, type: !818, flags: DIFlagPrototyped, spFlags: 0)
!818 = !DISubroutineType(types: !819)
!819 = !{null, !735, !192}
!820 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !821, file: !707, line: 136)
!821 = !DISubprogram(name: "setvbuf", scope: !710, file: !710, line: 308, type: !822, flags: DIFlagPrototyped, spFlags: 0)
!822 = !DISubroutineType(types: !823)
!823 = !{!19, !735, !192, !19, !118}
!824 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !825, file: !707, line: 137)
!825 = !DISubprogram(name: "sprintf", scope: !710, file: !710, line: 334, type: !826, flags: DIFlagPrototyped, spFlags: 0)
!826 = !DISubroutineType(types: !827)
!827 = !{!19, !192, !121, null}
!828 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !829, file: !707, line: 138)
!829 = !DISubprogram(name: "sscanf", linkageName: "__isoc99_sscanf", scope: !710, file: !710, line: 415, type: !830, flags: DIFlagPrototyped, spFlags: 0)
!830 = !DISubroutineType(types: !831)
!831 = !{!19, !121, !121, null}
!832 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !833, file: !707, line: 139)
!833 = !DISubprogram(name: "tmpfile", scope: !710, file: !710, line: 173, type: !834, flags: DIFlagPrototyped, spFlags: 0)
!834 = !DISubroutineType(types: !835)
!835 = !{!718}
!836 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !837, file: !707, line: 141)
!837 = !DISubprogram(name: "tmpnam", scope: !710, file: !710, line: 187, type: !838, flags: DIFlagPrototyped, spFlags: 0)
!838 = !DISubroutineType(types: !839)
!839 = !{!193, !193}
!840 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !841, file: !707, line: 143)
!841 = !DISubprogram(name: "ungetc", scope: !710, file: !710, line: 644, type: !752, flags: DIFlagPrototyped, spFlags: 0)
!842 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !843, file: !707, line: 144)
!843 = !DISubprogram(name: "vfprintf", scope: !710, file: !710, line: 341, type: !844, flags: DIFlagPrototyped, spFlags: 0)
!844 = !DISubroutineType(types: !845)
!845 = !{!19, !735, !121, !164}
!846 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !847, file: !707, line: 145)
!847 = !DISubprogram(name: "vprintf", scope: !710, file: !710, line: 347, type: !848, flags: DIFlagPrototyped, spFlags: 0)
!848 = !DISubroutineType(types: !849)
!849 = !{!19, !121, !164}
!850 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !851, file: !707, line: 146)
!851 = !DISubprogram(name: "vsprintf", scope: !710, file: !710, line: 349, type: !852, flags: DIFlagPrototyped, spFlags: 0)
!852 = !DISubroutineType(types: !853)
!853 = !{!19, !192, !121, !164}
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !855, file: !707, line: 175)
!855 = !DISubprogram(name: "snprintf", scope: !710, file: !710, line: 354, type: !856, flags: DIFlagPrototyped, spFlags: 0)
!856 = !DISubroutineType(types: !857)
!857 = !{!19, !192, !118, !121, null}
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !859, file: !707, line: 176)
!859 = !DISubprogram(name: "vfscanf", linkageName: "__isoc99_vfscanf", scope: !710, file: !710, line: 455, type: !844, flags: DIFlagPrototyped, spFlags: 0)
!860 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !861, file: !707, line: 177)
!861 = !DISubprogram(name: "vscanf", linkageName: "__isoc99_vscanf", scope: !710, file: !710, line: 460, type: !848, flags: DIFlagPrototyped, spFlags: 0)
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !863, file: !707, line: 178)
!863 = !DISubprogram(name: "vsnprintf", scope: !710, file: !710, line: 358, type: !864, flags: DIFlagPrototyped, spFlags: 0)
!864 = !DISubroutineType(types: !865)
!865 = !{!19, !192, !118, !121, !164}
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !308, entity: !867, file: !707, line: 179)
!867 = !DISubprogram(name: "vsscanf", linkageName: "__isoc99_vsscanf", scope: !710, file: !710, line: 463, type: !868, flags: DIFlagPrototyped, spFlags: 0)
!868 = !DISubroutineType(types: !869)
!869 = !{!19, !121, !121, !164}
!870 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !855, file: !707, line: 185)
!871 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !859, file: !707, line: 186)
!872 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !861, file: !707, line: 187)
!873 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !863, file: !707, line: 188)
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !867, file: !707, line: 189)
!875 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !876, file: !880, line: 82)
!876 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctrans_t", file: !877, line: 48, baseType: !878)
!877 = !DIFile(filename: "/usr/include/wctype.h", directory: "")
!878 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !879, size: 64)
!879 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !409)
!880 = !DIFile(filename: "/usr/lib64/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../include/c++/10.2.0/cwctype", directory: "")
!881 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !882, file: !880, line: 83)
!882 = !DIDerivedType(tag: DW_TAG_typedef, name: "wctype_t", file: !883, line: 38, baseType: !120)
!883 = !DIFile(filename: "/usr/include/bits/wctype-wchar.h", directory: "")
!884 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !64, file: !880, line: 84)
!885 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !886, file: !880, line: 86)
!886 = !DISubprogram(name: "iswalnum", scope: !883, file: !883, line: 95, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!887 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !888, file: !880, line: 87)
!888 = !DISubprogram(name: "iswalpha", scope: !883, file: !883, line: 101, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!889 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !890, file: !880, line: 89)
!890 = !DISubprogram(name: "iswblank", scope: !883, file: !883, line: 146, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!891 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !892, file: !880, line: 91)
!892 = !DISubprogram(name: "iswcntrl", scope: !883, file: !883, line: 104, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!893 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !894, file: !880, line: 92)
!894 = !DISubprogram(name: "iswctype", scope: !883, file: !883, line: 159, type: !895, flags: DIFlagPrototyped, spFlags: 0)
!895 = !DISubroutineType(types: !896)
!896 = !{!19, !64, !882}
!897 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !898, file: !880, line: 93)
!898 = !DISubprogram(name: "iswdigit", scope: !883, file: !883, line: 108, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!899 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !900, file: !880, line: 94)
!900 = !DISubprogram(name: "iswgraph", scope: !883, file: !883, line: 112, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!901 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !902, file: !880, line: 95)
!902 = !DISubprogram(name: "iswlower", scope: !883, file: !883, line: 117, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!903 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !904, file: !880, line: 96)
!904 = !DISubprogram(name: "iswprint", scope: !883, file: !883, line: 120, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!905 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !906, file: !880, line: 97)
!906 = !DISubprogram(name: "iswpunct", scope: !883, file: !883, line: 125, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!907 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !908, file: !880, line: 98)
!908 = !DISubprogram(name: "iswspace", scope: !883, file: !883, line: 130, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!909 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !910, file: !880, line: 99)
!910 = !DISubprogram(name: "iswupper", scope: !883, file: !883, line: 135, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!911 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !912, file: !880, line: 100)
!912 = !DISubprogram(name: "iswxdigit", scope: !883, file: !883, line: 140, type: !271, flags: DIFlagPrototyped, spFlags: 0)
!913 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !914, file: !880, line: 101)
!914 = !DISubprogram(name: "towctrans", scope: !877, file: !877, line: 55, type: !915, flags: DIFlagPrototyped, spFlags: 0)
!915 = !DISubroutineType(types: !916)
!916 = !{!64, !64, !876}
!917 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !918, file: !880, line: 102)
!918 = !DISubprogram(name: "towlower", scope: !883, file: !883, line: 166, type: !919, flags: DIFlagPrototyped, spFlags: 0)
!919 = !DISubroutineType(types: !920)
!920 = !{!64, !64}
!921 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !922, file: !880, line: 103)
!922 = !DISubprogram(name: "towupper", scope: !883, file: !883, line: 169, type: !919, flags: DIFlagPrototyped, spFlags: 0)
!923 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !924, file: !880, line: 104)
!924 = !DISubprogram(name: "wctrans", scope: !877, file: !877, line: 52, type: !925, flags: DIFlagPrototyped, spFlags: 0)
!925 = !DISubroutineType(types: !926)
!926 = !{!876, !122}
!927 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !10, entity: !928, file: !880, line: 105)
!928 = !DISubprogram(name: "wctype", scope: !883, file: !883, line: 155, type: !929, flags: DIFlagPrototyped, spFlags: 0)
!929 = !DISubroutineType(types: !930)
!930 = !{!882, !122}
!931 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !2, entity: !10, file: !3, line: 56)
!932 = !{i32 7, !"Dwarf Version", i32 4}
!933 = !{i32 2, !"Debug Info Version", i32 3}
!934 = !{i32 1, !"wchar_size", i32 4}
!935 = !{!"clang version 10.0.1 "}
!936 = distinct !DISubprogram(name: "foo", linkageName: "_Z3foov", scope: !3, file: !3, line: 70, type: !540, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!937 = !DILocation(line: 72, column: 13, scope: !936)
!938 = !DILocation(line: 73, column: 14, scope: !936)
!939 = !DILocation(line: 74, column: 1, scope: !936)
!940 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 76, type: !623, scopeLine: 77, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!941 = !DILocation(line: 78, column: 3, scope: !940)
!942 = !DILocation(line: 82, column: 3, scope: !940)
!943 = !DILocation(line: 83, column: 9, scope: !940)
!944 = !DILocation(line: 83, column: 7, scope: !940)
!945 = !DILocation(line: 83, column: 20, scope: !940)
!946 = !DILocation(line: 83, column: 28, scope: !940)
!947 = !DILocation(line: 83, column: 25, scope: !940)
!948 = !DILocation(line: 83, column: 39, scope: !940)
!949 = !DILocation(line: 84, column: 3, scope: !940)
!950 = distinct !DISubprogram(name: ".omp_outlined._debug__", scope: !3, file: !3, line: 79, type: !951, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!951 = !DISubroutineType(types: !952)
!952 = !{null, !953, !953}
!953 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !954)
!954 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !955)
!955 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !956, size: 64)
!956 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !19)
!957 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !950, type: !953, flags: DIFlagArtificial)
!958 = !DILocation(line: 0, scope: !950)
!959 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !950, type: !953, flags: DIFlagArtificial)
!960 = !DILocation(line: 80, column: 6, scope: !961)
!961 = distinct !DILexicalBlock(scope: !950, file: !3, line: 79, column: 3)
!962 = !DILocation(line: 81, column: 3, scope: !950)
!963 = distinct !DISubprogram(name: ".omp_outlined.", scope: !3, file: !3, line: 79, type: !951, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!964 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !963, type: !953, flags: DIFlagArtificial)
!965 = !DILocation(line: 0, scope: !963)
!966 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !963, type: !953, flags: DIFlagArtificial)
!967 = !DILocation(line: 79, column: 3, scope: !963)
!968 = !{!969}
!969 = !{i64 2, i64 -1, i64 -1, i1 true}
!970 = distinct !DISubprogram(name: "__cxx_global_var_init", scope: !11, file: !11, line: 74, type: !540, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!971 = !DILocation(line: 74, column: 25, scope: !970)
!972 = distinct !DISubprogram(linkageName: "_GLOBAL__sub_I_DRB086_static_data_member_orig_yes.cpp", scope: !3, file: !3, type: !973, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!973 = !DISubroutineType(types: !4)
!974 = !DILocation(line: 0, scope: !972)