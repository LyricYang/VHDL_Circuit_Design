# This script segment is generated automatically by AutoPilot

set id 0
set name MatrixMultiply_mubkb
set corename simcore_mul
set op mul
set stage_num 3
set max_latency -1
set registered_input 1
set in0_width 32
set in0_signed 1
set in1_width 32
set in1_signed 1
set out_width 32
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mul] == "ap_gen_simcore_mul"} {
eval "ap_gen_simcore_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-100\] Cannot find ap_gen_simcore_mul, check your AutoPilot builtin lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler ${name}
}


set op mul
set corename Mul3S
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul] == "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul"} {
eval "::AESL_LIB_VIRTEX::xil_gen_multicycle_mul { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    max_latency ${max_latency} \
    registered_input ${registered_input} \
    in0_width ${in0_width} \
    in0_signed ${in0_signed} \
    in1_width ${in1_width} \
    in1_signed ${in1_signed} \
    out_width ${out_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_multicycle_mul, check your platform lib"
}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name AA_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_0 \
    op interface \
    ports { AA_0 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name AA_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_1 \
    op interface \
    ports { AA_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name AA_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_2 \
    op interface \
    ports { AA_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name AA_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_3 \
    op interface \
    ports { AA_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name AA_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_4 \
    op interface \
    ports { AA_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name AA_5 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_5 \
    op interface \
    ports { AA_5 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name AA_6 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_6 \
    op interface \
    ports { AA_6 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name AA_7 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_7 \
    op interface \
    ports { AA_7 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name AA_8 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_8 \
    op interface \
    ports { AA_8 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name AA_9 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_9 \
    op interface \
    ports { AA_9 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name AA_10 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_10 \
    op interface \
    ports { AA_10 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name AA_11 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_11 \
    op interface \
    ports { AA_11 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name AA_12 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_12 \
    op interface \
    ports { AA_12 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name AA_13 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_13 \
    op interface \
    ports { AA_13 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 19 \
    name AA_14 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_14 \
    op interface \
    ports { AA_14 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name AA_15 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_15 \
    op interface \
    ports { AA_15 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name AA_16 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_16 \
    op interface \
    ports { AA_16 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name AA_17 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_17 \
    op interface \
    ports { AA_17 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name AA_18 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_18 \
    op interface \
    ports { AA_18 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name AA_19 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_19 \
    op interface \
    ports { AA_19 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 25 \
    name AA_20 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_20 \
    op interface \
    ports { AA_20 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name AA_21 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_21 \
    op interface \
    ports { AA_21 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name AA_22 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_22 \
    op interface \
    ports { AA_22 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name AA_23 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_23 \
    op interface \
    ports { AA_23 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name AA_24 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_AA_24 \
    op interface \
    ports { AA_24 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name bb_0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bb_0 \
    op interface \
    ports { bb_0 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name bb_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bb_1 \
    op interface \
    ports { bb_1 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name bb_2 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bb_2 \
    op interface \
    ports { bb_2 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name bb_3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bb_3 \
    op interface \
    ports { bb_3 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name bb_4 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_bb_4 \
    op interface \
    ports { bb_4 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name cc_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_cc_0 \
    op interface \
    ports { cc_0 { O 32 vector } cc_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name cc_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_cc_1 \
    op interface \
    ports { cc_1 { O 32 vector } cc_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 37 \
    name cc_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_cc_2 \
    op interface \
    ports { cc_2 { O 32 vector } cc_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name cc_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_cc_3 \
    op interface \
    ports { cc_3 { O 32 vector } cc_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
    name cc_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_cc_4 \
    op interface \
    ports { cc_4 { O 32 vector } cc_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


