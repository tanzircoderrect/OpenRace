; ModuleID = 'integration/openmp/multiple-sections-no.c'
source_filename = "integration/openmp/multiple-sections-no.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr global %struct.ident_t { i32 0, i32 1026, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [54 x i8] c";integration/openmp/multiple-sections-no.c;main;8;1;;\00", align 1
@2 = private unnamed_addr constant [55 x i8] c";integration/openmp/multiple-sections-no.c;main;8;30;;\00", align 1
@3 = private unnamed_addr global %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@4 = private unnamed_addr constant [55 x i8] c";integration/openmp/multiple-sections-no.c;main;16;1;;\00", align 1
@5 = private unnamed_addr constant [56 x i8] c";integration/openmp/multiple-sections-no.c;main;16;30;;\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"x=%d, y=%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %.kmpc_loc.addr = alloca %struct.ident_t, align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %struct.ident_t* @3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 24, i1 false)
  store i32 0, i32* %retval, align 4
  %2 = bitcast i32* %x to i8*, !dbg !14
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %2) #5, !dbg !14
  call void @llvm.dbg.declare(metadata i32* %x, metadata !12, metadata !DIExpression()), !dbg !15
  store i32 0, i32* %x, align 4, !dbg !15, !tbaa !16
  %3 = bitcast i32* %y to i8*, !dbg !20
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %3) #5, !dbg !20
  call void @llvm.dbg.declare(metadata i32* %y, metadata !13, metadata !DIExpression()), !dbg !21
  store i32 0, i32* %y, align 4, !dbg !21, !tbaa !16
  %4 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !22
  store i8* getelementptr inbounds ([54 x i8], [54 x i8]* @1, i32 0, i32 0), i8** %4, align 8, !dbg !22, !tbaa !23
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* %.kmpc_loc.addr, i32 2, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %x, i32* %y), !dbg !22
  %5 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !26
  store i8* getelementptr inbounds ([55 x i8], [55 x i8]* @4, i32 0, i32 0), i8** %5, align 8, !dbg !26, !tbaa !23
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* %.kmpc_loc.addr, i32 2, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*)* @.omp_outlined..2 to void (i32*, i32*, ...)*), i32* %x, i32* %y), !dbg !26
  %6 = load i32, i32* %x, align 4, !dbg !27, !tbaa !16
  %7 = load i32, i32* %y, align 4, !dbg !28, !tbaa !16
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), i32 %6, i32 %7), !dbg !29
  %8 = bitcast i32* %y to i8*, !dbg !30
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %8) #5, !dbg !30
  %9 = bitcast i32* %x to i8*, !dbg !30
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #5, !dbg !30
  ret i32 0, !dbg !31
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: norecurse nounwind uwtable
define internal void @.omp_outlined._debug__(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %x, i32* dereferenceable(4) %y) #3 !dbg !32 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %x.addr = alloca i32*, align 8
  %y.addr = alloca i32*, align 8
  %.omp.sections.lb. = alloca i32, align 4
  %.omp.sections.ub. = alloca i32, align 4
  %.omp.sections.st. = alloca i32, align 4
  %.omp.sections.il. = alloca i32, align 4
  %.omp.sections.iv. = alloca i32, align 4
  %.kmpc_loc.addr = alloca %struct.ident_t, align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %struct.ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 24, i1 false)
  store i32* %.global_tid., i32** %.global_tid..addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !41, metadata !DIExpression()), !dbg !46
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !42, metadata !DIExpression()), !dbg !46
  store i32* %x, i32** %x.addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !43, metadata !DIExpression()), !dbg !47
  store i32* %y, i32** %y.addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %y.addr, metadata !44, metadata !DIExpression()), !dbg !48
  %2 = load i32*, i32** %x.addr, align 8, !dbg !49, !tbaa !45
  %3 = load i32*, i32** %y.addr, align 8, !dbg !49, !tbaa !45
  store i32 0, i32* %.omp.sections.lb., align 4, !dbg !49, !tbaa !16
  store i32 1, i32* %.omp.sections.ub., align 4, !dbg !49, !tbaa !16
  store i32 1, i32* %.omp.sections.st., align 4, !dbg !49, !tbaa !16
  store i32 0, i32* %.omp.sections.il., align 4, !dbg !49, !tbaa !16
  %4 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !49
  store i8* getelementptr inbounds ([54 x i8], [54 x i8]* @1, i32 0, i32 0), i8** %4, align 8, !dbg !49, !tbaa !23
  %5 = load i32*, i32** %.global_tid..addr, align 8, !dbg !49
  %6 = load i32, i32* %5, align 4, !dbg !49, !tbaa !16
  call void @__kmpc_for_static_init_4(%struct.ident_t* %.kmpc_loc.addr, i32 %6, i32 34, i32* %.omp.sections.il., i32* %.omp.sections.lb., i32* %.omp.sections.ub., i32* %.omp.sections.st., i32 1, i32 1), !dbg !49
  %7 = load i32, i32* %.omp.sections.ub., align 4, !dbg !49, !tbaa !16
  %8 = icmp slt i32 %7, 1, !dbg !49
  %9 = select i1 %8, i32 %7, i32 1, !dbg !49
  store i32 %9, i32* %.omp.sections.ub., align 4, !dbg !49, !tbaa !16
  %10 = load i32, i32* %.omp.sections.lb., align 4, !dbg !49, !tbaa !16
  store i32 %10, i32* %.omp.sections.iv., align 4, !dbg !49, !tbaa !16
  br label %omp.inner.for.cond, !dbg !49

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %entry
  %11 = load i32, i32* %.omp.sections.iv., align 4, !dbg !50, !tbaa !16
  %12 = load i32, i32* %.omp.sections.ub., align 4, !dbg !50, !tbaa !16
  %cmp = icmp sle i32 %11, %12, !dbg !50
  br i1 %cmp, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !49

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %13 = load i32, i32* %.omp.sections.iv., align 4, !dbg !49, !tbaa !16
  switch i32 %13, label %.omp.sections.exit [
    i32 0, label %.omp.sections.case
    i32 1, label %.omp.sections.case1
  ], !dbg !49

