; ModuleID = 'integration/dataracebench/DRB010-lastprivatemissing-var-yes.c'
source_filename = "integration/dataracebench/DRB010-lastprivatemissing-var-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr global %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [75 x i8] c";integration/dataracebench/DRB010-lastprivatemissing-var-yes.c;main;61;1;;\00", align 1
@2 = private unnamed_addr constant [76 x i8] c";integration/dataracebench/DRB010-lastprivatemissing-var-yes.c;main;61;38;;\00", align 1
@3 = private unnamed_addr global %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@.str.1 = private unnamed_addr constant [5 x i8] c"x=%d\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !13 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %x = alloca i32, align 4
  %len = alloca i32, align 4
  %.kmpc_loc.addr = alloca %struct.ident_t, align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %struct.ident_t* @3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 24, i1 false)
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4, !tbaa !22
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !17, metadata !DIExpression()), !dbg !26
  store i8** %argv, i8*** %argv.addr, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !18, metadata !DIExpression()), !dbg !29
  %2 = bitcast i32* %i to i8*, !dbg !30
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #7, !dbg !30
  call void @llvm.dbg.declare(metadata i32* %i, metadata !19, metadata !DIExpression()), !dbg !31
  %3 = bitcast i32* %x to i8*, !dbg !30
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #7, !dbg !30
  call void @llvm.dbg.declare(metadata i32* %x, metadata !20, metadata !DIExpression()), !dbg !32
  %4 = bitcast i32* %len to i8*, !dbg !33
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #7, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %len, metadata !21, metadata !DIExpression()), !dbg !34
  store i32 10000, i32* %len, align 4, !dbg !34, !tbaa !22
  %5 = load i32, i32* %argc.addr, align 4, !dbg !35, !tbaa !22
  %cmp = icmp sgt i32 %5, 1, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %6 = load i8**, i8*** %argv.addr, align 8, !dbg !39, !tbaa !27
  %arrayidx = getelementptr inbounds i8*, i8** %6, i64 1, !dbg !39
  %7 = load i8*, i8** %arrayidx, align 8, !dbg !39, !tbaa !27
  %call = call i32 @atoi(i8* %7) #8, !dbg !40
  store i32 %call, i32* %len, align 4, !dbg !41, !tbaa !22
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  %8 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !43
  store i8* getelementptr inbounds ([75 x i8], [75 x i8]* @1, i32 0, i32 0), i8** %8, align 8, !dbg !43, !tbaa !44
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* %.kmpc_loc.addr, i32 2, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %len, i32* %x), !dbg !43
  %9 = load i32, i32* %x, align 4, !dbg !46, !tbaa !22
  %call1 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0), i32 %9), !dbg !47
  %10 = bitcast i32* %len to i8*, !dbg !48
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #7, !dbg !48
  %11 = bitcast i32* %x to i8*, !dbg !48
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %11) #7, !dbg !48
  %12 = bitcast i32* %i to i8*, !dbg !48
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %12) #7, !dbg !48
  ret i32 0, !dbg !49
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: inlinehint nounwind readonly uwtable
define available_externally dso_local i32 @atoi(i8* nonnull %__nptr) #3 !dbg !50 {
entry:
  %__nptr.addr = alloca i8*, align 8
  store i8* %__nptr, i8** %__nptr.addr, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i8** %__nptr.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i8*, i8** %__nptr.addr, align 8, !dbg !59, !tbaa !27
  %call = call i64 @strtol(i8* %0, i8** null, i32 10) #7, !dbg !60
  %conv = trunc i64 %call to i32, !dbg !61
  ret i32 %conv, !dbg !62
}

