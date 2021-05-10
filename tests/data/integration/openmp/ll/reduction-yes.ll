; ModuleID = 'reduction-yes.c'
source_filename = "reduction-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr global %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [29 x i8] c";reduction-yes.c;main;12;1;;\00", align 1
@2 = private unnamed_addr constant [29 x i8] c";reduction-yes.c;main;15;1;;\00", align 1
@3 = private unnamed_addr constant [30 x i8] c";reduction-yes.c;main;15;39;;\00", align 1
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer
@4 = private unnamed_addr constant [29 x i8] c";reduction-yes.c;main;10;1;;\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %N = alloca i32, align 4
  %counter = alloca i32, align 4
  %.kmpc_loc.addr = alloca %struct.ident_t, align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %struct.ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 24, i1 false)
  call void @llvm.dbg.declare(metadata i32* %N, metadata !11, metadata !DIExpression()), !dbg !13
  store i32 10000, i32* %N, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %counter, align 4, !dbg !15
  %2 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !16
  store i8* getelementptr inbounds ([29 x i8], [29 x i8]* @4, i32 0, i32 0), i8** %2, align 8, !dbg !16
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* %.kmpc_loc.addr, i32 2, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %counter, i32* %N), !dbg !16
  %3 = load i32, i32* %counter, align 4, !dbg !17
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i32 %3), !dbg !18
  ret i32 0, !dbg !19
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined._debug__(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %counter, i32* dereferenceable(4) %N) #2 !dbg !20 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %counter.addr = alloca i32*, align 8
  %N.addr = alloca i32*, align 8
  %.kmpc_loc.addr = alloca %struct.ident_t, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %counter1 = alloca i32, align 4
  %i = alloca i32, align 4
  %.omp.reduction.red_list = alloca [1 x i8*], align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %struct.ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 24, i1 false)
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !28, metadata !DIExpression()), !dbg !29
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !30, metadata !DIExpression()), !dbg !29
  store i32* %counter, i32** %counter.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %counter.addr, metadata !31, metadata !DIExpression()), !dbg !32
  store i32* %N, i32** %N.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %N.addr, metadata !33, metadata !DIExpression()), !dbg !34
  %2 = load i32*, i32** %counter.addr, align 8, !dbg !35
  %3 = load i32*, i32** %N.addr, align 8, !dbg !35
  %4 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !36
  store i8* getelementptr inbounds ([29 x i8], [29 x i8]* @1, i32 0, i32 0), i8** %4, align 8, !dbg !36
  %5 = load i32*, i32** %.global_tid..addr, align 8, !dbg !36
  %6 = load i32, i32* %5, align 4, !dbg !36
  %7 = call i32 @__kmpc_master(%struct.ident_t* %.kmpc_loc.addr, i32 %6), !dbg !36
  %8 = icmp ne i32 %7, 0, !dbg !36
  br i1 %8, label %omp_if.then, label %omp_if.end, !dbg !36

omp_if.then:                                      ; preds = %entry
  store i32 1, i32* %2, align 4, !dbg !38
  call void @__kmpc_end_master(%struct.ident_t* %.kmpc_loc.addr, i32 %6), !dbg !40
  br label %omp_if.end, !dbg !40