.omp.sections.case:                               ; preds = %omp.inner.for.body
  store i32 1, i32* %2, align 4, !dbg !51, !tbaa !16
  br label %.omp.sections.exit, !dbg !53

.omp.sections.case1:                              ; preds = %omp.inner.for.body
  store i32 2, i32* %3, align 4, !dbg !54, !tbaa !16
  br label %.omp.sections.exit, !dbg !56

.omp.sections.exit:                               ; preds = %.omp.sections.case1, %.omp.sections.case, %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !56

omp.inner.for.inc:                                ; preds = %.omp.sections.exit
  %14 = load i32, i32* %.omp.sections.iv., align 4, !dbg !50, !tbaa !16
  %inc = add nsw i32 %14, 1, !dbg !50
  store i32 %inc, i32* %.omp.sections.iv., align 4, !dbg !50, !tbaa !16
  br label %omp.inner.for.cond, !dbg !56, !llvm.loop !57

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  %15 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !56
  store i8* getelementptr inbounds ([55 x i8], [55 x i8]* @2, i32 0, i32 0), i8** %15, align 8, !dbg !56, !tbaa !23
  call void @__kmpc_for_static_fini(%struct.ident_t* %.kmpc_loc.addr, i32 %6), !dbg !56
  ret void, !dbg !59
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare dso_local void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare dso_local void @__kmpc_for_static_fini(%struct.ident_t*, i32)

; Function Attrs: norecurse nounwind uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %x, i32* dereferenceable(4) %y) #3 !dbg !60 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %x.addr = alloca i32*, align 8
  %y.addr = alloca i32*, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !62, metadata !DIExpression()), !dbg !66
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !63, metadata !DIExpression()), !dbg !66
  store i32* %x, i32** %x.addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !64, metadata !DIExpression()), !dbg !66
  store i32* %y, i32** %y.addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %y.addr, metadata !65, metadata !DIExpression()), !dbg !66
  %0 = load i32*, i32** %x.addr, align 8, !dbg !67, !tbaa !45
  %1 = load i32*, i32** %y.addr, align 8, !dbg !67, !tbaa !45
  %2 = load i32*, i32** %.global_tid..addr, align 8, !dbg !67, !tbaa !45
  %3 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !67, !tbaa !45
  %4 = load i32*, i32** %x.addr, align 8, !dbg !67, !tbaa !45
  %5 = load i32*, i32** %y.addr, align 8, !dbg !67, !tbaa !45
  call void @.omp_outlined._debug__(i32* %2, i32* %3, i32* %4, i32* %5) #5, !dbg !67
  ret void, !dbg !67
}

