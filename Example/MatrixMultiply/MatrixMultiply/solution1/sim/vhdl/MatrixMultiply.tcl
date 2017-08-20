
log_wave [get_objects -filter {type == in_port || type == out_port || type == inout_port || type == port} /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/*]
set designtopgroup [add_wave_group "Design Top Signals"]
set coutputgroup [add_wave_group "C Outputs" -into $designtopgroup]
set cc_group [add_wave_group cc(memory) -into $coutputgroup]
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/cc_d0 -into $cc_group -radix hex
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/cc_we0 -into $cc_group -color #ffff00 -radix hex
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/cc_ce0 -into $cc_group -color #ffff00 -radix hex
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/cc_address0 -into $cc_group -radix hex
set cinputgroup [add_wave_group "C Inputs" -into $designtopgroup]
set bb_group [add_wave_group bb(memory) -into $cinputgroup]
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/bb_q0 -into $bb_group -radix hex
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/bb_ce0 -into $bb_group -color #ffff00 -radix hex
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/bb_address0 -into $bb_group -radix hex
set AA_group [add_wave_group AA(memory) -into $cinputgroup]
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/AA_q0 -into $AA_group -radix hex
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/AA_ce0 -into $AA_group -color #ffff00 -radix hex
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/AA_address0 -into $AA_group -radix hex
set blocksiggroup [add_wave_group "Block-level IO Handshake" -into $designtopgroup]
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/ap_start -into $blocksiggroup
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/ap_done -into $blocksiggroup
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/ap_idle -into $blocksiggroup
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/ap_ready -into $blocksiggroup
set resetgroup [add_wave_group "Reset" -into $designtopgroup]
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/ap_rst -into $resetgroup
set clockgroup [add_wave_group "Clock" -into $designtopgroup]
add_wave /apatb_MatrixMultiply_top/AESL_inst_MatrixMultiply/ap_clk -into $clockgroup
save_wave_config MatrixMultiply.wcfg
run all
quit