omp_if.end:                                       ; preds = %omp_if.then, %entry
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !41, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !44, metadata !DIExpression()), !dbg !43
  store i32 0, i32* %.omp.lb, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !46, metadata !DIExpression()), !dbg !43
  store i32 9999, i32* %.omp.ub, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !47, metadata !DIExpression()), !dbg !43
  store i32 1, i32* %.omp.stride, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !48, metadata !DIExpression()), !dbg !43
  store i32 0, i32* %.omp.is_last, align 4, !dbg !45
  call void @llvm.dbg.declare(metadata i32* %counter1, metadata !49, metadata !DIExpression()), !dbg !43
  store i32 0, i32* %counter1, align 4, !dbg !50
  call void @llvm.dbg.declare(metadata i32* %i, metadata !51, metadata !DIExpression()), !dbg !43
  %9 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !52
  store i8* getelementptr inbounds ([29 x i8], [29 x i8]* @2, i32 0, i32 0), i8** %9, align 8, !dbg !52
  call void @__kmpc_for_static_init_4(%struct.ident_t* %.kmpc_loc.addr, i32 %6, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !52
  %10 = load i32, i32* %.omp.ub, align 4, !dbg !45
  %cmp = icmp sgt i32 %10, 9999, !dbg !45
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !45

cond.true:                                        ; preds = %omp_if.end
  br label %cond.end, !dbg !45

cond.false:                                       ; preds = %omp_if.end
  %11 = load i32, i32* %.omp.ub, align 4, !dbg !45
  br label %cond.end, !dbg !45

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 9999, %cond.true ], [ %11, %cond.false ], !dbg !45
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !45
  %12 = load i32, i32* %.omp.lb, align 4, !dbg !45
  store i32 %12, i32* %.omp.iv, align 4, !dbg !45
  br label %omp.inner.for.cond, !dbg !52

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %13 = load i32, i32* %.omp.iv, align 4, !dbg !45
  %14 = load i32, i32* %.omp.ub, align 4, !dbg !45
  %cmp2 = icmp sle i32 %13, %14, !dbg !53
  br i1 %cmp2, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !52

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %15 = load i32, i32* %.omp.iv, align 4, !dbg !45
  %mul = mul nsw i32 %15, 1, !dbg !54
  %add = add nsw i32 0, %mul, !dbg !54
  store i32 %add, i32* %i, align 4, !dbg !54
  %16 = load i32, i32* %counter1, align 4, !dbg !55
  %inc = add nsw i32 %16, 1, !dbg !55
  store i32 %inc, i32* %counter1, align 4, !dbg !55
  br label %omp.body.continue, !dbg !57

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !58

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %17 = load i32, i32* %.omp.iv, align 4, !dbg !45
  %add3 = add nsw i32 %17, 1, !dbg !53
  store i32 %add3, i32* %.omp.iv, align 4, !dbg !53
  br label %omp.inner.for.cond, !dbg !58, !llvm.loop !59

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !58

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  %18 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !58
  store i8* getelementptr inbounds ([30 x i8], [30 x i8]* @3, i32 0, i32 0), i8** %18, align 8, !dbg !58
  call void @__kmpc_for_static_fini(%struct.ident_t* %.kmpc_loc.addr, i32 %6), !dbg !58
  %19 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.red_list, i64 0, i64 0, !dbg !58
  %20 = bitcast i32* %counter1 to i8*, !dbg !58
  store i8* %20, i8** %19, align 8, !dbg !58
  %21 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !58
  store i8* getelementptr inbounds ([30 x i8], [30 x i8]* @3, i32 0, i32 0), i8** %21, align 8, !dbg !58
  %22 = bitcast [1 x i8*]* %.omp.reduction.red_list to i8*, !dbg !58
  %23 = call i32 @__kmpc_reduce(%struct.ident_t* %.kmpc_loc.addr, i32 %6, i32 1, i64 8, i8* %22, void (i8*, i8*)* @.omp.reduction.reduction_func, [8 x i32]* @.gomp_critical_user_.reduction.var), !dbg !58
  switch i32 %23, label %.omp.reduction.default [
    i32 1, label %.omp.reduction.case1
    i32 2, label %.omp.reduction.case2
  ], !dbg !58

.omp.reduction.case1:                             ; preds = %omp.loop.exit
  %24 = load i32, i32* %2, align 4, !dbg !50
  %25 = load i32, i32* %counter1, align 4, !dbg !50
  %add4 = add nsw i32 %24, %25, !dbg !61
  store i32 %add4, i32* %2, align 4, !dbg !61
  call void @__kmpc_end_reduce(%struct.ident_t* %.kmpc_loc.addr, i32 %6, [8 x i32]* @.gomp_critical_user_.reduction.var), !dbg !58
  br label %.omp.reduction.default, !dbg !58

.omp.reduction.case2:                             ; preds = %omp.loop.exit
  %26 = load i32, i32* %counter1, align 4, !dbg !50
  %27 = atomicrmw add i32* %2, i32 %26 monotonic, !dbg !58
  call void @__kmpc_end_reduce(%struct.ident_t* %.kmpc_loc.addr, i32 %6, [8 x i32]* @.gomp_critical_user_.reduction.var), !dbg !58
  br label %.omp.reduction.default, !dbg !58