declare !callback !68 dso_local void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...)

; Function Attrs: norecurse nounwind uwtable
define internal void @.omp_outlined._debug__.1(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %x, i32* dereferenceable(4) %y) #3 !dbg !70 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %x.addr = alloca i32*, align 8
  %y.addr = alloca i32*, align 8
  %.omp.sections.lb. = alloca i32, align 4
  %.omp.sections.ub. = alloca i32, align 4
  %.omp.sections.st. = alloca i32, align 4
  %.omp.sections.il. = alloca i32, align 4
  %.omp.sections.iv. = alloca i32, align 4
  %.kmpc_loc.addr = alloca %struct.ident_t, align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %struct.ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 24, i1 false)
  store i32* %.global_tid., i32** %.global_tid..addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !72, metadata !DIExpression()), !dbg !76
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !73, metadata !DIExpression()), !dbg !76
  store i32* %x, i32** %x.addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !74, metadata !DIExpression()), !dbg !77
  store i32* %y, i32** %y.addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %y.addr, metadata !75, metadata !DIExpression()), !dbg !78
  %2 = load i32*, i32** %x.addr, align 8, !dbg !79, !tbaa !45
  %3 = load i32*, i32** %y.addr, align 8, !dbg !79, !tbaa !45
  store i32 0, i32* %.omp.sections.lb., align 4, !dbg !79, !tbaa !16
  store i32 1, i32* %.omp.sections.ub., align 4, !dbg !79, !tbaa !16
  store i32 1, i32* %.omp.sections.st., align 4, !dbg !79, !tbaa !16
  store i32 0, i32* %.omp.sections.il., align 4, !dbg !79, !tbaa !16
  %4 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !79
  store i8* getelementptr inbounds ([55 x i8], [55 x i8]* @4, i32 0, i32 0), i8** %4, align 8, !dbg !79, !tbaa !23
  %5 = load i32*, i32** %.global_tid..addr, align 8, !dbg !79
  %6 = load i32, i32* %5, align 4, !dbg !79, !tbaa !16
  call void @__kmpc_for_static_init_4(%struct.ident_t* %.kmpc_loc.addr, i32 %6, i32 34, i32* %.omp.sections.il., i32* %.omp.sections.lb., i32* %.omp.sections.ub., i32* %.omp.sections.st., i32 1, i32 1), !dbg !79
  %7 = load i32, i32* %.omp.sections.ub., align 4, !dbg !79, !tbaa !16
  %8 = icmp slt i32 %7, 1, !dbg !79
  %9 = select i1 %8, i32 %7, i32 1, !dbg !79
  store i32 %9, i32* %.omp.sections.ub., align 4, !dbg !79, !tbaa !16
  %10 = load i32, i32* %.omp.sections.lb., align 4, !dbg !79, !tbaa !16
  store i32 %10, i32* %.omp.sections.iv., align 4, !dbg !79, !tbaa !16
  br label %omp.inner.for.cond, !dbg !79

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %entry
  %11 = load i32, i32* %.omp.sections.iv., align 4, !dbg !80, !tbaa !16
  %12 = load i32, i32* %.omp.sections.ub., align 4, !dbg !80, !tbaa !16
  %cmp = icmp sle i32 %11, %12, !dbg !80
  br i1 %cmp, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !79

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %13 = load i32, i32* %.omp.sections.iv., align 4, !dbg !79, !tbaa !16
  switch i32 %13, label %.omp.sections.exit [
    i32 0, label %.omp.sections.case
    i32 1, label %.omp.sections.case1
  ], !dbg !79

.omp.sections.case:                               ; preds = %omp.inner.for.body
  %14 = load i32, i32* %2, align 4, !dbg !81, !tbaa !16
  %inc = add nsw i32 %14, 1, !dbg !81
  store i32 %inc, i32* %2, align 4, !dbg !81, !tbaa !16
  br label %.omp.sections.exit, !dbg !83

.omp.sections.case1:                              ; preds = %omp.inner.for.body
  %15 = load i32, i32* %3, align 4, !dbg !84, !tbaa !16
  %inc2 = add nsw i32 %15, 1, !dbg !84
  store i32 %inc2, i32* %3, align 4, !dbg !84, !tbaa !16
  br label %.omp.sections.exit, !dbg !86

