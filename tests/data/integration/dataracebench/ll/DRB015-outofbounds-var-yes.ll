; ModuleID = 'DRB015-outofbounds-var-yes.c'
source_filename = "DRB015-outofbounds-var-yes.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }

@.str = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@0 = private unnamed_addr global %struct.ident_t { i32 0, i32 514, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8
@1 = private unnamed_addr constant [42 x i8] c";DRB015-outofbounds-var-yes.c;main;77;1;;\00", align 1
@2 = private unnamed_addr constant [43 x i8] c";DRB015-outofbounds-var-yes.c;main;77;36;;\00", align 1
@3 = private unnamed_addr global %struct.ident_t { i32 0, i32 2, i32 0, i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0) }, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %len = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %saved_stack = alloca i8*, align 8
  %__vla_expr0 = alloca i64, align 8
  %__vla_expr1 = alloca i64, align 8
  %.kmpc_loc.addr = alloca %struct.ident_t, align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %struct.ident_t* @3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 24, i1 false)
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !14, metadata !DIExpression()), !dbg !15
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !16, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i32* %i, metadata !18, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %j, metadata !20, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %len, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 100, i32* %len, align 4, !dbg !23
  %2 = load i32, i32* %argc.addr, align 4, !dbg !24
  %cmp = icmp sgt i32 %2, 1, !dbg !26
  br i1 %cmp, label %if.then, label %if.end, !dbg !27

