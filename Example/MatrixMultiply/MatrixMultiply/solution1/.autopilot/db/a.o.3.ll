; ModuleID = 'C:/Users/YL/Desktop/MatrixMultiply/MatrixMultiply/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-f80:128:128-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S32"
target triple = "i686-pc-mingw32"

@MatrixMultiply_str = internal unnamed_addr constant [15 x i8] c"MatrixMultiply\00" ; [#uses=1 type=[15 x i8]*]

; [#uses=36]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=5]
define weak void @_ssdm_op_Write.ap_auto.i32P(i32*, i32) {
entry:
  store i32 %1, i32* %0
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=1]
define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

; [#uses=35]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=30]
define weak i32 @_ssdm_op_Read.ap_auto.i32P(i32*) {
entry:
  %empty = load i32* %0                           ; [#uses=1 type=i32]
  ret i32 %empty
}

; [#uses=1]
define weak i5 @_ssdm_op_BitConcatenate.i5.i3.i2(i3, i2) nounwind readnone {
entry:
  %empty = zext i3 %0 to i5                       ; [#uses=1 type=i5]
  %empty_2 = zext i2 %1 to i5                     ; [#uses=1 type=i5]
  %empty_3 = shl i5 %empty, 2                     ; [#uses=1 type=i5]
  %empty_4 = or i5 %empty_3, %empty_2             ; [#uses=1 type=i5]
  ret i5 %empty_4
}

; [#uses=0]
define void @MatrixMultiply(i32* %AA_0, i32* %AA_1, i32* %AA_2, i32* %AA_3, i32* %AA_4, i32* %AA_5, i32* %AA_6, i32* %AA_7, i32* %AA_8, i32* %AA_9, i32* %AA_10, i32* %AA_11, i32* %AA_12, i32* %AA_13, i32* %AA_14, i32* %AA_15, i32* %AA_16, i32* %AA_17, i32* %AA_18, i32* %AA_19, i32* %AA_20, i32* %AA_21, i32* %AA_22, i32* %AA_23, i32* %AA_24, i32* %bb_0, i32* %bb_1, i32* %bb_2, i32* %bb_3, i32* %bb_4, i32* %cc_0, i32* %cc_1, i32* %cc_2, i32* %cc_3, i32* %cc_4) {
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_24), !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_23), !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_22), !map !19
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_21), !map !25
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_20), !map !31
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_19), !map !37
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_18), !map !43
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_17), !map !49
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_16), !map !55
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_15), !map !61
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_14), !map !67
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_13), !map !73
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_12), !map !79
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_11), !map !85
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_10), !map !91
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_9), !map !97
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_8), !map !103
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_7), !map !109
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_6), !map !115
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_5), !map !121
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_4), !map !127
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_3), !map !133
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_2), !map !139
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_1), !map !145
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %AA_0), !map !151
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %bb_4), !map !157
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %bb_3), !map !161
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %bb_2), !map !165
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %bb_1), !map !169
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %bb_0), !map !173
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %cc_4), !map !177
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %cc_3), !map !181
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %cc_2), !map !185
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %cc_1), !map !189
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %cc_0), !map !193
  call void (...)* @_ssdm_op_SpecTopModule([15 x i8]* @MatrixMultiply_str) nounwind
  call void @llvm.dbg.value(metadata !{i32* %AA_0}, i64 0, metadata !197), !dbg !212 ; [debug line = 4:31] [debug variable = AA[0]]
  call void @llvm.dbg.value(metadata !{i32* %AA_1}, i64 0, metadata !213), !dbg !212 ; [debug line = 4:31] [debug variable = AA[1]]
  call void @llvm.dbg.value(metadata !{i32* %AA_2}, i64 0, metadata !214), !dbg !212 ; [debug line = 4:31] [debug variable = AA[2]]
  call void @llvm.dbg.value(metadata !{i32* %AA_3}, i64 0, metadata !215), !dbg !212 ; [debug line = 4:31] [debug variable = AA[3]]
  call void @llvm.dbg.value(metadata !{i32* %AA_4}, i64 0, metadata !216), !dbg !212 ; [debug line = 4:31] [debug variable = AA[4]]
  call void @llvm.dbg.value(metadata !{i32* %AA_5}, i64 0, metadata !217), !dbg !212 ; [debug line = 4:31] [debug variable = AA[5]]
  call void @llvm.dbg.value(metadata !{i32* %AA_6}, i64 0, metadata !218), !dbg !212 ; [debug line = 4:31] [debug variable = AA[6]]
  call void @llvm.dbg.value(metadata !{i32* %AA_7}, i64 0, metadata !219), !dbg !212 ; [debug line = 4:31] [debug variable = AA[7]]
  call void @llvm.dbg.value(metadata !{i32* %AA_8}, i64 0, metadata !220), !dbg !212 ; [debug line = 4:31] [debug variable = AA[8]]
  call void @llvm.dbg.value(metadata !{i32* %AA_9}, i64 0, metadata !221), !dbg !212 ; [debug line = 4:31] [debug variable = AA[9]]
  call void @llvm.dbg.value(metadata !{i32* %AA_10}, i64 0, metadata !222), !dbg !212 ; [debug line = 4:31] [debug variable = AA[10]]
  call void @llvm.dbg.value(metadata !{i32* %AA_11}, i64 0, metadata !223), !dbg !212 ; [debug line = 4:31] [debug variable = AA[11]]
  call void @llvm.dbg.value(metadata !{i32* %AA_12}, i64 0, metadata !224), !dbg !212 ; [debug line = 4:31] [debug variable = AA[12]]
  call void @llvm.dbg.value(metadata !{i32* %AA_13}, i64 0, metadata !225), !dbg !212 ; [debug line = 4:31] [debug variable = AA[13]]
  call void @llvm.dbg.value(metadata !{i32* %AA_14}, i64 0, metadata !226), !dbg !212 ; [debug line = 4:31] [debug variable = AA[14]]
  call void @llvm.dbg.value(metadata !{i32* %AA_15}, i64 0, metadata !227), !dbg !212 ; [debug line = 4:31] [debug variable = AA[15]]
  call void @llvm.dbg.value(metadata !{i32* %AA_16}, i64 0, metadata !228), !dbg !212 ; [debug line = 4:31] [debug variable = AA[16]]
  call void @llvm.dbg.value(metadata !{i32* %AA_17}, i64 0, metadata !229), !dbg !212 ; [debug line = 4:31] [debug variable = AA[17]]
  call void @llvm.dbg.value(metadata !{i32* %AA_18}, i64 0, metadata !230), !dbg !212 ; [debug line = 4:31] [debug variable = AA[18]]
  call void @llvm.dbg.value(metadata !{i32* %AA_19}, i64 0, metadata !231), !dbg !212 ; [debug line = 4:31] [debug variable = AA[19]]
  call void @llvm.dbg.value(metadata !{i32* %AA_20}, i64 0, metadata !232), !dbg !212 ; [debug line = 4:31] [debug variable = AA[20]]
  call void @llvm.dbg.value(metadata !{i32* %AA_21}, i64 0, metadata !233), !dbg !212 ; [debug line = 4:31] [debug variable = AA[21]]
  call void @llvm.dbg.value(metadata !{i32* %AA_22}, i64 0, metadata !234), !dbg !212 ; [debug line = 4:31] [debug variable = AA[22]]
  call void @llvm.dbg.value(metadata !{i32* %AA_23}, i64 0, metadata !235), !dbg !212 ; [debug line = 4:31] [debug variable = AA[23]]
  call void @llvm.dbg.value(metadata !{i32* %AA_24}, i64 0, metadata !236), !dbg !212 ; [debug line = 4:31] [debug variable = AA[24]]
  call void @llvm.dbg.value(metadata !{i32* %bb_0}, i64 0, metadata !237), !dbg !242 ; [debug line = 4:49] [debug variable = bb[0]]
  call void @llvm.dbg.value(metadata !{i32* %bb_1}, i64 0, metadata !243), !dbg !242 ; [debug line = 4:49] [debug variable = bb[1]]
  call void @llvm.dbg.value(metadata !{i32* %bb_2}, i64 0, metadata !244), !dbg !242 ; [debug line = 4:49] [debug variable = bb[2]]
  call void @llvm.dbg.value(metadata !{i32* %bb_3}, i64 0, metadata !245), !dbg !242 ; [debug line = 4:49] [debug variable = bb[3]]
  call void @llvm.dbg.value(metadata !{i32* %bb_4}, i64 0, metadata !246), !dbg !242 ; [debug line = 4:49] [debug variable = bb[4]]
  call void @llvm.dbg.value(metadata !{i32* %cc_0}, i64 0, metadata !247), !dbg !249 ; [debug line = 4:65] [debug variable = cc[0]]
  call void @llvm.dbg.value(metadata !{i32* %cc_1}, i64 0, metadata !250), !dbg !249 ; [debug line = 4:65] [debug variable = cc[1]]
  call void @llvm.dbg.value(metadata !{i32* %cc_2}, i64 0, metadata !251), !dbg !249 ; [debug line = 4:65] [debug variable = cc[2]]
  call void @llvm.dbg.value(metadata !{i32* %cc_3}, i64 0, metadata !252), !dbg !249 ; [debug line = 4:65] [debug variable = cc[3]]
  call void @llvm.dbg.value(metadata !{i32* %cc_4}, i64 0, metadata !253), !dbg !249 ; [debug line = 4:65] [debug variable = cc[4]]
  br label %1, !dbg !254                          ; [debug line = 7:9]