.omp.sections.exit:                               ; preds = %.omp.sections.case1, %.omp.sections.case, %omp.inner.for.body
  br label %omp.inner.for.inc, !dbg !86

omp.inner.for.inc:                                ; preds = %.omp.sections.exit
  %16 = load i32, i32* %.omp.sections.iv., align 4, !dbg !80, !tbaa !16
  %inc3 = add nsw i32 %16, 1, !dbg !80
  store i32 %inc3, i32* %.omp.sections.iv., align 4, !dbg !80, !tbaa !16
  br label %omp.inner.for.cond, !dbg !86, !llvm.loop !87

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  %17 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !86
  store i8* getelementptr inbounds ([56 x i8], [56 x i8]* @5, i32 0, i32 0), i8** %17, align 8, !dbg !86, !tbaa !23
  call void @__kmpc_for_static_fini(%struct.ident_t* %.kmpc_loc.addr, i32 %6), !dbg !86
  ret void, !dbg !89
}

; Function Attrs: norecurse nounwind uwtable
define internal void @.omp_outlined..2(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %x, i32* dereferenceable(4) %y) #3 !dbg !90 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %x.addr = alloca i32*, align 8
  %y.addr = alloca i32*, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !92, metadata !DIExpression()), !dbg !96
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !93, metadata !DIExpression()), !dbg !96
  store i32* %x, i32** %x.addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %x.addr, metadata !94, metadata !DIExpression()), !dbg !96
  store i32* %y, i32** %y.addr, align 8, !tbaa !45
  call void @llvm.dbg.declare(metadata i32** %y.addr, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = load i32*, i32** %x.addr, align 8, !dbg !97, !tbaa !45
  %1 = load i32*, i32** %y.addr, align 8, !dbg !97, !tbaa !45
  %2 = load i32*, i32** %.global_tid..addr, align 8, !dbg !97, !tbaa !45
  %3 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !97, !tbaa !45
  %4 = load i32*, i32** %x.addr, align 8, !dbg !97, !tbaa !45
  %5 = load i32*, i32** %y.addr, align 8, !dbg !97, !tbaa !45
  call void @.omp_outlined._debug__.1(i32* %2, i32* %3, i32* %4, i32* %5) #5, !dbg !97
  ret void, !dbg !97
}