if.then:                                          ; preds = %entry
  %3 = load i8**, i8*** %argv.addr, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8*, i8** %3, i64 1, !dbg !28
  %4 = load i8*, i8** %arrayidx, align 8, !dbg !28
  %call = call i32 @atoi(i8* %4) #6, !dbg !29
  store i32 %call, i32* %len, align 4, !dbg !30
  br label %if.end, !dbg !31

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i32* %n, metadata !32, metadata !DIExpression()), !dbg !33
  %5 = load i32, i32* %len, align 4, !dbg !34
  store i32 %5, i32* %n, align 4, !dbg !33
  call void @llvm.dbg.declare(metadata i32* %m, metadata !35, metadata !DIExpression()), !dbg !36
  %6 = load i32, i32* %len, align 4, !dbg !37
  store i32 %6, i32* %m, align 4, !dbg !36
  %7 = load i32, i32* %n, align 4, !dbg !38
  %8 = zext i32 %7 to i64, !dbg !39
  %9 = load i32, i32* %m, align 4, !dbg !40
  %10 = zext i32 %9 to i64, !dbg !39
  %11 = call i8* @llvm.stacksave(), !dbg !39
  store i8* %11, i8** %saved_stack, align 8, !dbg !39
  %12 = mul nuw i64 %8, %10, !dbg !39
  %vla = alloca double, i64 %12, align 16, !dbg !39
  store i64 %8, i64* %__vla_expr0, align 8, !dbg !39
  store i64 %10, i64* %__vla_expr1, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i64* %__vla_expr0, metadata !41, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata i64* %__vla_expr1, metadata !44, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata double* %vla, metadata !45, metadata !DIExpression()), !dbg !51
  %13 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !52
  store i8* getelementptr inbounds ([42 x i8], [42 x i8]* @1, i32 0, i32 0), i8** %13, align 8, !dbg !52
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* %.kmpc_loc.addr, i32 5, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, i32*, i32*, i64, i64, double*)* @.omp_outlined. to void (i32*, i32*, ...)*), i32* %n, i32* %m, i64 %8, i64 %10, double* %vla), !dbg !52
  store i32 0, i32* %retval, align 4, !dbg !53
  %14 = load i8*, i8** %saved_stack, align 8, !dbg !54
  call void @llvm.stackrestore(i8* %14), !dbg !54
  %15 = load i32, i32* %retval, align 4, !dbg !54
  ret i32 %15, !dbg !54
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i32 @atoi(i8*) #2

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #3

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined._debug__(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %n, i32* dereferenceable(4) %m, i64 %vla, i64 %vla1, double* dereferenceable(8) %b) #4 !dbg !55 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %n.addr = alloca i32*, align 8
  %m.addr = alloca i32*, align 8
  %vla.addr = alloca i64, align 8
  %vla.addr2 = alloca i64, align 8
  %b.addr = alloca double*, align 8
  %.omp.iv = alloca i32, align 4
  %tmp = alloca i32, align 4
  %.capture_expr. = alloca i32, align 4
  %.capture_expr.3 = alloca i32, align 4
  %i = alloca i32, align 4
  %.omp.lb = alloca i32, align 4
  %.omp.ub = alloca i32, align 4
  %.omp.stride = alloca i32, align 4
  %.omp.is_last = alloca i32, align 4
  %j = alloca i32, align 4
  %i6 = alloca i32, align 4
  %.kmpc_loc.addr = alloca %struct.ident_t, align 8
  %0 = bitcast %struct.ident_t* %.kmpc_loc.addr to i8*
  %1 = bitcast %struct.ident_t* @0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %0, i8* align 8 %1, i64 24, i1 false)
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !64, metadata !DIExpression()), !dbg !65
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !66, metadata !DIExpression()), !dbg !65
  store i32* %n, i32** %n.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %n.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i32* %m, i32** %m.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %m.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i64 %vla, i64* %vla.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %vla.addr, metadata !71, metadata !DIExpression()), !dbg !65
  store i64 %vla1, i64* %vla.addr2, align 8
  call void @llvm.dbg.declare(metadata i64* %vla.addr2, metadata !72, metadata !DIExpression()), !dbg !65
  store double* %b, double** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double** %b.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %2 = load i32*, i32** %n.addr, align 8, !dbg !75
  %3 = load i32*, i32** %m.addr, align 8, !dbg !75
  %4 = load i64, i64* %vla.addr, align 8, !dbg !75
  %5 = load i64, i64* %vla.addr2, align 8, !dbg !75
  %6 = load double*, double** %b.addr, align 8, !dbg !75
  call void @llvm.dbg.declare(metadata i32* %.omp.iv, metadata !76, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %.capture_expr., metadata !77, metadata !DIExpression()), !dbg !65
  %7 = load i32, i32* %2, align 4, !dbg !78
  store i32 %7, i32* %.capture_expr., align 4, !dbg !78
  call void @llvm.dbg.declare(metadata i32* %.capture_expr.3, metadata !77, metadata !DIExpression()), !dbg !65
  %8 = load i32, i32* %.capture_expr., align 4, !dbg !78
  %sub = sub nsw i32 %8, 1, !dbg !75
  %sub4 = sub nsw i32 %sub, 1, !dbg !75
  %add = add nsw i32 %sub4, 1, !dbg !75
  %div = sdiv i32 %add, 1, !dbg !75
  %sub5 = sub nsw i32 %div, 1, !dbg !75
  store i32 %sub5, i32* %.capture_expr.3, align 4, !dbg !75
  call void @llvm.dbg.declare(metadata i32* %i, metadata !79, metadata !DIExpression()), !dbg !65
  store i32 1, i32* %i, align 4, !dbg !80
  %9 = load i32, i32* %.capture_expr., align 4, !dbg !78
  %cmp = icmp slt i32 1, %9, !dbg !75
  br i1 %cmp, label %omp.precond.then, label %omp.precond.end, !dbg !75

omp.precond.then:                                 ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %.omp.lb, metadata !81, metadata !DIExpression()), !dbg !65
  store i32 0, i32* %.omp.lb, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %.omp.ub, metadata !83, metadata !DIExpression()), !dbg !65
  %10 = load i32, i32* %.capture_expr.3, align 4, !dbg !75
  store i32 %10, i32* %.omp.ub, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %.omp.stride, metadata !84, metadata !DIExpression()), !dbg !65
  store i32 1, i32* %.omp.stride, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %.omp.is_last, metadata !85, metadata !DIExpression()), !dbg !65
  store i32 0, i32* %.omp.is_last, align 4, !dbg !82
  call void @llvm.dbg.declare(metadata i32* %j, metadata !86, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %i6, metadata !79, metadata !DIExpression()), !dbg !65
  %11 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !75
  store i8* getelementptr inbounds ([42 x i8], [42 x i8]* @1, i32 0, i32 0), i8** %11, align 8, !dbg !75
  %12 = load i32*, i32** %.global_tid..addr, align 8, !dbg !75
  %13 = load i32, i32* %12, align 4, !dbg !75
  call void @__kmpc_for_static_init_4(%struct.ident_t* %.kmpc_loc.addr, i32 %13, i32 34, i32* %.omp.is_last, i32* %.omp.lb, i32* %.omp.ub, i32* %.omp.stride, i32 1, i32 1), !dbg !75
  %14 = load i32, i32* %.omp.ub, align 4, !dbg !82
  %15 = load i32, i32* %.capture_expr.3, align 4, !dbg !75
  %cmp7 = icmp sgt i32 %14, %15, !dbg !82
  br i1 %cmp7, label %cond.true, label %cond.false, !dbg !82