; Function Attrs: norecurse nounwind uwtable
define internal void @.omp_outlined._debug__(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %len, i32* dereferenceable(4) %x) #4 !dbg !63 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %len.addr = alloca i32*, align 8
  %x.addr = alloca i32*, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.capture_expr. = alloca i32, align 4
  %.capture_expr.1 = alloca i32, align 4
  %i = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %i4 = alloca i32, align 4
  %i5 = alloca i32, align 4
  %.kmpc_loc.addr = alloca %struct.ident_t, align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %struct.ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 24, i1 false)
  store i32* %.global_tid., i32** %.global_tid..addr, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !72, metadata !DIExpression()), !dbg !83
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !73, metadata !DIExpression()), !dbg !83
  store i32* %len, i32** %len.addr, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i32** %len.addr, metadata !74, metadata !DIExpression()), !dbg !84
  store i32* %x, i32** %x.addr, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !75, metadata !DIExpression()), !dbg !85
  %2 = load i32*, i32** %len.addr, align 8, !dbg !86, !tbaa !27
  %3 = load i32*, i32** %x.addr, align 8, !dbg !86, !tbaa !27
  %4 = bitcast i32* %.omp.iv to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %4) #7, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !76, metadata !DIExpression()), !dbg !83
  %5 = bitcast i32* %.capture_expr. to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %5) #7, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %.capture_expr., metadata !77, metadata !DIExpression()), !dbg !83
  %6 = load i32, i32* %2, align 4, !dbg !87, !tbaa !22
  store i32 %6, i32* %.capture_expr., align 4, !dbg !87, !tbaa !22
  %7 = bitcast i32* %.capture_expr.1 to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #7, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %.capture_expr.1, metadata !77, metadata !DIExpression()), !dbg !83
  %8 = load i32, i32* %.capture_expr., align 4, !dbg !87, !tbaa !22
  %sub = sub nsw i32 %8, 0, !dbg !86
  %sub2 = sub nsw i32 %sub, 1, !dbg !86
  %add = add nsw i32 %sub2, 1, !dbg !86
  %div = sdiv i32 %add, 1, !dbg !86
  %sub3 = sub nsw i32 %div, 1, !dbg !86
  store i32 %sub3, i32* %.capture_expr.1, align 4, !dbg !86, !tbaa !22
  %9 = bitcast i32* %i to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %9) #7, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %i, metadata !78, metadata !DIExpression()), !dbg !83
  store i32 0, i32* %i, align 4, !dbg !88, !tbaa !22
  %10 = bitcast i32* %i to i8*, !dbg !86
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %10) #7, !dbg !86
  %11 = load i32, i32* %.capture_expr., align 4, !dbg !87, !tbaa !22
  %cmp = icmp slt i32 0, %11, !dbg !86
  br i1 %cmp, label %omp.precond.then, label %omp.precond.end, !dbg !86

omp.precond.then:                                 ; preds = %entry
  %12 = bitcast i32* %.omp.lb to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %12) #7, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !79, metadata !DIExpression()), !dbg !83
  store i32 0, i32* %.omp.lb, align 4, !dbg !89, !tbaa !22
  %13 = bitcast i32* %.omp.ub to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %13) #7, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !80, metadata !DIExpression()), !dbg !83
  %14 = load i32, i32* %.capture_expr.1, align 4, !dbg !86, !tbaa !22
  store i32 %14, i32* %.omp.ub, align 4, !dbg !89, !tbaa !22
  %15 = bitcast i32* %.omp.stride to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %15) #7, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !81, metadata !DIExpression()), !dbg !83
  store i32 1, i32* %.omp.stride, align 4, !dbg !89, !tbaa !22
  %16 = bitcast i32* %.omp.is_last to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %16) #7, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !82, metadata !DIExpression()), !dbg !83
  store i32 0, i32* %.omp.is_last, align 4, !dbg !89, !tbaa !22
  %17 = bitcast i32* %i4 to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %17) #7, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %i4, metadata !78, metadata !DIExpression()), !dbg !83
  %18 = bitcast i32* %i5 to i8*, !dbg !86
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %18) #7, !dbg !86
  call void @llvm.dbg.declare(metadata i32* %i5, metadata !78, metadata !DIExpression()), !dbg !83
  %19 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !86
  store i8* getelementptr inbounds ([75 x i8], [75 x i8]* @1, i32 0, i32 0), i8** %19, align 8, !dbg !86, !tbaa !44
  %20 = load i32*, i32** %.global_tid..addr, align 8, !dbg !86
  %21 = load i32, i32* %20, align 4, !dbg !86, !tbaa !22
  call void @__kmpc_for_static_init_4(%struct.ident_t* %.kmpc_loc.addr, i32 %21, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !86
  %22 = load i32, i32* %.omp.ub, align 4, !dbg !89, !tbaa !22
  %23 = load i32, i32* %.capture_expr.1, align 4, !dbg !86, !tbaa !22
  %cmp6 = icmp sgt i32 %22, %23, !dbg !89
  br i1 %cmp6, label %cond.true, label %cond.false, !dbg !89

cond.true:                                        ; preds = %omp.precond.then
  %24 = load i32, i32* %.capture_expr.1, align 4, !dbg !86, !tbaa !22
  br label %cond.end, !dbg !89

cond.false:                                       ; preds = %omp.precond.then
  %25 = load i32, i32* %.omp.ub, align 4, !dbg !89, !tbaa !22
  br label %cond.end, !dbg !89

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %24, %cond.true ], [ %25, %cond.false ], !dbg !89
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !89, !tbaa !22
  %26 = load i32, i32* %.omp.lb, align 4, !dbg !89, !tbaa !22
  store i32 %26, i32* %.omp.iv, align 4, !dbg !89, !tbaa !22
  br label %omp.inner.for.cond, !dbg !86

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %27 = load i32, i32* %.omp.iv, align 4, !dbg !89, !tbaa !22
  %28 = load i32, i32* %.omp.ub, align 4, !dbg !89, !tbaa !22
  %cmp7 = icmp sle i32 %27, %28, !dbg !86
  br i1 %cmp7, label %omp.inner.for.body, label %omp.inner.for.cond.cleanup, !dbg !86

