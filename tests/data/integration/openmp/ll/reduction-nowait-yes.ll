; ModuleID = 'reduction-nowait-yes.c'
source_filename = "reduction-nowait-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr global %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [36 x i8] c";reduction-nowait-yes.c;main;11;1;;\00", align 1
@2 = private unnamed_addr constant [37 x i8] c";reduction-nowait-yes.c;main;11;46;;\00", align 1
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer
@3 = private unnamed_addr constant [36 x i8] c";reduction-nowait-yes.c;main;16;1;;\00", align 1
@4 = private unnamed_addr constant [37 x i8] c";reduction-nowait-yes.c;main;16;46;;\00", align 1
@5 = private unnamed_addr global %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@6 = private unnamed_addr constant [35 x i8] c";reduction-nowait-yes.c;main;9;1;;\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %N = alloca i32, align 4
  %counter = alloca i32, align 4
  %.kmpc_loc.addr = alloca %struct.ident_t, align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %struct.ident_t* @5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 24, i1 false)
  call void @llvm.dbg.declare(metadata i32* %N, metadata !11, metadata !DIExpression()), !dbg !13
  store i32 10000, i32* %N, align 4, !dbg !13
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %counter, align 4, !dbg !15
  %2 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !16
  store i8* getelementptr inbounds ([35 x i8], [35 x i8]* @6, i32 0, i32 0), i8** %2, align 8, !dbg !16
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* %.kmpc_loc.addr, i32 2, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %counter, i32* %N), !dbg !16
  %3 = load i32, i32* %counter, align 4, !dbg !17
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 %3), !dbg !18
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
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %counter1 = alloca i32, align 4
  %i = alloca i32, align 4
  %.kmpc_loc.addr = alloca %struct.ident_t, align 8
  %.omp.reduction.red_list = alloca [1 x i8*], align 8
  %.omp.iv5 = alloca i32, align 4
  %tmp6 = alloca i32, align 4
  %.omp.lb7 = alloca i32, align 4
  %.omp.ub8 = alloca i32, align 4
  %.omp.stride9 = alloca i32, align 4
  %.omp.is_last10 = alloca i32, align 4
  %counter11 = alloca i32, align 4
  %i12 = alloca i32, align 4
  %.omp.reduction.red_list29 = alloca [1 x i8*], align 8
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
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !36, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !40, metadata !DIExpression()), !dbg !39
  store i32 0, i32* %.omp.lb, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !42, metadata !DIExpression()), !dbg !39
  store i32 9999, i32* %.omp.ub, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !43, metadata !DIExpression()), !dbg !39
  store i32 1, i32* %.omp.stride, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !44, metadata !DIExpression()), !dbg !39
  store i32 0, i32* %.omp.is_last, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %counter1, metadata !45, metadata !DIExpression()), !dbg !39
  store i32 0, i32* %counter1, align 4, !dbg !46
  call void @llvm.dbg.declare(metadata i32* %i, metadata !47, metadata !DIExpression()), !dbg !39
  %4 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !48
  store i8* getelementptr inbounds ([36 x i8], [36 x i8]* @1, i32 0, i32 0), i8** %4, align 8, !dbg !48
  %5 = load i32*, i32** %.global_tid..addr, align 8, !dbg !48
  %6 = load i32, i32* %5, align 4, !dbg !48
  call void @__kmpc_for_static_init_4(%struct.ident_t* %.kmpc_loc.addr, i32 %6, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !48
  %7 = load i32, i32* %.omp.ub, align 4, !dbg !41
  %cmp = icmp sgt i32 %7, 9999, !dbg !41
  br i1 %cmp, label %cond.true, label %cond.false, !dbg !41

cond.true:                                        ; preds = %entry
  br label %cond.end, !dbg !41

cond.false:                                       ; preds = %entry
  %8 = load i32, i32* %.omp.ub, align 4, !dbg !41
  br label %cond.end, !dbg !41

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 9999, %cond.true ], [ %8, %cond.false ], !dbg !41
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !41
  %9 = load i32, i32* %.omp.lb, align 4, !dbg !41
  store i32 %9, i32* %.omp.iv, align 4, !dbg !41
  br label %omp.inner.for.cond, !dbg !48

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %10 = load i32, i32* %.omp.iv, align 4, !dbg !41
  %11 = load i32, i32* %.omp.ub, align 4, !dbg !41
  %cmp2 = icmp sle i32 %10, %11, !dbg !49
  br i1 %cmp2, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !48

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %12 = load i32, i32* %.omp.iv, align 4, !dbg !41
  %mul = mul nsw i32 %12, 1, !dbg !50
  %add = add nsw i32 0, %mul, !dbg !50
  store i32 %add, i32* %i, align 4, !dbg !50
  %13 = load i32, i32* %counter1, align 4, !dbg !51
  %inc = add nsw i32 %13, 1, !dbg !51
  store i32 %inc, i32* %counter1, align 4, !dbg !51
  br label %omp.body.continue, !dbg !53

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !54

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %14 = load i32, i32* %.omp.iv, align 4, !dbg !41
  %add3 = add nsw i32 %14, 1, !dbg !49
  store i32 %add3, i32* %.omp.iv, align 4, !dbg !49
  br label %omp.inner.for.cond, !dbg !54, !llvm.loop !55

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !54

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  %15 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !54
  store i8* getelementptr inbounds ([37 x i8], [37 x i8]* @2, i32 0, i32 0), i8** %15, align 8, !dbg !54
  call void @__kmpc_for_static_fini(%struct.ident_t* %.kmpc_loc.addr, i32 %6), !dbg !54
  %16 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.red_list, i64 0, i64 0, !dbg !54
  %17 = bitcast i32* %counter1 to i8*, !dbg !54
  store i8* %17, i8** %16, align 8, !dbg !54
  %18 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !54
  store i8* getelementptr inbounds ([37 x i8], [37 x i8]* @2, i32 0, i32 0), i8** %18, align 8, !dbg !54
  %19 = bitcast [1 x i8*]* %.omp.reduction.red_list to i8*, !dbg !54
  %20 = call i32 @__kmpc_reduce_nowait(%struct.ident_t* %.kmpc_loc.addr, i32 %6, i32 1, i64 8, i8* %19, void (i8*, i8*)* @.omp.reduction.reduction_func, [8 x i32]* @.gomp_critical_user_.reduction.var), !dbg !54
  switch i32 %20, label %.omp.reduction.default [
    i32 1, label %.omp.reduction.case1
    i32 2, label %.omp.reduction.case2
  ], !dbg !54