.omp.reduction.default:                           ; preds = %.omp.reduction.case2, %.omp.reduction.case1, %omp.loop.exit
  %28 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !60
  store i8* getelementptr inbounds ([29 x i8], [29 x i8]* @2, i32 0, i32 0), i8** %28, align 8, !dbg !60
  call void @__kmpc_barrier(%struct.ident_t* %.kmpc_loc.addr, i32 %6), !dbg !60
  ret void, !dbg !62
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @__kmpc_end_master(%struct.ident_t*, i32)

declare dso_local i32 @__kmpc_master(%struct.ident_t*, i32)

declare dso_local void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare dso_local void @__kmpc_for_static_fini(%struct.ident_t*, i32)

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @.omp.reduction.reduction_func(i8* %0, i8* %1) #4 !dbg !63 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i8*, align 8
  store i8* %0, i8** %.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr, metadata !65, metadata !DIExpression()), !dbg !67
  store i8* %1, i8** %.addr1, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr1, metadata !68, metadata !DIExpression()), !dbg !67
  %2 = load i8*, i8** %.addr, align 8, !dbg !69
  %3 = bitcast i8* %2 to [1 x i8*]*, !dbg !69
  %4 = load i8*, i8** %.addr1, align 8, !dbg !69
  %5 = bitcast i8* %4 to [1 x i8*]*, !dbg !69
  %6 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0, !dbg !69
  %7 = load i8*, i8** %6, align 8, !dbg !69
  %8 = bitcast i8* %7 to i32*, !dbg !69
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %3, i64 0, i64 0, !dbg !69
  %10 = load i8*, i8** %9, align 8, !dbg !69
  %11 = bitcast i8* %10 to i32*, !dbg !69
  %12 = load i32, i32* %11, align 4, !dbg !70
  %13 = load i32, i32* %8, align 4, !dbg !70
  %add = add nsw i32 %12, %13, !dbg !71
  store i32 %add, i32* %11, align 4, !dbg !71
  ret void, !dbg !70
}

declare dso_local i32 @__kmpc_reduce(%struct.ident_t*, i32, i32, i64, i8*, void (i8*, i8*)*, [8 x i32]*)

declare dso_local void @__kmpc_end_reduce(%struct.ident_t*, i32, [8 x i32]*)

declare dso_local void @__kmpc_barrier(%struct.ident_t*, i32)

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %counter, i32* dereferenceable(4) %N) #2 !dbg !72 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %counter.addr = alloca i32*, align 8
  %N.addr = alloca i32*, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !73, metadata !DIExpression()), !dbg !74
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !75, metadata !DIExpression()), !dbg !74
  store i32* %counter, i32** %counter.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %counter.addr, metadata !76, metadata !DIExpression()), !dbg !74
  store i32* %N, i32** %N.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %N.addr, metadata !77, metadata !DIExpression()), !dbg !74
  %0 = load i32*, i32** %counter.addr, align 8, !dbg !78
  %1 = load i32*, i32** %N.addr, align 8, !dbg !78
  %2 = load i32*, i32** %.global_tid..addr, align 8, !dbg !78
  %3 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !78
  %4 = load i32*, i32** %counter.addr, align 8, !dbg !78
  %5 = load i32*, i32** %N.addr, align 8, !dbg !78
  call void @.omp_outlined._debug__(i32* %2, i32* %3, i32* %4, i32* %5) #6, !dbg !78
  ret void, !dbg !78
}

declare !callback !79 dso_local void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...)