; <label>:1                                       ; preds = %.preheader.preheader5, %0
  %i = phi i3 [ 0, %0 ], [ %i_1, %.preheader.preheader5 ] ; [#uses=5 type=i3]
  %exitcond1 = icmp eq i3 %i, -3, !dbg !254       ; [#uses=1 type=i1] [debug line = 7:9]
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 5, i64 5, i64 5) nounwind ; [#uses=0 type=i32]
  %i_1 = add i3 %i, 1, !dbg !257                  ; [#uses=1 type=i3] [debug line = 7:19]
  br i1 %exitcond1, label %2, label %.preheader.preheader_ifconv, !dbg !254 ; [debug line = 7:9]

.preheader.preheader_ifconv:                      ; preds = %1
  %tmp_1 = zext i3 %i to i5, !dbg !258            ; [#uses=1 type=i5] [debug line = 12:13]
  %tmp = call i5 @_ssdm_op_BitConcatenate.i5.i3.i2(i3 %i, i2 0), !dbg !258 ; [#uses=1 type=i5] [debug line = 12:13]
  %tmp_t = add i5 %tmp_1, %tmp                    ; [#uses=4 type=i5]
  %AA_20_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_20), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_0_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_0), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_5_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_5), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_10_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_10), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_15_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_15), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %sel_tmp = icmp eq i5 %tmp_t, 0, !dbg !258      ; [#uses=1 type=i1] [debug line = 12:13]
  %sel_tmp2 = icmp eq i5 %tmp_t, 5, !dbg !258     ; [#uses=6 type=i1] [debug line = 12:13]
  %sel_tmp4 = icmp eq i5 %tmp_t, 10, !dbg !258    ; [#uses=1 type=i1] [debug line = 12:13]
  %sel_tmp6 = icmp eq i5 %tmp_t, 15, !dbg !258    ; [#uses=6 type=i1] [debug line = 12:13]
  %newSel = select i1 %sel_tmp6, i32 %AA_15_read, i32 %AA_10_read ; [#uses=1 type=i32]
  %or_cond = or i1 %sel_tmp6, %sel_tmp4, !dbg !258 ; [#uses=6 type=i1] [debug line = 12:13]
  %newSel1 = select i1 %sel_tmp2, i32 %AA_5_read, i32 %AA_0_read ; [#uses=1 type=i32]
  %or_cond1 = or i1 %sel_tmp2, %sel_tmp, !dbg !258 ; [#uses=1 type=i1] [debug line = 12:13]
  %newSel2 = select i1 %or_cond, i32 %newSel, i32 %newSel1 ; [#uses=1 type=i32]
  %or_cond2 = or i1 %or_cond, %or_cond1, !dbg !258 ; [#uses=5 type=i1] [debug line = 12:13]
  %newSel3 = select i1 %or_cond2, i32 %newSel2, i32 %AA_20_read ; [#uses=1 type=i32]
  %bb_0_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %bb_0), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %tmp_3 = mul nsw i32 %newSel3, %bb_0_read, !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_21_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_21), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_1_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_1), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_6_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_6), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_11_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_11), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_16_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_16), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %newSel4 = select i1 %sel_tmp6, i32 %AA_16_read, i32 %AA_11_read ; [#uses=1 type=i32]
  %newSel5 = select i1 %sel_tmp2, i32 %AA_6_read, i32 %AA_1_read ; [#uses=1 type=i32]
  %newSel6 = select i1 %or_cond, i32 %newSel4, i32 %newSel5 ; [#uses=1 type=i32]
  %newSel7 = select i1 %or_cond2, i32 %newSel6, i32 %AA_21_read ; [#uses=1 type=i32]
  %bb_1_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %bb_1), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %tmp_3_1 = mul nsw i32 %newSel7, %bb_1_read, !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_22_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_22), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_2_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_2), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_7_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_7), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_12_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_12), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_17_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_17), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %newSel8 = select i1 %sel_tmp6, i32 %AA_17_read, i32 %AA_12_read ; [#uses=1 type=i32]
  %newSel9 = select i1 %sel_tmp2, i32 %AA_7_read, i32 %AA_2_read ; [#uses=1 type=i32]
  %newSel10 = select i1 %or_cond, i32 %newSel8, i32 %newSel9 ; [#uses=1 type=i32]
  %newSel11 = select i1 %or_cond2, i32 %newSel10, i32 %AA_22_read ; [#uses=1 type=i32]
  %bb_2_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %bb_2), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %tmp_3_2 = mul nsw i32 %newSel11, %bb_2_read, !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_23_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_23), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_3_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_3), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_8_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_8), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_13_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_13), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_18_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_18), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %newSel12 = select i1 %sel_tmp6, i32 %AA_18_read, i32 %AA_13_read ; [#uses=1 type=i32]
  %newSel13 = select i1 %sel_tmp2, i32 %AA_8_read, i32 %AA_3_read ; [#uses=1 type=i32]
  %newSel14 = select i1 %or_cond, i32 %newSel12, i32 %newSel13 ; [#uses=1 type=i32]
  %newSel15 = select i1 %or_cond2, i32 %newSel14, i32 %AA_23_read ; [#uses=1 type=i32]
  %bb_3_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %bb_3), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %tmp_3_3 = mul nsw i32 %newSel15, %bb_3_read, !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_24_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_24), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_4_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_4), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_9_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_9), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_14_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_14), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %AA_19_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %AA_19), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %newSel16 = select i1 %sel_tmp6, i32 %AA_19_read, i32 %AA_14_read ; [#uses=1 type=i32]
  %newSel17 = select i1 %sel_tmp2, i32 %AA_9_read, i32 %AA_4_read ; [#uses=1 type=i32]
  %newSel18 = select i1 %or_cond, i32 %newSel16, i32 %newSel17 ; [#uses=1 type=i32]
  %newSel19 = select i1 %or_cond2, i32 %newSel18, i32 %AA_24_read ; [#uses=1 type=i32]
  %bb_4_read = call i32 @_ssdm_op_Read.ap_auto.i32P(i32* %bb_4), !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %tmp_3_4 = mul nsw i32 %newSel19, %bb_4_read, !dbg !258 ; [#uses=1 type=i32] [debug line = 12:13]
  %tmp1 = add i32 %tmp_3_3, %tmp_3_2, !dbg !258   ; [#uses=1 type=i32] [debug line = 12:13]
  %tmp2 = add i32 %tmp_3_4, %tmp_3_1, !dbg !258   ; [#uses=1 type=i32] [debug line = 12:13]
  %tmp3 = add i32 %tmp_3, %tmp2, !dbg !258        ; [#uses=1 type=i32] [debug line = 12:13]
  %sum_1_4 = add nsw i32 %tmp1, %tmp3, !dbg !258  ; [#uses=5 type=i32] [debug line = 12:13]
  switch i3 %i, label %branch4 [
    i3 0, label %branch0
    i3 1, label %branch1
    i3 2, label %branch2
    i3 3, label %branch3
  ], !dbg !262                                    ; [debug line = 14:9]

.preheader.preheader5:                            ; preds = %branch4, %branch3, %branch2, %branch1, %branch0
  call void @llvm.dbg.value(metadata !{i3 %i_1}, i64 0, metadata !263), !dbg !257 ; [debug line = 7:19] [debug variable = i]
  br label %1, !dbg !257                          ; [debug line = 7:19]

; <label>:2                                       ; preds = %1
  ret void, !dbg !264                             ; [debug line = 16:1]

branch0:                                          ; preds = %.preheader.preheader_ifconv
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %cc_0, i32 %sum_1_4), !dbg !262 ; [debug line = 14:9]
  br label %.preheader.preheader5, !dbg !262      ; [debug line = 14:9]

branch1:                                          ; preds = %.preheader.preheader_ifconv
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %cc_1, i32 %sum_1_4), !dbg !262 ; [debug line = 14:9]
  br label %.preheader.preheader5, !dbg !262      ; [debug line = 14:9]

branch2:                                          ; preds = %.preheader.preheader_ifconv
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %cc_2, i32 %sum_1_4), !dbg !262 ; [debug line = 14:9]
  br label %.preheader.preheader5, !dbg !262      ; [debug line = 14:9]

branch3:                                          ; preds = %.preheader.preheader_ifconv
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %cc_3, i32 %sum_1_4), !dbg !262 ; [debug line = 14:9]
  br label %.preheader.preheader5, !dbg !262      ; [debug line = 14:9]

branch4:                                          ; preds = %.preheader.preheader_ifconv
  call void @_ssdm_op_Write.ap_auto.i32P(i32* %cc_4, i32 %sum_1_4), !dbg !262 ; [debug line = 14:9]
  br label %.preheader.preheader5, !dbg !262      ; [debug line = 14:9]
}

!opencl.kernels = !{!0}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"data_type*", metadata !"data_type*", metadata !"data_type*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"AA", metadata !"bb", metadata !"cc"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 31, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"AA", metadata !11, metadata !"int", i32 0, i32 31}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 24, i32 24, i32 2}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 31, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"AA", metadata !17, metadata !"int", i32 0, i32 31}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 23, i32 23, i32 2}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 0, i32 31, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"AA", metadata !23, metadata !"int", i32 0, i32 31}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 22, i32 22, i32 2}
!25 = metadata !{metadata !26}
!26 = metadata !{i32 0, i32 31, metadata !27}
!27 = metadata !{metadata !28}
!28 = metadata !{metadata !"AA", metadata !29, metadata !"int", i32 0, i32 31}
!29 = metadata !{metadata !30}
!30 = metadata !{i32 21, i32 21, i32 2}
!31 = metadata !{metadata !32}
!32 = metadata !{i32 0, i32 31, metadata !33}
!33 = metadata !{metadata !34}
!34 = metadata !{metadata !"AA", metadata !35, metadata !"int", i32 0, i32 31}
!35 = metadata !{metadata !36}
!36 = metadata !{i32 20, i32 20, i32 2}
!37 = metadata !{metadata !38}
!38 = metadata !{i32 0, i32 31, metadata !39}
!39 = metadata !{metadata !40}
!40 = metadata !{metadata !"AA", metadata !41, metadata !"int", i32 0, i32 31}
!41 = metadata !{metadata !42}
!42 = metadata !{i32 19, i32 19, i32 2}
!43 = metadata !{metadata !44}
!44 = metadata !{i32 0, i32 31, metadata !45}
!45 = metadata !{metadata !46}
!46 = metadata !{metadata !"AA", metadata !47, metadata !"int", i32 0, i32 31}
!47 = metadata !{metadata !48}
!48 = metadata !{i32 18, i32 18, i32 2}
!49 = metadata !{metadata !50}
!50 = metadata !{i32 0, i32 31, metadata !51}
!51 = metadata !{metadata !52}
!52 = metadata !{metadata !"AA", metadata !53, metadata !"int", i32 0, i32 31}
!53 = metadata !{metadata !54}
!54 = metadata !{i32 17, i32 17, i32 2}
!55 = metadata !{metadata !56}
!56 = metadata !{i32 0, i32 31, metadata !57}
!57 = metadata !{metadata !58}
!58 = metadata !{metadata !"AA", metadata !59, metadata !"int", i32 0, i32 31}
!59 = metadata !{metadata !60}
!60 = metadata !{i32 16, i32 16, i32 2}
!61 = metadata !{metadata !62}
!62 = metadata !{i32 0, i32 31, metadata !63}
!63 = metadata !{metadata !64}
!64 = metadata !{metadata !"AA", metadata !65, metadata !"int", i32 0, i32 31}
!65 = metadata !{metadata !66}
!66 = metadata !{i32 15, i32 15, i32 2}
!67 = metadata !{metadata !68}
!68 = metadata !{i32 0, i32 31, metadata !69}
!69 = metadata !{metadata !70}
!70 = metadata !{metadata !"AA", metadata !71, metadata !"int", i32 0, i32 31}
!71 = metadata !{metadata !72}
!72 = metadata !{i32 14, i32 14, i32 2}
!73 = metadata !{metadata !74}
!74 = metadata !{i32 0, i32 31, metadata !75}
!75 = metadata !{metadata !76}
!76 = metadata !{metadata !"AA", metadata !77, metadata !"int", i32 0, i32 31}
!77 = metadata !{metadata !78}
!78 = metadata !{i32 13, i32 13, i32 2}
!79 = metadata !{metadata !80}
!80 = metadata !{i32 0, i32 31, metadata !81}
!81 = metadata !{metadata !82}
!82 = metadata !{metadata !"AA", metadata !83, metadata !"int", i32 0, i32 31}
!83 = metadata !{metadata !84}
!84 = metadata !{i32 12, i32 12, i32 2}
!85 = metadata !{metadata !86}
!86 = metadata !{i32 0, i32 31, metadata !87}
!87 = metadata !{metadata !88}
!88 = metadata !{metadata !"AA", metadata !89, metadata !"int", i32 0, i32 31}
!89 = metadata !{metadata !90}
!90 = metadata !{i32 11, i32 11, i32 2}
!91 = metadata !{metadata !92}
!92 = metadata !{i32 0, i32 31, metadata !93}
!93 = metadata !{metadata !94}
!94 = metadata !{metadata !"AA", metadata !95, metadata !"int", i32 0, i32 31}
!95 = metadata !{metadata !96}
!96 = metadata !{i32 10, i32 10, i32 2}
!97 = metadata !{metadata !98}
!98 = metadata !{i32 0, i32 31, metadata !99}
!99 = metadata !{metadata !100}
!100 = metadata !{metadata !"AA", metadata !101, metadata !"int", i32 0, i32 31}
!101 = metadata !{metadata !102}
!102 = metadata !{i32 9, i32 9, i32 2}
!103 = metadata !{metadata !104}
!104 = metadata !{i32 0, i32 31, metadata !105}
!105 = metadata !{metadata !106}
!106 = metadata !{metadata !"AA", metadata !107, metadata !"int", i32 0, i32 31}
!107 = metadata !{metadata !108}
!108 = metadata !{i32 8, i32 8, i32 2}
!109 = metadata !{metadata !110}
!110 = metadata !{i32 0, i32 31, metadata !111}
!111 = metadata !{metadata !112}
!112 = metadata !{metadata !"AA", metadata !113, metadata !"int", i32 0, i32 31}
!113 = metadata !{metadata !114}
!114 = metadata !{i32 7, i32 7, i32 2}
!115 = metadata !{metadata !116}
!116 = metadata !{i32 0, i32 31, metadata !117}
!117 = metadata !{metadata !118}
!118 = metadata !{metadata !"AA", metadata !119, metadata !"int", i32 0, i32 31}
!119 = metadata !{metadata !120}
!120 = metadata !{i32 6, i32 6, i32 2}
!121 = metadata !{metadata !122}
!122 = metadata !{i32 0, i32 31, metadata !123}
!123 = metadata !{metadata !124}
!124 = metadata !{metadata !"AA", metadata !125, metadata !"int", i32 0, i32 31}
!125 = metadata !{metadata !126}
!126 = metadata !{i32 5, i32 5, i32 2}
!127 = metadata !{metadata !128}
!128 = metadata !{i32 0, i32 31, metadata !129}
!129 = metadata !{metadata !130}
!130 = metadata !{metadata !"AA", metadata !131, metadata !"int", i32 0, i32 31}
!131 = metadata !{metadata !132}
!132 = metadata !{i32 4, i32 4, i32 2}
!133 = metadata !{metadata !134}
!134 = metadata !{i32 0, i32 31, metadata !135}
!135 = metadata !{metadata !136}
!136 = metadata !{metadata !"AA", metadata !137, metadata !"int", i32 0, i32 31}
!137 = metadata !{metadata !138}
!138 = metadata !{i32 3, i32 3, i32 2}
!139 = metadata !{metadata !140}
!140 = metadata !{i32 0, i32 31, metadata !141}
!141 = metadata !{metadata !142}
!142 = metadata !{metadata !"AA", metadata !143, metadata !"int", i32 0, i32 31}
!143 = metadata !{metadata !144}
!144 = metadata !{i32 2, i32 2, i32 2}
!145 = metadata !{metadata !146}
!146 = metadata !{i32 0, i32 31, metadata !147}
!147 = metadata !{metadata !148}
!148 = metadata !{metadata !"AA", metadata !149, metadata !"int", i32 0, i32 31}
!149 = metadata !{metadata !150}
!150 = metadata !{i32 1, i32 1, i32 2}
!151 = metadata !{metadata !152}
!152 = metadata !{i32 0, i32 31, metadata !153}
!153 = metadata !{metadata !154}
!154 = metadata !{metadata !"AA", metadata !155, metadata !"int", i32 0, i32 31}
!155 = metadata !{metadata !156}
!156 = metadata !{i32 0, i32 0, i32 2}
!157 = metadata !{metadata !158}
!158 = metadata !{i32 0, i32 31, metadata !159}
!159 = metadata !{metadata !160}
!160 = metadata !{metadata !"bb", metadata !131, metadata !"int", i32 0, i32 31}
!161 = metadata !{metadata !162}
!162 = metadata !{i32 0, i32 31, metadata !163}
!163 = metadata !{metadata !164}
!164 = metadata !{metadata !"bb", metadata !137, metadata !"int", i32 0, i32 31}
!165 = metadata !{metadata !166}
!166 = metadata !{i32 0, i32 31, metadata !167}
!167 = metadata !{metadata !168}
!168 = metadata !{metadata !"bb", metadata !143, metadata !"int", i32 0, i32 31}
!169 = metadata !{metadata !170}
!170 = metadata !{i32 0, i32 31, metadata !171}
!171 = metadata !{metadata !172}
!172 = metadata !{metadata !"bb", metadata !149, metadata !"int", i32 0, i32 31}
!173 = metadata !{metadata !174}
!174 = metadata !{i32 0, i32 31, metadata !175}
!175 = metadata !{metadata !176}
!176 = metadata !{metadata !"bb", metadata !155, metadata !"int", i32 0, i32 31}
!177 = metadata !{metadata !178}
!178 = metadata !{i32 0, i32 31, metadata !179}
!179 = metadata !{metadata !180}
!180 = metadata !{metadata !"cc", metadata !131, metadata !"int", i32 0, i32 31}
!181 = metadata !{metadata !182}
!182 = metadata !{i32 0, i32 31, metadata !183}
!183 = metadata !{metadata !184}
!184 = metadata !{metadata !"cc", metadata !137, metadata !"int", i32 0, i32 31}
!185 = metadata !{metadata !186}
!186 = metadata !{i32 0, i32 31, metadata !187}
!187 = metadata !{metadata !188}
!188 = metadata !{metadata !"cc", metadata !143, metadata !"int", i32 0, i32 31}
!189 = metadata !{metadata !190}
!190 = metadata !{i32 0, i32 31, metadata !191}
!191 = metadata !{metadata !192}
!192 = metadata !{metadata !"cc", metadata !149, metadata !"int", i32 0, i32 31}
!193 = metadata !{metadata !194}
!194 = metadata !{i32 0, i32 31, metadata !195}
!195 = metadata !{metadata !196}
!196 = metadata !{metadata !"cc", metadata !155, metadata !"int", i32 0, i32 31}
!197 = metadata !{i32 790531, metadata !198, metadata !"AA[0]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!198 = metadata !{i32 786689, metadata !199, metadata !"AA", null, i32 4, metadata !208, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!199 = metadata !{i32 786478, i32 0, metadata !200, metadata !"MatrixMultiply", metadata !"MatrixMultiply", metadata !"", metadata !200, i32 4, metadata !201, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !206, i32 5} ; [ DW_TAG_subprogram ]
!200 = metadata !{i32 786473, metadata !"MatrixMultiply.c", metadata !"C:\5CUsers\5CYL\5CDesktop\5CMatrixMultiply", null} ; [ DW_TAG_file_type ]
!201 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !202, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!202 = metadata !{null, metadata !203, metadata !203, metadata !203}
!203 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 32, i64 32, i64 0, i32 0, metadata !204} ; [ DW_TAG_pointer_type ]
!204 = metadata !{i32 786454, null, metadata !"data_type", metadata !200, i32 1, i64 0, i64 0, i64 0, i32 0, metadata !205} ; [ DW_TAG_typedef ]
!205 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!206 = metadata !{metadata !207}
!207 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ]
!208 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 0, i64 0, i32 0, i32 0, metadata !204, metadata !209, i32 0, i32 0} ; [ DW_TAG_array_type ]
!209 = metadata !{metadata !210}
!210 = metadata !{i32 786465, i64 0, i64 24}      ; [ DW_TAG_subrange_type ]
!211 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !204} ; [ DW_TAG_pointer_type ]
!212 = metadata !{i32 4, i32 31, metadata !199, null}
!213 = metadata !{i32 790531, metadata !198, metadata !"AA[1]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!214 = metadata !{i32 790531, metadata !198, metadata !"AA[2]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!215 = metadata !{i32 790531, metadata !198, metadata !"AA[3]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!216 = metadata !{i32 790531, metadata !198, metadata !"AA[4]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!217 = metadata !{i32 790531, metadata !198, metadata !"AA[5]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!218 = metadata !{i32 790531, metadata !198, metadata !"AA[6]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!219 = metadata !{i32 790531, metadata !198, metadata !"AA[7]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!220 = metadata !{i32 790531, metadata !198, metadata !"AA[8]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!221 = metadata !{i32 790531, metadata !198, metadata !"AA[9]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!222 = metadata !{i32 790531, metadata !198, metadata !"AA[10]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!223 = metadata !{i32 790531, metadata !198, metadata !"AA[11]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!224 = metadata !{i32 790531, metadata !198, metadata !"AA[12]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!225 = metadata !{i32 790531, metadata !198, metadata !"AA[13]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!226 = metadata !{i32 790531, metadata !198, metadata !"AA[14]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!227 = metadata !{i32 790531, metadata !198, metadata !"AA[15]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!228 = metadata !{i32 790531, metadata !198, metadata !"AA[16]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!229 = metadata !{i32 790531, metadata !198, metadata !"AA[17]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!230 = metadata !{i32 790531, metadata !198, metadata !"AA[18]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!231 = metadata !{i32 790531, metadata !198, metadata !"AA[19]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!232 = metadata !{i32 790531, metadata !198, metadata !"AA[20]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!233 = metadata !{i32 790531, metadata !198, metadata !"AA[21]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!234 = metadata !{i32 790531, metadata !198, metadata !"AA[22]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!235 = metadata !{i32 790531, metadata !198, metadata !"AA[23]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!236 = metadata !{i32 790531, metadata !198, metadata !"AA[24]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!237 = metadata !{i32 790531, metadata !238, metadata !"bb[0]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!238 = metadata !{i32 786689, metadata !199, metadata !"bb", null, i32 4, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!239 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 0, i64 0, i32 0, i32 0, metadata !204, metadata !240, i32 0, i32 0} ; [ DW_TAG_array_type ]
!240 = metadata !{metadata !241}
!241 = metadata !{i32 786465, i64 0, i64 4}       ; [ DW_TAG_subrange_type ]
!242 = metadata !{i32 4, i32 49, metadata !199, null}
!243 = metadata !{i32 790531, metadata !238, metadata !"bb[1]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!244 = metadata !{i32 790531, metadata !238, metadata !"bb[2]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!245 = metadata !{i32 790531, metadata !238, metadata !"bb[3]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!246 = metadata !{i32 790531, metadata !238, metadata !"bb[4]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!247 = metadata !{i32 790531, metadata !248, metadata !"cc[0]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!248 = metadata !{i32 786689, metadata !199, metadata !"cc", null, i32 4, metadata !239, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!249 = metadata !{i32 4, i32 65, metadata !199, null}
!250 = metadata !{i32 790531, metadata !248, metadata !"cc[1]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!251 = metadata !{i32 790531, metadata !248, metadata !"cc[2]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!252 = metadata !{i32 790531, metadata !248, metadata !"cc[3]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!253 = metadata !{i32 790531, metadata !248, metadata !"cc[4]", null, i32 4, metadata !211, i32 0, i32 0} ; [ DW_TAG_arg_variable_field ]
!254 = metadata !{i32 7, i32 9, metadata !255, null}
!255 = metadata !{i32 786443, metadata !256, i32 7, i32 5, metadata !200, i32 1} ; [ DW_TAG_lexical_block ]
!256 = metadata !{i32 786443, metadata !199, i32 5, i32 1, metadata !200, i32 0} ; [ DW_TAG_lexical_block ]
!257 = metadata !{i32 7, i32 19, metadata !255, null}
!258 = metadata !{i32 12, i32 13, metadata !259, null}
!259 = metadata !{i32 786443, metadata !260, i32 11, i32 9, metadata !200, i32 4} ; [ DW_TAG_lexical_block ]
!260 = metadata !{i32 786443, metadata !261, i32 10, i32 31, metadata !200, i32 3} ; [ DW_TAG_lexical_block ]
!261 = metadata !{i32 786443, metadata !255, i32 8, i32 5, metadata !200, i32 2} ; [ DW_TAG_lexical_block ]
!262 = metadata !{i32 14, i32 9, metadata !261, null}
!263 = metadata !{i32 786688, metadata !256, metadata !"i", metadata !200, i32 6, metadata !205, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!264 = metadata !{i32 16, i32 1, metadata !256, null}