.omp.reduction.case1:                             ; preds = %omp.loop.exit
  %21 = load i32, i32* %2, align 4, !dbg !46
  %22 = load i32, i32* %counter1, align 4, !dbg !46
  %add4 = add nsw i32 %21, %22, !dbg !57
  store i32 %add4, i32* %2, align 4, !dbg !57
  call void @__kmpc_end_reduce_nowait(%struct.ident_t* %.kmpc_loc.addr, i32 %6, [8 x i32]* @.gomp_critical_user_.reduction.var), !dbg !54
  br label %.omp.reduction.default, !dbg !54

.omp.reduction.case2:                             ; preds = %omp.loop.exit
  %23 = load i32, i32* %counter1, align 4, !dbg !46
  %24 = atomicrmw add i32* %2, i32 %23 monotonic, !dbg !54
  br label %.omp.reduction.default, !dbg !54

.omp.reduction.default:                           ; preds = %.omp.reduction.case2, %.omp.reduction.case1, %omp.loop.exit
  call void @llvm.dbg.declare(metadata i32* %.omp.iv5, metadata !58, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata i32* %.omp.lb7, metadata !61, metadata !DIExpression()), !dbg !60
  store i32 0, i32* %.omp.lb7, align 4, !dbg !62
  call void @llvm.dbg.declare(metadata i32* %.omp.ub8, metadata !63, metadata !DIExpression()), !dbg !60
  store i32 9999, i32* %.omp.ub8, align 4, !dbg !62
  call void @llvm.dbg.declare(metadata i32* %.omp.stride9, metadata !64, metadata !DIExpression()), !dbg !60
  store i32 1, i32* %.omp.stride9, align 4, !dbg !62
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last10, metadata !65, metadata !DIExpression()), !dbg !60
  store i32 0, i32* %.omp.is_last10, align 4, !dbg !62
  call void @llvm.dbg.declare(metadata i32* %counter11, metadata !66, metadata !DIExpression()), !dbg !60
  store i32 0, i32* %counter11, align 4, !dbg !67
  call void @llvm.dbg.declare(metadata i32* %i12, metadata !68, metadata !DIExpression()), !dbg !60
  %25 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !69
  store i8* getelementptr inbounds ([36 x i8], [36 x i8]* @3, i32 0, i32 0), i8** %25, align 8, !dbg !69
  call void @__kmpc_for_static_init_4(%struct.ident_t* %.kmpc_loc.addr, i32 %6, i32 34, i32* %.omp.is_last10, i32* %.omp.lb7, i32* %.omp.ub8, i32* %.omp.stride9, i32 1, i32 1), !dbg !69
  %26 = load i32, i32* %.omp.ub8, align 4, !dbg !62
  %cmp13 = icmp sgt i32 %26, 9999, !dbg !62
  br i1 %cmp13, label %cond.true14, label %cond.false15, !dbg !62