declare dso_local i32 @printf(i8*, ...) #5

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { noinline norecurse nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind willreturn }
attributes #4 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "reduction-yes.c", directory: "/home/brad/Code/OpenRace/tests/data/integration/openmp")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 "}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !8, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "N", scope: !7, file: !1, line: 7, type: !12)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!13 = !DILocation(line: 7, column: 13, scope: !7)
!14 = !DILocalVariable(name: "counter", scope: !7, file: !1, line: 8, type: !10)
!15 = !DILocation(line: 8, column: 7, scope: !7)
!16 = !DILocation(line: 10, column: 1, scope: !7)
!17 = !DILocation(line: 21, column: 18, scope: !7)
!18 = !DILocation(line: 21, column: 3, scope: !7)
!19 = !DILocation(line: 22, column: 1, scope: !7)
!20 = distinct !DISubprogram(name: ".omp_outlined._debug__", scope: !1, file: !1, line: 11, type: !21, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!21 = !DISubroutineType(types: !22)
!22 = !{null, !23, !23, !26, !27}
!23 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !24)
!24 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!26 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !10, size: 64)
!27 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !12, size: 64)
!28 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !20, type: !23, flags: DIFlagArtificial)
!29 = !DILocation(line: 0, scope: !20)
!30 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !20, type: !23, flags: DIFlagArtificial)
!31 = !DILocalVariable(name: "counter", arg: 3, scope: !20, file: !1, line: 8, type: !26)
!32 = !DILocation(line: 8, column: 7, scope: !20)
!33 = !DILocalVariable(name: "N", arg: 4, scope: !20, file: !1, line: 7, type: !27)
!34 = !DILocation(line: 7, column: 13, scope: !20)
!35 = !DILocation(line: 11, column: 3, scope: !20)
!36 = !DILocation(line: 12, column: 1, scope: !37)
!37 = distinct !DILexicalBlock(scope: !20, file: !1, line: 11, column: 3)
!38 = !DILocation(line: 13, column: 13, scope: !39)
!39 = distinct !DILexicalBlock(scope: !37, file: !1, line: 12, column: 1)
!40 = !DILocation(line: 13, column: 5, scope: !39)
!41 = !DILocalVariable(name: ".omp.iv", scope: !42, type: !10, flags: DIFlagArtificial)
!42 = distinct !DILexicalBlock(scope: !37, file: !1, line: 15, column: 1)
!43 = !DILocation(line: 0, scope: !42)
!44 = !DILocalVariable(name: ".omp.lb", scope: !42, type: !10, flags: DIFlagArtificial)
!45 = !DILocation(line: 16, column: 10, scope: !42)
!46 = !DILocalVariable(name: ".omp.ub", scope: !42, type: !10, flags: DIFlagArtificial)
!47 = !DILocalVariable(name: ".omp.stride", scope: !42, type: !10, flags: DIFlagArtificial)
!48 = !DILocalVariable(name: ".omp.is_last", scope: !42, type: !10, flags: DIFlagArtificial)
!49 = !DILocalVariable(name: "counter", scope: !42, type: !10, flags: DIFlagArtificial)
!50 = !DILocation(line: 15, column: 31, scope: !42)
!51 = !DILocalVariable(name: "i", scope: !42, type: !10, flags: DIFlagArtificial)
!52 = !DILocation(line: 15, column: 1, scope: !37)
!53 = !DILocation(line: 16, column: 5, scope: !42)
!54 = !DILocation(line: 16, column: 28, scope: !42)
!55 = !DILocation(line: 17, column: 14, scope: !56)
!56 = distinct !DILexicalBlock(scope: !42, file: !1, line: 16, column: 33)
!57 = !DILocation(line: 18, column: 5, scope: !56)
!58 = !DILocation(line: 15, column: 1, scope: !42)
!59 = distinct !{!59, !58, !60}
!60 = !DILocation(line: 15, column: 39, scope: !42)
!61 = !DILocation(line: 15, column: 27, scope: !42)
!62 = !DILocation(line: 19, column: 3, scope: !20)
!63 = distinct !DISubprogram(linkageName: ".omp.reduction.reduction_func", scope: !1, file: !1, line: 15, type: !64, scopeLine: 15, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !2)
!65 = !DILocalVariable(arg: 1, scope: !63, type: !66, flags: DIFlagArtificial)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!67 = !DILocation(line: 0, scope: !63)
!68 = !DILocalVariable(arg: 2, scope: !63, type: !66, flags: DIFlagArtificial)
!69 = !DILocation(line: 15, column: 39, scope: !63)
!70 = !DILocation(line: 15, column: 31, scope: !63)
!71 = !DILocation(line: 15, column: 27, scope: !63)
!72 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 11, type: !21, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !72, type: !23, flags: DIFlagArtificial)
!74 = !DILocation(line: 0, scope: !72)
!75 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !72, type: !23, flags: DIFlagArtificial)
!76 = !DILocalVariable(name: "counter", arg: 3, scope: !72, type: !26, flags: DIFlagArtificial)
!77 = !DILocalVariable(name: "N", arg: 4, scope: !72, type: !27, flags: DIFlagArtificial)
!78 = !DILocation(line: 11, column: 3, scope: !72)
!79 = !{!80}
!80 = !{i64 2, i64 -1, i64 -1, i1 true}