cond.true:                                        ; preds = %omp.precond.then
  %16 = load i32, i32* %.capture_expr.3, align 4, !dbg !75
  br label %cond.end, !dbg !82

cond.false:                                       ; preds = %omp.precond.then
  %17 = load i32, i32* %.omp.ub, align 4, !dbg !82
  br label %cond.end, !dbg !82

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %16, %cond.true ], [ %17, %cond.false ], !dbg !82
  store i32 %cond, i32* %.omp.ub, align 4, !dbg !82
  %18 = load i32, i32* %.omp.lb, align 4, !dbg !82
  store i32 %18, i32* %.omp.iv, align 4, !dbg !82
  br label %omp.inner.for.cond, !dbg !75

omp.inner.for.cond:                               ; preds = %omp.inner.for.inc, %cond.end
  %19 = load i32, i32* %.omp.iv, align 4, !dbg !82
  %20 = load i32, i32* %.omp.ub, align 4, !dbg !82
  %cmp8 = icmp sle i32 %19, %20, !dbg !75
  br i1 %cmp8, label %omp.inner.for.body, label %omp.inner.for.end, !dbg !75

omp.inner.for.body:                               ; preds = %omp.inner.for.cond
  %21 = load i32, i32* %.omp.iv, align 4, !dbg !82
  %mul = mul nsw i32 %21, 1, !dbg !80
  %add9 = add nsw i32 1, %mul, !dbg !80
  store i32 %add9, i32* %i6, align 4, !dbg !80
  store i32 0, i32* %j, align 4, !dbg !87
  br label %for.cond, !dbg !89

for.cond:                                         ; preds = %for.inc, %omp.inner.for.body
  %22 = load i32, i32* %j, align 4, !dbg !90
  %23 = load i32, i32* %3, align 4, !dbg !92
  %cmp10 = icmp slt i32 %22, %23, !dbg !93
  br i1 %cmp10, label %for.body, label %for.end, !dbg !94

for.body:                                         ; preds = %for.cond
  %24 = load i32, i32* %i6, align 4, !dbg !95
  %idxprom = sext i32 %24 to i64, !dbg !96
  %25 = mul nsw i64 %idxprom, %5, !dbg !96
  %arrayidx = getelementptr inbounds double, double* %6, i64 %25, !dbg !96
  %26 = load i32, i32* %j, align 4, !dbg !97
  %sub11 = sub nsw i32 %26, 1, !dbg !98
  %idxprom12 = sext i32 %sub11 to i64, !dbg !96
  %arrayidx13 = getelementptr inbounds double, double* %arrayidx, i64 %idxprom12, !dbg !96
  %27 = load double, double* %arrayidx13, align 8, !dbg !96
  %28 = load i32, i32* %i6, align 4, !dbg !99
  %idxprom14 = sext i32 %28 to i64, !dbg !100
  %29 = mul nsw i64 %idxprom14, %5, !dbg !100
  %arrayidx15 = getelementptr inbounds double, double* %6, i64 %29, !dbg !100
  %30 = load i32, i32* %j, align 4, !dbg !101
  %idxprom16 = sext i32 %30 to i64, !dbg !100
  %arrayidx17 = getelementptr inbounds double, double* %arrayidx15, i64 %idxprom16, !dbg !100
  store double %27, double* %arrayidx17, align 8, !dbg !102
  br label %for.inc, !dbg !100

for.inc:                                          ; preds = %for.body
  %31 = load i32, i32* %j, align 4, !dbg !103
  %inc = add nsw i32 %31, 1, !dbg !103
  store i32 %inc, i32* %j, align 4, !dbg !103
  br label %for.cond, !dbg !104, !llvm.loop !105