cond.true14:                                      ; preds = %.omp.reduction.default
  br label %cond.end16, !dbg !62

cond.false15:                                     ; preds = %.omp.reduction.default
  %27 = load i32, i32* %.omp.ub8, align 4, !dbg !62
  br label %cond.end16, !dbg !62

cond.end16:                                       ; preds = %cond.false15, %cond.true14
  %cond17 = phi i32 [ 9999, %cond.true14 ], [ %27, %cond.false15 ], !dbg !62
  store i32 %cond17, i32* %.omp.ub8, align 4, !dbg !62
  %28 = load i32, i32* %.omp.lb7, align 4, !dbg !62
  store i32 %28, i32* %.omp.iv5, align 4, !dbg !62
  br label %omp.inner.for.cond18, !dbg !69

omp.inner.for.cond18:                             ; preds = %omp.inner.for.inc25, %cond.end16
  %29 = load i32, i32* %.omp.iv5, align 4, !dbg !62
  %30 = load i32, i32* %.omp.ub8, align 4, !dbg !62
  %cmp19 = icmp sle i32 %29, %30, !dbg !70
  br i1 %cmp19, label %omp.inner.for.body20, label %omp.inner.for.end27, !dbg !69

omp.inner.for.body20:                             ; preds = %omp.inner.for.cond18
  %31 = load i32, i32* %.omp.iv5, align 4, !dbg !62
  %mul21 = mul nsw i32 %31, 1, !dbg !71
  %add22 = add nsw i32 0, %mul21, !dbg !71
  store i32 %add22, i32* %i12, align 4, !dbg !71
  %32 = load i32, i32* %counter11, align 4, !dbg !72
  %inc23 = add nsw i32 %32, 1, !dbg !72
  store i32 %inc23, i32* %counter11, align 4, !dbg !72
  br label %omp.body.continue24, !dbg !74

omp.body.continue24:                              ; preds = %omp.inner.for.body20
  br label %omp.inner.for.inc25, !dbg !75

omp.inner.for.inc25:                              ; preds = %omp.body.continue24
  %33 = load i32, i32* %.omp.iv5, align 4, !dbg !62
  %add26 = add nsw i32 %33, 1, !dbg !70
  store i32 %add26, i32* %.omp.iv5, align 4, !dbg !70
  br label %omp.inner.for.cond18, !dbg !75, !llvm.loop !76

omp.inner.for.end27:                              ; preds = %omp.inner.for.cond18
  br label %omp.loop.exit28, !dbg !75

omp.loop.exit28:                                  ; preds = %omp.inner.for.end27
  %34 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !75
  store i8* getelementptr inbounds ([37 x i8], [37 x i8]* @4, i32 0, i32 0), i8** %34, align 8, !dbg !75
  call void @__kmpc_for_static_fini(%struct.ident_t* %.kmpc_loc.addr, i32 %6), !dbg !75
  %35 = getelementptr inbounds [1 x i8*], [1 x i8*]* %.omp.reduction.red_list29, i64 0, i64 0, !dbg !75
  %36 = bitcast i32* %counter11 to i8*, !dbg !75
  store i8* %36, i8** %35, align 8, !dbg !75
  %37 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !75
  store i8* getelementptr inbounds ([37 x i8], [37 x i8]* @4, i32 0, i32 0), i8** %37, align 8, !dbg !75
  %38 = bitcast [1 x i8*]* %.omp.reduction.red_list29 to i8*, !dbg !75
  %39 = call i32 @__kmpc_reduce_nowait(%struct.ident_t* %.kmpc_loc.addr, i32 %6, i32 1, i64 8, i8* %38, void (i8*, i8*)* @.omp.reduction.reduction_func.1, [8 x i32]* @.gomp_critical_user_.reduction.var), !dbg !75
  switch i32 %39, label %.omp.reduction.default33 [
    i32 1, label %.omp.reduction.case130
    i32 2, label %.omp.reduction.case232
  ], !dbg !75

