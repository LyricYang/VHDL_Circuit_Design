; ModuleID = 'C:/Users/YL/Desktop/MatrixMultiply/MatrixMultiply/solution1/.autopilot/db/a.o.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@.str = private unnamed_addr constant [9 x i8] c"COMPLETE\00", align 1 ; [#uses=1 type=[9 x i8]*]
@.str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=1 type=[1 x i8]*]
@.str2 = private unnamed_addr constant [22 x i8] c"MatrixMultiply_label0\00", align 1 ; [#uses=1 type=[22 x i8]*]

; [#uses=0]
define void @MatrixMultiply(i32* %AA, i32* %bb, i32* %cc) nounwind {
  %1 = alloca i32*, align 4                       ; [#uses=4 type=i32**]
  %2 = alloca i32*, align 4                       ; [#uses=4 type=i32**]
  %3 = alloca i32*, align 4                       ; [#uses=4 type=i32**]
  %i = alloca i32, align 4                        ; [#uses=6 type=i32*]
  %j = alloca i32, align 4                        ; [#uses=6 type=i32*]
  %sum = alloca i32, align 4                      ; [#uses=4 type=i32*]
  store i32* %AA, i32** %1, align 4
  call void @llvm.dbg.declare(metadata !{i32** %1}, metadata !21), !dbg !22 ; [debug line = 4:31] [debug variable = AA]
  store i32* %bb, i32** %2, align 4
  call void @llvm.dbg.declare(metadata !{i32** %2}, metadata !23), !dbg !24 ; [debug line = 4:49] [debug variable = bb]
  store i32* %cc, i32** %3, align 4
  call void @llvm.dbg.declare(metadata !{i32** %3}, metadata !25), !dbg !26 ; [debug line = 4:65] [debug variable = cc]
  %4 = load i32** %1, align 4, !dbg !27           ; [#uses=1 type=i32*] [debug line = 5:2]
  call void bitcast (void (...)* @_ssdm_SpecArrayDimSize to void (i32*, i32)*)(i32* %4, i32 25) nounwind, !dbg !27 ; [debug line = 5:2]
  %5 = load i32** %2, align 4, !dbg !29           ; [#uses=1 type=i32*] [debug line = 5:33]
  call void bitcast (void (...)* @_ssdm_SpecArrayDimSize to void (i32*, i32)*)(i32* %5, i32 5) nounwind, !dbg !29 ; [debug line = 5:33]
  %6 = load i32** %3, align 4, !dbg !30           ; [#uses=1 type=i32*] [debug line = 5:62]
  call void bitcast (void (...)* @_ssdm_SpecArrayDimSize to void (i32*, i32)*)(i32* %6, i32 5) nounwind, !dbg !30 ; [debug line = 5:62]
  %7 = load i32** %3, align 4, !dbg !31           ; [#uses=1 type=i32*] [debug line = 6:1]
  call void bitcast (void (...)* @_ssdm_SpecArrayPartition to void (i32*, i32, i8*, i32, i8*)*)(i32* %7, i32 1, i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !31 ; [debug line = 6:1]
  %8 = load i32** %2, align 4, !dbg !31           ; [#uses=1 type=i32*] [debug line = 6:1]
  call void bitcast (void (...)* @_ssdm_SpecArrayPartition to void (i32*, i32, i8*, i32, i8*)*)(i32* %8, i32 1, i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !31 ; [debug line = 6:1]
  %9 = load i32** %1, align 4, !dbg !31           ; [#uses=1 type=i32*] [debug line = 6:1]
  call void bitcast (void (...)* @_ssdm_SpecArrayPartition to void (i32*, i32, i8*, i32, i8*)*)(i32* %9, i32 1, i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !31 ; [debug line = 6:1]
  call void @llvm.dbg.declare(metadata !{i32* %i}, metadata !32), !dbg !33 ; [debug line = 6:9] [debug variable = i]
  call void @llvm.dbg.declare(metadata !{i32* %j}, metadata !34), !dbg !35 ; [debug line = 6:11] [debug variable = j]
  store i32 0, i32* %i, align 4, !dbg !36         ; [debug line = 7:9]
  br label %10, !dbg !36                          ; [debug line = 7:9]

; <label>:10                                      ; preds = %41, %0
  %11 = load i32* %i, align 4, !dbg !36           ; [#uses=1 type=i32] [debug line = 7:9]
  %12 = icmp slt i32 %11, 5, !dbg !36             ; [#uses=1 type=i1] [debug line = 7:9]
  br i1 %12, label %13, label %44, !dbg !36       ; [debug line = 7:9]

; <label>:13                                      ; preds = %10
  call void @llvm.dbg.declare(metadata !{i32* %sum}, metadata !38), !dbg !40 ; [debug line = 9:19] [debug variable = sum]
  store i32 0, i32* %sum, align 4, !dbg !41       ; [debug line = 9:26]
  br label %14, !dbg !41                          ; [debug line = 9:26]

; <label>:14                                      ; preds = %13
  store i32 0, i32* %j, align 4, !dbg !42         ; [debug line = 10:35]
  br label %15, !dbg !42                          ; [debug line = 10:35]

; <label>:15                                      ; preds = %33, %14
  %16 = load i32* %j, align 4, !dbg !42           ; [#uses=1 type=i32] [debug line = 10:35]
  %17 = icmp slt i32 %16, 5, !dbg !42             ; [#uses=1 type=i1] [debug line = 10:35]
  br i1 %17, label %18, label %36, !dbg !42       ; [debug line = 10:35]

; <label>:18                                      ; preds = %15
  call void bitcast (void (...)* @_ssdm_op_SpecLoopName to void (i8*)*)(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !44 ; [debug line = 11:10]
  call void bitcast (void (...)* @_ssdm_RegionBegin to void (i8*)*)(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !44 ; [debug line = 11:10]
  call void bitcast (void (...)* @_ssdm_Unroll to void (i32, i32, i32, i8*)*)(i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)) nounwind, !dbg !46 ; [debug line = 12:1]
  %19 = load i32* %i, align 4, !dbg !47           ; [#uses=1 type=i32] [debug line = 12:13]
  %20 = mul nsw i32 %19, 5, !dbg !47              ; [#uses=1 type=i32] [debug line = 12:13]
  %21 = load i32* %j, align 4, !dbg !47           ; [#uses=1 type=i32] [debug line = 12:13]
  %22 = add nsw i32 %20, %21, !dbg !47            ; [#uses=1 type=i32] [debug line = 12:13]
  %23 = load i32** %1, align 4, !dbg !47          ; [#uses=1 type=i32*] [debug line = 12:13]
  %24 = getelementptr inbounds i32* %23, i32 %22, !dbg !47 ; [#uses=1 type=i32*] [debug line = 12:13]
  %25 = load i32* %24, align 4, !dbg !47          ; [#uses=1 type=i32] [debug line = 12:13]
  %26 = load i32* %j, align 4, !dbg !47           ; [#uses=1 type=i32] [debug line = 12:13]
  %27 = load i32** %2, align 4, !dbg !47          ; [#uses=1 type=i32*] [debug line = 12:13]
  %28 = getelementptr inbounds i32* %27, i32 %26, !dbg !47 ; [#uses=1 type=i32*] [debug line = 12:13]
  %29 = load i32* %28, align 4, !dbg !47          ; [#uses=1 type=i32] [debug line = 12:13]
  %30 = mul nsw i32 %25, %29, !dbg !47            ; [#uses=1 type=i32] [debug line = 12:13]
  %31 = load i32* %sum, align 4, !dbg !47         ; [#uses=1 type=i32] [debug line = 12:13]
  %32 = add nsw i32 %31, %30, !dbg !47            ; [#uses=1 type=i32] [debug line = 12:13]
  store i32 %32, i32* %sum, align 4, !dbg !47     ; [debug line = 12:13]
  call void bitcast (void (...)* @_ssdm_RegionEnd to void (i8*)*)(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !48 ; [debug line = 13:9]
  br label %33, !dbg !48                          ; [debug line = 13:9]

; <label>:33                                      ; preds = %18
  %34 = load i32* %j, align 4, !dbg !49           ; [#uses=1 type=i32] [debug line = 10:45]
  %35 = add nsw i32 %34, 1, !dbg !49              ; [#uses=1 type=i32] [debug line = 10:45]
  store i32 %35, i32* %j, align 4, !dbg !49       ; [debug line = 10:45]
  br label %15, !dbg !49                          ; [debug line = 10:45]

; <label>:36                                      ; preds = %15
  %37 = load i32* %sum, align 4, !dbg !50         ; [#uses=1 type=i32] [debug line = 14:9]
  %38 = load i32* %i, align 4, !dbg !50           ; [#uses=1 type=i32] [debug line = 14:9]
  %39 = load i32** %3, align 4, !dbg !50          ; [#uses=1 type=i32*] [debug line = 14:9]
  %40 = getelementptr inbounds i32* %39, i32 %38, !dbg !50 ; [#uses=1 type=i32*] [debug line = 14:9]
  store i32 %37, i32* %40, align 4, !dbg !50      ; [debug line = 14:9]
  br label %41, !dbg !51                          ; [debug line = 15:5]

; <label>:41                                      ; preds = %36
  %42 = load i32* %i, align 4, !dbg !52           ; [#uses=1 type=i32] [debug line = 7:19]
  %43 = add nsw i32 %42, 1, !dbg !52              ; [#uses=1 type=i32] [debug line = 7:19]
  store i32 %43, i32* %i, align 4, !dbg !52       ; [debug line = 7:19]
  br label %10, !dbg !52                          ; [debug line = 7:19]

; <label>:44                                      ; preds = %10
  ret void, !dbg !53                              ; [debug line = 16:1]
}

; [#uses=6]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

; [#uses=1]
declare void @_ssdm_SpecArrayPartition(...) nounwind

; [#uses=1]
declare void @_ssdm_op_SpecLoopName(...) nounwind

; [#uses=1]
declare void @_ssdm_RegionBegin(...) nounwind

; [#uses=1]
declare void @_ssdm_Unroll(...) nounwind

; [#uses=1]
declare void @_ssdm_RegionEnd(...) nounwind

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!14}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 1, metadata !"C:/Users/YL/Desktop/MatrixMultiply/MatrixMultiply/solution1/.autopilot/db/MatrixMultiply.pragma.2.c", metadata !"C:\5CUsers\5CYL\5CDesktop\5CMatrixMultiply", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"MatrixMultiply", metadata !"MatrixMultiply", metadata !"", metadata !6, i32 4, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i32*, i32*, i32*)* @MatrixMultiply, null, null, metadata !12, i32 5} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"MatrixMultiply.c", metadata !"C:\5CUsers\5CYL\5CDesktop\5CMatrixMultiply", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !9}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!10 = metadata !{i32 786454, null, metadata !"data_type", metadata !6, i32 1, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ]
!11 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!12 = metadata !{metadata !13}
!13 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!14 = metadata !{void (i32*, i32*, i32*)* @MatrixMultiply, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20}
!15 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1}
!16 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!17 = metadata !{metadata !"kernel_arg_type", metadata !"data_type*", metadata !"data_type*", metadata !"data_type*"}
!18 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!19 = metadata !{metadata !"kernel_arg_name", metadata !"AA", metadata !"bb", metadata !"cc"}
!20 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!21 = metadata !{i32 786689, metadata !5, metadata !"AA", metadata !6, i32 16777220, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!22 = metadata !{i32 4, i32 31, metadata !5, null}
!23 = metadata !{i32 786689, metadata !5, metadata !"bb", metadata !6, i32 33554436, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!24 = metadata !{i32 4, i32 49, metadata !5, null}
!25 = metadata !{i32 786689, metadata !5, metadata !"cc", metadata !6, i32 50331652, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!26 = metadata !{i32 4, i32 65, metadata !5, null}
!27 = metadata !{i32 5, i32 2, metadata !28, null}
!28 = metadata !{i32 786443, metadata !5, i32 5, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!29 = metadata !{i32 5, i32 33, metadata !28, null}
!30 = metadata !{i32 5, i32 62, metadata !28, null}
!31 = metadata !{i32 6, i32 1, metadata !28, null}
!32 = metadata !{i32 786688, metadata !28, metadata !"i", metadata !6, i32 6, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!33 = metadata !{i32 6, i32 9, metadata !28, null}
!34 = metadata !{i32 786688, metadata !28, metadata !"j", metadata !6, i32 6, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!35 = metadata !{i32 6, i32 11, metadata !28, null}
!36 = metadata !{i32 7, i32 9, metadata !37, null}
!37 = metadata !{i32 786443, metadata !28, i32 7, i32 5, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!38 = metadata !{i32 786688, metadata !39, metadata !"sum", metadata !6, i32 9, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!39 = metadata !{i32 786443, metadata !37, i32 8, i32 5, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!40 = metadata !{i32 9, i32 19, metadata !39, null}
!41 = metadata !{i32 9, i32 26, metadata !39, null}
!42 = metadata !{i32 10, i32 35, metadata !43, null}
!43 = metadata !{i32 786443, metadata !39, i32 10, i32 31, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!44 = metadata !{i32 11, i32 10, metadata !45, null}
!45 = metadata !{i32 786443, metadata !43, i32 11, i32 9, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!46 = metadata !{i32 12, i32 1, metadata !45, null}
!47 = metadata !{i32 12, i32 13, metadata !45, null}
!48 = metadata !{i32 13, i32 9, metadata !45, null}
!49 = metadata !{i32 10, i32 45, metadata !43, null}
!50 = metadata !{i32 14, i32 9, metadata !39, null}
!51 = metadata !{i32 15, i32 5, metadata !39, null}
!52 = metadata !{i32 7, i32 19, metadata !37, null}
!53 = metadata !{i32 16, i32 1, metadata !28, null}