declare dso_local i32 @printf(i8*, ...) #4

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { nounwind readnone speculatable willreturn }
attributes #3 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "integration/openmp/multiple-sections-no.c", directory: "/home/addisoncrump/git/OpenRace/tests/data")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 "}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 3, type: !8, scopeLine: 4, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !11)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !{!12, !13}
!12 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 5, type: !10)
!13 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 6, type: !10)
!14 = !DILocation(line: 5, column: 3, scope: !7)
!15 = !DILocation(line: 5, column: 7, scope: !7)
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C/C++ TBAA"}
!20 = !DILocation(line: 6, column: 3, scope: !7)
!21 = !DILocation(line: 6, column: 7, scope: !7)
!22 = !DILocation(line: 8, column: 1, scope: !7)
!23 = !{!24, !25, i64 16}
!24 = !{!"ident_t", !17, i64 0, !17, i64 4, !17, i64 8, !17, i64 12, !25, i64 16}
!25 = !{!"any pointer", !18, i64 0}
!26 = !DILocation(line: 16, column: 1, scope: !7)
!27 = !DILocation(line: 24, column: 26, scope: !7)
!28 = !DILocation(line: 24, column: 29, scope: !7)
!29 = !DILocation(line: 24, column: 3, scope: !7)
!30 = !DILocation(line: 26, column: 1, scope: !7)
!31 = !DILocation(line: 25, column: 3, scope: !7)
!32 = distinct !DISubprogram(name: ".omp_outlined._debug__", scope: !1, file: !1, line: 9, type: !33, scopeLine: 9, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !40)
!33 = !DISubroutineType(types: !34)
!34 = !{null, !35, !35, !39, !39}
!35 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !36)
!36 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !37)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!39 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !10, size: 64)
!40 = !{!41, !42, !43, !44}
!41 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !32, type: !35, flags: DIFlagArtificial)
!42 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !32, type: !35, flags: DIFlagArtificial)
!43 = !DILocalVariable(name: "x", arg: 3, scope: !32, file: !1, line: 5, type: !39)
!44 = !DILocalVariable(name: "y", arg: 4, scope: !32, file: !1, line: 6, type: !39)
!45 = !{!25, !25, i64 0}
!46 = !DILocation(line: 0, scope: !32)
!47 = !DILocation(line: 5, column: 7, scope: !32)
!48 = !DILocation(line: 6, column: 7, scope: !32)
!49 = !DILocation(line: 9, column: 3, scope: !32)
!50 = !DILocation(line: 8, column: 1, scope: !32)
!51 = !DILocation(line: 11, column: 7, scope: !52)
!52 = distinct !DILexicalBlock(scope: !32, file: !1, line: 10, column: 1)
!53 = !DILocation(line: 10, column: 20, scope: !52)
!54 = !DILocation(line: 13, column: 7, scope: !55)
!55 = distinct !DILexicalBlock(scope: !32, file: !1, line: 12, column: 1)
!56 = !DILocation(line: 12, column: 20, scope: !55)
!57 = distinct !{!57, !50, !58}
!58 = !DILocation(line: 8, column: 30, scope: !32)
!59 = !DILocation(line: 14, column: 3, scope: !32)
!60 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 9, type: !33, scopeLine: 9, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !61)
!61 = !{!62, !63, !64, !65}
!62 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !60, type: !35, flags: DIFlagArtificial)
!63 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !60, type: !35, flags: DIFlagArtificial)
!64 = !DILocalVariable(name: "x", arg: 3, scope: !60, type: !39, flags: DIFlagArtificial)
!65 = !DILocalVariable(name: "y", arg: 4, scope: !60, type: !39, flags: DIFlagArtificial)
!66 = !DILocation(line: 0, scope: !60)
!67 = !DILocation(line: 9, column: 3, scope: !60)
!68 = !{!69}
!69 = !{i64 2, i64 -1, i64 -1, i1 true}
!70 = distinct !DISubprogram(name: ".omp_outlined._debug__.1", scope: !1, file: !1, line: 17, type: !33, scopeLine: 17, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !71)
!71 = !{!72, !73, !74, !75}
!72 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !70, type: !35, flags: DIFlagArtificial)
!73 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !70, type: !35, flags: DIFlagArtificial)
!74 = !DILocalVariable(name: "x", arg: 3, scope: !70, file: !1, line: 5, type: !39)
!75 = !DILocalVariable(name: "y", arg: 4, scope: !70, file: !1, line: 6, type: !39)
!76 = !DILocation(line: 0, scope: !70)
!77 = !DILocation(line: 5, column: 7, scope: !70)
!78 = !DILocation(line: 6, column: 7, scope: !70)
!79 = !DILocation(line: 17, column: 3, scope: !70)
!80 = !DILocation(line: 16, column: 1, scope: !70)
!81 = !DILocation(line: 19, column: 6, scope: !82)
!82 = distinct !DILexicalBlock(scope: !70, file: !1, line: 18, column: 1)
!83 = !DILocation(line: 18, column: 20, scope: !82)
!84 = !DILocation(line: 21, column: 6, scope: !85)
!85 = distinct !DILexicalBlock(scope: !70, file: !1, line: 20, column: 1)
!86 = !DILocation(line: 20, column: 20, scope: !85)
!87 = distinct !{!87, !80, !88}
!88 = !DILocation(line: 16, column: 30, scope: !70)
!89 = !DILocation(line: 22, column: 3, scope: !70)
!90 = distinct !DISubprogram(name: ".omp_outlined..2", scope: !1, file: !1, line: 17, type: !33, scopeLine: 17, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !91)
!91 = !{!92, !93, !94, !95}
!92 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !90, type: !35, flags: DIFlagArtificial)
!93 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !90, type: !35, flags: DIFlagArtificial)
!94 = !DILocalVariable(name: "x", arg: 3, scope: !90, type: !39, flags: DIFlagArtificial)
!95 = !DILocalVariable(name: "y", arg: 4, scope: !90, type: !39, flags: DIFlagArtificial)
!96 = !DILocation(line: 0, scope: !90)
!97 = !DILocation(line: 17, column: 3, scope: !90)