.omp.reduction.case130:                           ; preds = %omp.loop.exit28
  %40 = load i32, i32* %2, align 4, !dbg !67
  %41 = load i32, i32* %counter11, align 4, !dbg !67
  %add31 = add nsw i32 %40, %41, !dbg !78
  store i32 %add31, i32* %2, align 4, !dbg !78
  call void @__kmpc_end_reduce_nowait(%struct.ident_t* %.kmpc_loc.addr, i32 %6, [8 x i32]* @.gomp_critical_user_.reduction.var), !dbg !75
  br label %.omp.reduction.default33, !dbg !75

.omp.reduction.case232:                           ; preds = %omp.loop.exit28
  %42 = load i32, i32* %counter11, align 4, !dbg !67
  %43 = atomicrmw add i32* %2, i32 %42 monotonic, !dbg !75
  br label %.omp.reduction.default33, !dbg !75

.omp.reduction.default33:                         ; preds = %.omp.reduction.case232, %.omp.reduction.case130, %omp.loop.exit28
  ret void, !dbg !79
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

declare dso_local void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare dso_local void @__kmpc_for_static_fini(%struct.ident_t*, i32)

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @.omp.reduction.reduction_func(i8* %0, i8* %1) #4 !dbg !80 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i8*, align 8
  store i8* %0, i8** %.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr, metadata !82, metadata !DIExpression()), !dbg !84
  store i8* %1, i8** %.addr1, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr1, metadata !85, metadata !DIExpression()), !dbg !84
  %2 = load i8*, i8** %.addr, align 8, !dbg !86
  %3 = bitcast i8* %2 to [1 x i8*]*, !dbg !86
  %4 = load i8*, i8** %.addr1, align 8, !dbg !86
  %5 = bitcast i8* %4 to [1 x i8*]*, !dbg !86
  %6 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0, !dbg !86
  %7 = load i8*, i8** %6, align 8, !dbg !86
  %8 = bitcast i8* %7 to i32*, !dbg !86
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %3, i64 0, i64 0, !dbg !86
  %10 = load i8*, i8** %9, align 8, !dbg !86
  %11 = bitcast i8* %10 to i32*, !dbg !86
  %12 = load i32, i32* %11, align 4, !dbg !87
  %13 = load i32, i32* %8, align 4, !dbg !87
  %add = add nsw i32 %12, %13, !dbg !88
  store i32 %add, i32* %11, align 4, !dbg !88
  ret void, !dbg !87
}

declare dso_local i32 @__kmpc_reduce_nowait(%struct.ident_t*, i32, i32, i64, i8*, void (i8*, i8*)*, [8 x i32]*)