omp.inner.for.cond.cleanup:                       ; preds = %omp.inner.for.cond
  br label %omp.inner.for.end, !dbg !86

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %29 = load i32, i32* %.omp.iv, align 4, !dbg !89, !tbaa !22
  %mul = mul nsw i32 %29, 1, !dbg !88
  %add8 = add nsw i32 0, %mul, !dbg !88
  store i32 %add8, i32* %i4, align 4, !dbg !88, !tbaa !22
  %30 = load i32, i32* %i4, align 4, !dbg !90, !tbaa !22
  store i32 %30, i32* %3, align 4, !dbg !91, !tbaa !22
  br label %omp.body.continue, !dbg !92

omp.body.continue:                                ; preds = %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !93

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %31 = load i32, i32* %.omp.iv, align 4, !dbg !89, !tbaa !22
  %add9 = add nsw i32 %31, 1, !dbg !86
  store i32 %add9, i32* %.omp.iv, align 4, !dbg !86, !tbaa !22
  br label %omp.inner.for.cond, !dbg !93, !llvm.loop !94

omp.inner.for.end:                                ; preds = %omp.inner.for.cond.cleanup
  br label %omp.loop.exit, !dbg !93

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  %32 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !93
  store i8* getelementptr inbounds ([76 x i8], [76 x i8]* @2, i32 0, i32 0), i8** %32, align 8, !dbg !93, !tbaa !44
  %33 = load i32*, i32** %.global_tid..addr, align 8, !dbg !93
  %34 = load i32, i32* %33, align 4, !dbg !93, !tbaa !22
  call void @__kmpc_for_static_fini(%struct.ident_t* %.kmpc_loc.addr, i32 %34), !dbg !93
  %35 = bitcast i32* %i5 to i8*, !dbg !93
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %35) #7, !dbg !93
  %36 = bitcast i32* %i4 to i8*, !dbg !93
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %36) #7, !dbg !93
  %37 = bitcast i32* %.omp.is_last to i8*, !dbg !93
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %37) #7, !dbg !93
  %38 = bitcast i32* %.omp.stride to i8*, !dbg !93
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %38) #7, !dbg !93
  %39 = bitcast i32* %.omp.ub to i8*, !dbg !93
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %39) #7, !dbg !93
  %40 = bitcast i32* %.omp.lb to i8*, !dbg !93
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %40) #7, !dbg !93
  br label %omp.precond.end, !dbg !93

omp.precond.end:                                  ; preds = %omp.loop.exit, %entry
  %41 = bitcast i32* %.capture_expr.1 to i8*, !dbg !93
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %41) #7, !dbg !93
  %42 = bitcast i32* %.capture_expr. to i8*, !dbg !93
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #7, !dbg !93
  %43 = bitcast i32* %.omp.iv to i8*, !dbg !93
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %43) #7, !dbg !93
  ret void, !dbg !90
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare dso_local void @__kmpc_for_static_fini(%struct.ident_t*, i32)