for.end:                                          ; preds = %for.cond
  br label %omp.body.continue, !dbg !106

omp.body.continue:                                ; preds = %for.end
  br label %omp.inner.for.inc, !dbg !107

omp.inner.for.inc:                                ; preds = %omp.body.continue
  %32 = load i32, i32* %.omp.iv, align 4, !dbg !82
  %add18 = add nsw i32 %32, 1, !dbg !75
  store i32 %add18, i32* %.omp.iv, align 4, !dbg !75
  br label %omp.inner.for.cond, !dbg !107, !llvm.loop !108

omp.inner.for.end:                                ; preds = %omp.inner.for.cond
  br label %omp.loop.exit, !dbg !107

omp.loop.exit:                                    ; preds = %omp.inner.for.end
  %33 = getelementptr inbounds %struct.ident_t, %struct.ident_t* %.kmpc_loc.addr, i32 0, i32 4, !dbg !107
  store i8* getelementptr inbounds ([43 x i8], [43 x i8]* @2, i32 0, i32 0), i8** %33, align 8, !dbg !107
  %34 = load i32*, i32** %.global_tid..addr, align 8, !dbg !107
  %35 = load i32, i32* %34, align 4, !dbg !107
  call void @__kmpc_for_static_fini(%struct.ident_t* %.kmpc_loc.addr, i32 %35), !dbg !107
  br label %omp.precond.end, !dbg !107

omp.precond.end:                                  ; preds = %omp.loop.exit, %entry
  ret void, !dbg !110
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

declare dso_local void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

declare dso_local void @__kmpc_for_static_fini(%struct.ident_t*, i32)

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias %.global_tid., i32* noalias %.bound_tid., i32* dereferenceable(4) %n, i32* dereferenceable(4) %m, i64 %vla, i64 %vla1, double* dereferenceable(8) %b) #4 !dbg !111 {
entry:
  %.global_tid..addr = alloca i32*, align 8
  %.bound_tid..addr = alloca i32*, align 8
  %n.addr = alloca i32*, align 8
  %m.addr = alloca i32*, align 8
  %vla.addr = alloca i64, align 8
  %vla.addr2 = alloca i64, align 8
  %b.addr = alloca double*, align 8
  store i32* %.global_tid., i32** %.global_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.global_tid..addr, metadata !112, metadata !DIExpression()), !dbg !113
  store i32* %.bound_tid., i32** %.bound_tid..addr, align 8
  call void @llvm.dbg.declare(metadata i32** %.bound_tid..addr, metadata !114, metadata !DIExpression()), !dbg !113
  store i32* %n, i32** %n.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %n.addr, metadata !115, metadata !DIExpression()), !dbg !113
  store i32* %m, i32** %m.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %m.addr, metadata !116, metadata !DIExpression()), !dbg !113
  store i64 %vla, i64* %vla.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %vla.addr, metadata !117, metadata !DIExpression()), !dbg !113
  store i64 %vla1, i64* %vla.addr2, align 8
  call void @llvm.dbg.declare(metadata i64* %vla.addr2, metadata !118, metadata !DIExpression()), !dbg !113
  store double* %b, double** %b.addr, align 8
  call void @llvm.dbg.declare(metadata double** %b.addr, metadata !119, metadata !DIExpression()), !dbg !113
  %0 = load i32*, i32** %n.addr, align 8, !dbg !120
  %1 = load i32*, i32** %m.addr, align 8, !dbg !120
  %2 = load i64, i64* %vla.addr, align 8, !dbg !120
  %3 = load i64, i64* %vla.addr2, align 8, !dbg !120
  %4 = load double*, double** %b.addr, align 8, !dbg !120
  %5 = load i32*, i32** %.global_tid..addr, align 8, !dbg !120
  %6 = load i32*, i32** %.bound_tid..addr, align 8, !dbg !120
  %7 = load i32*, i32** %n.addr, align 8, !dbg !120
  %8 = load i32*, i32** %m.addr, align 8, !dbg !120
  %9 = load double*, double** %b.addr, align 8, !dbg !120
  call void @.omp_outlined._debug__(i32* %5, i32* %6, i32* %7, i32* %8, i64 %2, i64 %3, double* %9) #3, !dbg !120
  ret void, !dbg !120
}