declare dso_local void @__kmpc_end_reduce_nowait(%struct.ident_t*, i32, [8 x i32]*)

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @.omp.reduction.reduction_func.1(i8* %0, i8* %1) #4 !dbg !89 {
entry:
  %.addr = alloca i8*, align 8
  %.addr1 = alloca i8*, align 8
  store i8* %0, i8** %.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr, metadata !90, metadata !DIExpression()), !dbg !91
  store i8* %1, i8** %.addr1, align 8
  call void @llvm.dbg.declare(metadata i8** %.addr1, metadata !92, metadata !DIExpression()), !dbg !91
  %2 = load i8*, i8** %.addr, align 8, !dbg !93
  %3 = bitcast i8* %2 to [1 x i8*]*, !dbg !93
  %4 = load i8*, i8** %.addr1, align 8, !dbg !93
  %5 = bitcast i8* %4 to [1 x i8*]*, !dbg !93
  %6 = getelementptr inbounds [1 x i8*], [1 x i8*]* %5, i64 0, i64 0, !dbg !93
  %7 = load i8*, i8** %6, align 8, !dbg !93
  %8 = bitcast i8* %7 to i32*, !dbg !93
  %9 = getelementptr inbounds [1 x i8*], [1 x i8*]* %3, i64 0, i64 0, !dbg !93
  %10 = load i8*, i8** %9, align 8, !dbg !93
  %11 = bitcast i8* %10 to i32*, !dbg !93
  %12 = load i32, i32* %11, align 4, !dbg !94
  %13 = load i32, i32* %8, align 4, !dbg !94
  %add = add nsw i32 %12, %13, !dbg !95
  store i32 %add, i32* %11, align 4, !dbg !95
  ret void, !dbg !94
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %counter, i32* dereferenceable(4) %N) #2 !dbg !96 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %counter.addr = alloca i32*, align 8
  %N.addr = alloca i32*, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !97, metadata !DIExpression()), !dbg !98
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !99, metadata !DIExpression()), !dbg !98
  store i32* %counter, i32** %counter.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %counter.addr, metadata !100, metadata !DIExpression()), !dbg !98
  store i32* %N, i32** %N.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %N.addr, metadata !101, metadata !DIExpression()), !dbg !98
  %0 = load i32*, i32** %counter.addr, align 8, !dbg !102
  %1 = load i32*, i32** %N.addr, align 8, !dbg !102
  %2 = load i32*, i32** %.global_tid..addr, align 8, !dbg !102
  %3 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !102
  %4 = load i32*, i32** %counter.addr, align 8, !dbg !102
  %5 = load i32*, i32** %N.addr, align 8, !dbg !102
  call void @.omp_outlined._debug__(i32* %2, i32* %3, i32* %4, i32* %5) #6, !dbg !102
  ret void, !dbg !102
}