; Function Attrs: norecurse nounwind uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %len, i32* dereferenceable(4) %x) #4 !dbg !96 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %len.addr = alloca i32*, align 8
  %x.addr = alloca i32*, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !98, metadata !DIExpression()), !dbg !102
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !99, metadata !DIExpression()), !dbg !102
  store i32* %len, i32** %len.addr, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i32** %len.addr, metadata !100, metadata !DIExpression()), !dbg !102
  store i32* %x, i32** %x.addr, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !101, metadata !DIExpression()), !dbg !102
  %0 = load i32*, i32** %len.addr, align 8, !dbg !103, !tbaa !27
  %1 = load i32*, i32** %x.addr, align 8, !dbg !103, !tbaa !27
  %2 = load i32*, i32** %.global_tid..addr, align 8, !dbg !103, !tbaa !27
  %3 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !103, !tbaa !27
  %4 = load i32*, i32** %len.addr, align 8, !dbg !103, !tbaa !27
  %5 = load i32*, i32** %x.addr, align 8, !dbg !103, !tbaa !27
  call void @.omp_outlined._debug__(i32* %2, i32* %3, i32* %4, i32* %5) #7, !dbg !103
  ret void, !dbg !103
}

declare !callback !104 dso_local void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...)

declare dso_local i32 @printf(i8*, ...) #5