declare !callback !121 dso_local void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...)

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noinline norecurse nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind willreturn }
attributes #6 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 10.0.1 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "DRB015-outofbounds-var-yes.c", directory: "/home/yanze/code/OpenRace/tests/data/integration/dataracebench")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 10.0.1 "}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 68, type: !8, scopeLine: 69, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 68, type: !10)
!15 = !DILocation(line: 68, column: 14, scope: !7)
!16 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 68, type: !11)
!17 = !DILocation(line: 68, column: 26, scope: !7)
!18 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 70, type: !10)
!19 = !DILocation(line: 70, column: 7, scope: !7)
!20 = !DILocalVariable(name: "j", scope: !7, file: !1, line: 70, type: !10)
!21 = !DILocation(line: 70, column: 9, scope: !7)
!22 = !DILocalVariable(name: "len", scope: !7, file: !1, line: 71, type: !10)
!23 = !DILocation(line: 71, column: 7, scope: !7)
!24 = !DILocation(line: 72, column: 7, scope: !25)
!25 = distinct !DILexicalBlock(scope: !7, file: !1, line: 72, column: 7)
!26 = !DILocation(line: 72, column: 11, scope: !25)
!27 = !DILocation(line: 72, column: 7, scope: !7)
!28 = !DILocation(line: 73, column: 16, scope: !25)
!29 = !DILocation(line: 73, column: 11, scope: !25)
!30 = !DILocation(line: 73, column: 9, scope: !25)
!31 = !DILocation(line: 73, column: 5, scope: !25)
!32 = !DILocalVariable(name: "n", scope: !7, file: !1, line: 75, type: !10)
!33 = !DILocation(line: 75, column: 7, scope: !7)
!34 = !DILocation(line: 75, column: 9, scope: !7)
!35 = !DILocalVariable(name: "m", scope: !7, file: !1, line: 75, type: !10)
!36 = !DILocation(line: 75, column: 14, scope: !7)
!37 = !DILocation(line: 75, column: 16, scope: !7)
!38 = !DILocation(line: 76, column: 12, scope: !7)
!39 = !DILocation(line: 76, column: 3, scope: !7)
!40 = !DILocation(line: 76, column: 15, scope: !7)
!41 = !DILocalVariable(name: "__vla_expr0", scope: !7, type: !42, flags: DIFlagArtificial)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 0, scope: !7)
!44 = !DILocalVariable(name: "__vla_expr1", scope: !7, type: !42, flags: DIFlagArtificial)
!45 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 76, type: !46)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !47, elements: !48)
!47 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!48 = !{!49, !50}
!49 = !DISubrange(count: !41)
!50 = !DISubrange(count: !44)
!51 = !DILocation(line: 76, column: 10, scope: !7)
!52 = !DILocation(line: 77, column: 1, scope: !7)
!53 = !DILocation(line: 82, column: 2, scope: !7)
!54 = !DILocation(line: 83, column: 1, scope: !7)
!55 = distinct !DISubprogram(name: ".omp_outlined._debug__", scope: !1, file: !1, line: 78, type: !56, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!56 = !DISubroutineType(types: !57)
!57 = !{null, !58, !58, !62, !62, !42, !42, !63}
!58 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !59)
!59 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !60)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !10)
!62 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !10, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !47, size: 64)
!64 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !55, type: !58, flags: DIFlagArtificial)
!65 = !DILocation(line: 0, scope: !55)
!66 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !55, type: !58, flags: DIFlagArtificial)
!67 = !DILocalVariable(name: "n", arg: 3, scope: !55, file: !1, line: 75, type: !62)
!68 = !DILocation(line: 75, column: 7, scope: !55)
!69 = !DILocalVariable(name: "m", arg: 4, scope: !55, file: !1, line: 75, type: !62)
!70 = !DILocation(line: 75, column: 14, scope: !55)
!71 = !DILocalVariable(name: "vla", arg: 5, scope: !55, type: !42, flags: DIFlagArtificial)
!72 = !DILocalVariable(name: "vla", arg: 6, scope: !55, type: !42, flags: DIFlagArtificial)
!73 = !DILocalVariable(name: "b", arg: 7, scope: !55, file: !1, line: 76, type: !63)
!74 = !DILocation(line: 76, column: 10, scope: !55)
!75 = !DILocation(line: 78, column: 3, scope: !55)
!76 = !DILocalVariable(name: ".omp.iv", scope: !55, type: !10, flags: DIFlagArtificial)
!77 = !DILocalVariable(name: ".capture_expr.", scope: !55, type: !10, flags: DIFlagArtificial)
!78 = !DILocation(line: 78, column: 14, scope: !55)
!79 = !DILocalVariable(name: "i", scope: !55, type: !10, flags: DIFlagArtificial)
!80 = !DILocation(line: 78, column: 16, scope: !55)
!81 = !DILocalVariable(name: ".omp.lb", scope: !55, type: !10, flags: DIFlagArtificial)
!82 = !DILocation(line: 78, column: 8, scope: !55)
!83 = !DILocalVariable(name: ".omp.ub", scope: !55, type: !10, flags: DIFlagArtificial)
!84 = !DILocalVariable(name: ".omp.stride", scope: !55, type: !10, flags: DIFlagArtificial)
!85 = !DILocalVariable(name: ".omp.is_last", scope: !55, type: !10, flags: DIFlagArtificial)
!86 = !DILocalVariable(name: "j", scope: !55, type: !10, flags: DIFlagArtificial)
!87 = !DILocation(line: 79, column: 11, scope: !88)
!88 = distinct !DILexicalBlock(scope: !55, file: !1, line: 79, column: 5)
!89 = !DILocation(line: 79, column: 10, scope: !88)
!90 = !DILocation(line: 79, column: 14, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !1, line: 79, column: 5)
!92 = !DILocation(line: 79, column: 16, scope: !91)
!93 = !DILocation(line: 79, column: 15, scope: !91)
!94 = !DILocation(line: 79, column: 5, scope: !88)
!95 = !DILocation(line: 80, column: 17, scope: !91)
!96 = !DILocation(line: 80, column: 15, scope: !91)
!97 = !DILocation(line: 80, column: 20, scope: !91)
!98 = !DILocation(line: 80, column: 21, scope: !91)
!99 = !DILocation(line: 80, column: 9, scope: !91)
!100 = !DILocation(line: 80, column: 7, scope: !91)
!101 = !DILocation(line: 80, column: 12, scope: !91)
!102 = !DILocation(line: 80, column: 14, scope: !91)
!103 = !DILocation(line: 79, column: 19, scope: !91)
!104 = !DILocation(line: 79, column: 5, scope: !91)
!105 = distinct !{!105, !94, !106}
!106 = !DILocation(line: 80, column: 23, scope: !88)
!107 = !DILocation(line: 77, column: 1, scope: !55)
!108 = distinct !{!108, !107, !109}
!109 = !DILocation(line: 77, column: 36, scope: !55)
!110 = !DILocation(line: 80, column: 23, scope: !55)
!111 = distinct !DISubprogram(name: ".omp_outlined.", scope: !1, file: !1, line: 78, type: !56, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: ".global_tid.", arg: 1, scope: !111, type: !58, flags: DIFlagArtificial)
!113 = !DILocation(line: 0, scope: !111)
!114 = !DILocalVariable(name: ".bound_tid.", arg: 2, scope: !111, type: !58, flags: DIFlagArtificial)
!115 = !DILocalVariable(name: "n", arg: 3, scope: !111, type: !62, flags: DIFlagArtificial)
!116 = !DILocalVariable(name: "m", arg: 4, scope: !111, type: !62, flags: DIFlagArtificial)
!117 = !DILocalVariable(name: "vla", arg: 5, scope: !111, type: !42, flags: DIFlagArtificial)
!118 = !DILocalVariable(name: "vla", arg: 6, scope: !111, type: !42, flags: DIFlagArtificial)
!119 = !DILocalVariable(name: "b", arg: 7, scope: !111, type: !63, flags: DIFlagArtificial)
!120 = !DILocation(line: 78, column: 3, scope: !111)
!121 = !{!122}
!122 = !{i64 2, i64 -1, i64 -1, i1 true}