declare !callback !103 dso_local void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...)

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
!1 = !DIFile(filename: "reduction-nowait-yes.c", directory: "/home/brad/Code/OpenRace/tests/data/integration/openmp")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 "}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "N", scope: !7, file: !1, line: 6, type: !12)
!12 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!13 = !DILocation(line: 6, column: 13, scope: !7)
!14 = !DILocalVariable(name: "counter", scope: !7, file: !1, line: 7, type: !10)
!15 = !DILocation(line: 7, column: 7, scope: !7)
!16 = !DILocation(line: 9, column: 1, scope: !7)
!17 = !DILocation(line: 22, column: 18, scope: !7)
!18 = !DILocation(line: 22, column: 3, scope: !7)
!19 = !DILocation(line: 23, column: 1, scope: !7)
!20 = distinct !DISubprogram(name: ".omp_outlined._debug__", scope: !1, file: !1, line: 10, type: !21, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
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
!31 = !DILocalVariable(name: "counter", arg: 3, scope: !20, file: !1, line: 7, type: !26)
!32 = !DILocation(line: 7, column: 7, scope: !20)
!33 = !DILocalVariable(name: "N", arg: 4, scope: !20, file: !1, line: 6, type: !27)
!34 = !DILocation(line: 6, column: 13, scope: !20)
!35 = !DILocation(line: 10, column: 3, scope: !20)
!36 = !DILocalVariable(name: ".omp.iv", scope: !37, type: !10, flags: DIFlagArtificial)
!37 = distinct !DILexicalBlock(scope: !38, file: !1, line: 11, column: 1)
!38 = distinct !DILexicalBlock(scope: !20, file: !1, line: 10, column: 3)
!39 = !DILocation(line: 0, scope: !37)
!40 = !DILocalVariable(name: ".omp.lb", scope: !37, type: !10, flags: DIFlagArtificial)
!41 = !DILocation(line: 12, column: 10, scope: !37)
!42 = !DILocalVariable(name: ".omp.ub", scope: !37, type: !10, flags: DIFlagArtificial)
!43 = !DILocalVariable(name: ".omp.stride", scope: !37, type: !10, flags: DIFlagArtificial)
!44 = !DILocalVariable(name: ".omp.is_last", scope: !37, type: !10, flags: DIFlagArtificial)
!45 = !DILocalVariable(name: "counter", scope: !37, type: !10, flags: DIFlagArtificial)
!46 = !DILocation(line: 11, column: 31, scope: !37)
!47 = !DILocalVariable(name: "i", scope: !37, type: !10, flags: DIFlagArtificial)
!48 = !DILocation(line: 11, column: 1, scope: !38)
!49 = !DILocation(line: 12, column: 5, scope: !37)
!50 = !DILocation(line: 12, column: 28, scope: !37)
!51 = !DILocation(line: 13, column: 14, scope: !52)
!52 = distinct !DILexicalBlock(scope: !37, file: !1, line: 12, column: 33)
!53 = !DILocation(line: 14, column: 5, scope: !52)
!54 = !DILocation(line: 11, column: 1, scope: !37)
!55 = distinct !{!55, !54, !56}
!56 = !DILocation(line: 11, column: 46, scope: !37)
!57 = !DILocation(line: 11, column: 27, scope: !37)
!58 = !DILocalVariable(name: ".omp.iv", scope: !59, type: !10, flags: DIFlagArtificial)
!59 = distinct !DILexicalBlock(scope: !38, file: !1, line: 16, column: 1)
!60 = !DILocation(line: 0, scope: !59)
!61 = !DILocalVariable(name: ".omp.lb", scope: !59, type: !10, flags: DIFlagArtificial)
!62 = !DILocation(line: 17, column: 10, scope: !59)
!63 = !DILocalVariable(name: ".omp.ub", scope: !59, type: !10, flags: DIFlagArtificial)
!64 = !DILocalVariable(name: ".omp.stride", scope: !59, type: !10, flags: DIFlagArtificial)
!65 = !DILocalVariable(name: ".omp.is_last", scope: !59, type: !10, flags: DIFlagArtificial)
!66 = !DILocalVariable(name: "counter", scope: !59, type: !10, flags: DIFlagArtificial)
!67 = !DILocation(line: 16, column: 31, scope: !59)
!68 = !DILocalVariable(name: "i", scope: !59, type: !10, flags: DIFlagArtificial)
!69 = !DILocation(line: 16, column: 1, scope: !38)
!70 = !DILocation(line: 17, column: 5, scope: !59)
!71 = !DILocation(line: 17, column: 28, scope: !59)
!72 = !DILocation(line: 18, column: 14, scope: !73)
!73 = distinct !DILexicalBlock(scope: !59, file: !1, line: 17, column: 33)
!74 = !DILocation(line: 19, column: 5, scope: !73)
!75 = !DILocation(line: 16, column: 1, scope: !59)
!76 = distinct !{!76, !75, !77}
!77 = !DILocation(line: 16, column: 46, scope: !59)
!78 = !DILocation(line: 16, column: 27, scope: !59)
!79 = !DILocation(line: 20, column: 3, scope: !20)
!80 = distinct !DISubprogram(linkageName: ".omp.reduction.reduction_func", scope: !1, file: !1, line: 11, type: !81, scopeLine: 11, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DISubroutineType(types: !2)
!82 = !DILocalVariable(arg: 1, scope: !80, type: !83, flags: DIFlagArtificial)
!83 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!84 = !DILocation(line: 0, scope: !80)
!85 = !DILocalVariable(arg: 2, scope: !80, type: !83, flags: DIFlagArtificial)
!86 = !DILocation(line: 11, column: 46, scope: !80)
!87 = !DILocation(line: 11, column: 31, scope: !80)
!88 = !DILocation(line: 11, column: 27, scope: !80)
!89 = distinct !DISubprogram(linkageName: ".omp.reduction.reduction_func.1", scope: !1, file: !1, line: 16, type: !81, scopeLine: 16, flags: DIFlagArtificial, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!90 = !DILocalVariable(arg: 1, scope: !89, type: !83, flags: DIFlagArtificial)
!91 = !DILocation(line: 0, scope: !89)
!92 = !DILocalVariable(arg: 2, scope: !89, type: !83, flags: DIFlagArtificial)
!93 = !DILocation(line: 16, column: 46, scope: !89)
!94 = !DILocation(line: 16, column: 31, scope: !89)
!95 = !DILocation(line: 16, column: 27, scope: !89)
!96 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 10, type: !21, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !96, type: !23, flags: DIFlagArtificial)
!98 = !DILocation(line: 0, scope: !96)
!99 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !96, type: !23, flags: DIFlagArtificial)
!100 = !DILocalVariable(name: "counter", arg: 3, scope: !96, type: !26, flags: DIFlagArtificial)
!101 = !DILocalVariable(name: "N", arg: 4, scope: !96, type: !27, flags: DIFlagArtificial)
!102 = !DILocation(line: 10, column: 3, scope: !96)
!103 = !{!104}
!104 = !{i64 2, i64 -1, i64 -1, i1 true}