; Function Attrs: nounwind
declare dso_local i64 @strtol(i8*, i8**, i32) #6

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nounwind willreturn }
attributes #3 = { inlinehint nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind }
attributes #8 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "integration/dataracebench/DRB010-lastprivatemissing-var-yes.c", directory: "/home/brad/Code/OpenRace/tests/data")
!2 = !{}
!3 = !{!4, !5, !8}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{!"clang version 10.0.1 "}
!13 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 54, type: !14, scopeLine: 55, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !16)
!14 = !DISubroutineType(types: !15)
!15 = !{!4, !4, !5}
!16 = !{!17, !18, !19, !20, !21}
!17 = !DILocalVariable(name: "argc", arg: 1, scope: !13, file: !1, line: 54, type: !4)
!18 = !DILocalVariable(name: "argv", arg: 2, scope: !13, file: !1, line: 54, type: !5)
!19 = !DILocalVariable(name: "i", scope: !13, file: !1, line: 56, type: !4)
!20 = !DILocalVariable(name: "x", scope: !13, file: !1, line: 56, type: !4)
!21 = !DILocalVariable(name: "len", scope: !13, file: !1, line: 57, type: !4)
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !24, i64 0}
!24 = !{!"omnipotent char", !25, i64 0}
!25 = !{!"Simple C/C++ TBAA"}
!26 = !DILocation(line: 54, column: 14, scope: !13)
!27 = !{!28, !28, i64 0}
!28 = !{!"any pointer", !24, i64 0}
!29 = !DILocation(line: 54, column: 26, scope: !13)
!30 = !DILocation(line: 56, column: 3, scope: !13)
!31 = !DILocation(line: 56, column: 7, scope: !13)
!32 = !DILocation(line: 56, column: 9, scope: !13)
!33 = !DILocation(line: 57, column: 3, scope: !13)
!34 = !DILocation(line: 57, column: 7, scope: !13)
!35 = !DILocation(line: 58, column: 7, scope: !36)
!36 = distinct !DILexicalBlock(scope: !13, file: !1, line: 58, column: 7)
!37 = !DILocation(line: 58, column: 11, scope: !36)
!38 = !DILocation(line: 58, column: 7, scope: !13)
!39 = !DILocation(line: 59, column: 16, scope: !36)
!40 = !DILocation(line: 59, column: 11, scope: !36)
!41 = !DILocation(line: 59, column: 9, scope: !36)
!42 = !DILocation(line: 59, column: 5, scope: !36)
!43 = !DILocation(line: 61, column: 1, scope: !13)
!44 = !{!45, !28, i64 16}
!45 = !{!"ident_t", !23, i64 0, !23, i64 4, !23, i64 8, !23, i64 12, !28, i64 16}
!46 = !DILocation(line: 64, column: 17, scope: !13)
!47 = !DILocation(line: 64, column: 3, scope: !13)
!48 = !DILocation(line: 66, column: 1, scope: !13)
!49 = !DILocation(line: 65, column: 3, scope: !13)
!50 = distinct !DISubprogram(name: "atoi", scope: !51, file: !51, line: 361, type: !52, scopeLine: 362, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !56)
!51 = !DIFile(filename: "/usr/include/stdlib.h", directory: "")
!52 = !DISubroutineType(types: !53)
!53 = !{!4, !54}
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!56 = !{!57}
!57 = !DILocalVariable(name: "__nptr", arg: 1, scope: !50, file: !51, line: 361, type: !54)
!58 = !DILocation(line: 361, column: 1, scope: !50)
!59 = !DILocation(line: 363, column: 24, scope: !50)
!60 = !DILocation(line: 363, column: 16, scope: !50)
!61 = !DILocation(line: 363, column: 10, scope: !50)
!62 = !DILocation(line: 363, column: 3, scope: !50)
!63 = distinct !DISubprogram(name: ".omp_outlined._debug__", scope: !1, file: !1, line: 62, type: !64, scopeLine: 62, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !71)
!64 = !DISubroutineType(types: !65)
!65 = !{null, !66, !66, !70, !70}
!66 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !67)
!67 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !68)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!70 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !4, size: 64)
!71 = !{!72, !73, !74, !75, !76, !77, !77, !78, !79, !80, !81, !82, !78, !78}
!72 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !63, type: !66, flags: DIFlagArtificial)
!73 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !63, type: !66, flags: DIFlagArtificial)
!74 = !DILocalVariable(name: "len", arg: 3, scope: !63, file: !1, line: 57, type: !70)
!75 = !DILocalVariable(name: "x", arg: 4, scope: !63, file: !1, line: 56, type: !70)
!76 = !DILocalVariable(name: ".omp.iv", scope: !63, type: !4, flags: DIFlagArtificial)
!77 = !DILocalVariable(name: ".capture_expr.", scope: !63, type: !4, flags: DIFlagArtificial)
!78 = !DILocalVariable(name: "i", scope: !63, type: !4, flags: DIFlagArtificial)
!79 = !DILocalVariable(name: ".omp.lb", scope: !63, type: !4, flags: DIFlagArtificial)
!80 = !DILocalVariable(name: ".omp.ub", scope: !63, type: !4, flags: DIFlagArtificial)
!81 = !DILocalVariable(name: ".omp.stride", scope: !63, type: !4, flags: DIFlagArtificial)
!82 = !DILocalVariable(name: ".omp.is_last", scope: !63, type: !4, flags: DIFlagArtificial)
!83 = !DILocation(line: 0, scope: !63)
!84 = !DILocation(line: 57, column: 7, scope: !63)
!85 = !DILocation(line: 56, column: 9, scope: !63)
!86 = !DILocation(line: 62, column: 3, scope: !63)
!87 = !DILocation(line: 62, column: 14, scope: !63)
!88 = !DILocation(line: 62, column: 18, scope: !63)
!89 = !DILocation(line: 62, column: 8, scope: !63)
!90 = !DILocation(line: 63, column: 7, scope: !63)
!91 = !DILocation(line: 63, column: 6, scope: !63)
!92 = !DILocation(line: 63, column: 5, scope: !63)
!93 = !DILocation(line: 61, column: 1, scope: !63)
!94 = distinct !{!94, !93, !95}
!95 = !DILocation(line: 61, column: 38, scope: !63)
!96 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 62, type: !64, scopeLine: 62, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !97)
!97 = !{!98, !99, !100, !101}
!98 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !96, type: !66, flags: DIFlagArtificial)
!99 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !96, type: !66, flags: DIFlagArtificial)
!100 = !DILocalVariable(name: "len", arg: 3, scope: !96, type: !70, flags: DIFlagArtificial)
!101 = !DILocalVariable(name: "x", arg: 4, scope: !96, type: !70, flags: DIFlagArtificial)
!102 = !DILocation(line: 0, scope: !96)
!103 = !DILocation(line: 62, column: 3, scope: !96)
!104 = !{!105}
!105 = !{i64 2, i64 -1, i64 -1, i1 true}