; ModuleID = 'C:/Users/YL/Desktop/MatrixMultiply/MatrixMultiply/solution1/.autopilot/db/a.g.1.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@MatrixMultiply.str = internal unnamed_addr constant [15 x i8] c"MatrixMultiply\00" ; [#uses=1 type=[15 x i8]*]
@.str2 = private unnamed_addr constant [22 x i8] c"MatrixMultiply_label0\00", align 1 ; [#uses=1 type=[22 x i8]*]
@.str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=1 type=[1 x i8]*]
@.str = private unnamed_addr constant [9 x i8] c"COMPLETE\00", align 1 ; [#uses=1 type=[9 x i8]*]

; [#uses=6]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=1]
declare i32 @_ssdm_op_SpecRegionEnd(...)

; [#uses=1]
declare i32 @_ssdm_op_SpecRegionBegin(...)

; [#uses=1]
declare void @_ssdm_op_SpecLoopName(...) nounwind

; [#uses=1]
declare void @_ssdm_Unroll(...) nounwind

; [#uses=2]
declare void @_ssdm_SpecKeepArrayLoad(...)

; [#uses=3]
declare void @_ssdm_SpecArrayPartition(...) nounwind

; [#uses=3]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

; [#uses=0]
define void @MatrixMultiply(i32* %AA, i32* %bb, i32* %cc) nounwind {
  call void (...)* @_ssdm_op_SpecTopModule([15 x i8]* @MatrixMultiply.str) nounwind
  call void @llvm.dbg.value(metadata !{i32* %AA}, i64 0, metadata !21), !dbg !22 ; [debug line = 4:31] [debug variable = AA]
  call void @llvm.dbg.value(metadata !{i32* %bb}, i64 0, metadata !23), !dbg !24 ; [debug line = 4:49] [debug variable = bb]
  call void @llvm.dbg.value(metadata !{i32* %cc}, i64 0, metadata !25), !dbg !26 ; [debug line = 4:65] [debug variable = cc]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %AA, i32 25), !dbg !27 ; [debug line = 5:2]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %bb, i32 5), !dbg !29 ; [debug line = 5:33]
  call void (...)* @_ssdm_SpecArrayDimSize(i32* %cc, i32 5), !dbg !30 ; [debug line = 5:62]
  call void (...)* @_ssdm_SpecArrayPartition(i32* %cc, i32 1, i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)), !dbg !31 ; [debug line = 6:1]
  call void (...)* @_ssdm_SpecArrayPartition(i32* %bb, i32 1, i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)), !dbg !31 ; [debug line = 6:1]
  call void (...)* @_ssdm_SpecArrayPartition(i32* %AA, i32 1, i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)), !dbg !31 ; [debug line = 6:1]
  br label %1, !dbg !32                           ; [debug line = 7:9]

; <label>:1                                       ; preds = %3, %0
  %i = phi i32 [ 0, %0 ], [ %i.1, %3 ]            ; [#uses=4 type=i32]
  %exitcond1 = icmp eq i32 %i, 5, !dbg !32        ; [#uses=1 type=i1] [debug line = 7:9]
  br i1 %exitcond1, label %4, label %.preheader.preheader, !dbg !32 ; [debug line = 7:9]

.preheader.preheader:                             ; preds = %1
  %tmp = mul nsw i32 %i, 5, !dbg !34              ; [#uses=1 type=i32] [debug line = 12:13]
  br label %.preheader, !dbg !38                  ; [debug line = 10:35]

.preheader:                                       ; preds = %2, %.preheader.preheader
  %j = phi i32 [ %j.1, %2 ], [ 0, %.preheader.preheader ] ; [#uses=4 type=i32]
  %sum = phi i32 [ %sum.1, %2 ], [ 0, %.preheader.preheader ] ; [#uses=2 type=i32]
  %exitcond = icmp eq i32 %j, 5, !dbg !38         ; [#uses=1 type=i1] [debug line = 10:35]
  br i1 %exitcond, label %3, label %2, !dbg !38   ; [debug line = 10:35]

; <label>:2                                       ; preds = %.preheader
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0)), !dbg !39 ; [debug line = 11:10]
  %rbegin = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0)) nounwind, !dbg !39 ; [#uses=1 type=i32] [debug line = 11:10]
  call void (...)* @_ssdm_Unroll(i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0)), !dbg !40 ; [debug line = 12:1]
  %tmp.2 = add nsw i32 %j, %tmp, !dbg !34         ; [#uses=1 type=i32] [debug line = 12:13]
  %AA.addr = getelementptr inbounds i32* %AA, i32 %tmp.2, !dbg !34 ; [#uses=1 type=i32*] [debug line = 12:13]
  %AA.load = load i32* %AA.addr, align 4, !dbg !34 ; [#uses=2 type=i32] [debug line = 12:13]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %AA.load) nounwind
  %bb.addr = getelementptr inbounds i32* %bb, i32 %j, !dbg !34 ; [#uses=1 type=i32*] [debug line = 12:13]
  %bb.load = load i32* %bb.addr, align 4, !dbg !34 ; [#uses=2 type=i32] [debug line = 12:13]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %bb.load) nounwind
  %tmp.3 = mul nsw i32 %bb.load, %AA.load, !dbg !34 ; [#uses=1 type=i32] [debug line = 12:13]
  %sum.1 = add nsw i32 %tmp.3, %sum, !dbg !34     ; [#uses=1 type=i32] [debug line = 12:13]
  call void @llvm.dbg.value(metadata !{i32 %sum.1}, i64 0, metadata !41), !dbg !34 ; [debug line = 12:13] [debug variable = sum]
  %rend = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %rbegin) nounwind, !dbg !42 ; [#uses=0 type=i32] [debug line = 13:9]
  %j.1 = add nsw i32 %j, 1, !dbg !43              ; [#uses=1 type=i32] [debug line = 10:45]
  call void @llvm.dbg.value(metadata !{i32 %j.1}, i64 0, metadata !44), !dbg !43 ; [debug line = 10:45] [debug variable = j]
  br label %.preheader, !dbg !43                  ; [debug line = 10:45]

; <label>:3                                       ; preds = %.preheader
  %sum.0.lcssa = phi i32 [ %sum, %.preheader ]    ; [#uses=1 type=i32]
  %cc.addr = getelementptr inbounds i32* %cc, i32 %i, !dbg !45 ; [#uses=1 type=i32*] [debug line = 14:9]
  store i32 %sum.0.lcssa, i32* %cc.addr, align 4, !dbg !45 ; [debug line = 14:9]
  %i.1 = add nsw i32 %i, 1, !dbg !46              ; [#uses=1 type=i32] [debug line = 7:19]
  call void @llvm.dbg.value(metadata !{i32 %i.1}, i64 0, metadata !47), !dbg !46 ; [debug line = 7:19] [debug variable = i]
  br label %1, !dbg !46                           ; [debug line = 7:19]

; <label>:4                                       ; preds = %1
  ret void, !dbg !48                              ; [debug line = 16:1]
}

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
!32 = metadata !{i32 7, i32 9, metadata !33, null}
!33 = metadata !{i32 786443, metadata !28, i32 7, i32 5, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!34 = metadata !{i32 12, i32 13, metadata !35, null}
!35 = metadata !{i32 786443, metadata !36, i32 11, i32 9, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!36 = metadata !{i32 786443, metadata !37, i32 10, i32 31, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!37 = metadata !{i32 786443, metadata !33, i32 8, i32 5, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!38 = metadata !{i32 10, i32 35, metadata !36, null}
!39 = metadata !{i32 11, i32 10, metadata !35, null}
!40 = metadata !{i32 12, i32 1, metadata !35, null}
!41 = metadata !{i32 786688, metadata !37, metadata !"sum", metadata !6, i32 9, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!42 = metadata !{i32 13, i32 9, metadata !35, null}
!43 = metadata !{i32 10, i32 45, metadata !36, null}
!44 = metadata !{i32 786688, metadata !28, metadata !"j", metadata !6, i32 6, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!45 = metadata !{i32 14, i32 9, metadata !37, null}
!46 = metadata !{i32 7, i32 19, metadata !33, null}
!47 = metadata !{i32 786688, metadata !28, metadata !"i", metadata !6, i32 6, metadata !11, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!48 = metadata !{i32 16, i32 1, metadata !28, null}
