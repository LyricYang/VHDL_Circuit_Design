# assign LEDs for outputs
set_property PACKAGE_PIN P23 [get_ports {count_out[7]}]
set_property PACKAGE_PIN R23 [get_ports {count_out[6]}]
set_property PACKAGE_PIN M22 [get_ports {count_out[5]}]
set_property PACKAGE_PIN N22 [get_ports {count_out[4]}]
set_property PACKAGE_PIN P21 [get_ports {count_out[3]}]
set_property PACKAGE_PIN P20 [get_ports {count_out[2]}]
set_property PACKAGE_PIN H23 [get_ports {count_out[1]}]
set_property PACKAGE_PIN AP8 [get_ports {count_out[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {count_out[7]}]
set_property IOSTANDARD LVCMOS18 [get_ports {count_out[6]}]
set_property IOSTANDARD LVCMOS18 [get_ports {count_out[5]}]
set_property IOSTANDARD LVCMOS18 [get_ports {count_out[4]}]
set_property IOSTANDARD LVCMOS18 [get_ports {count_out[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {count_out[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {count_out[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {count_out[0]}]

# input buttons
# reset is middle button
set_property PACKAGE_PIN AE10 [get_ports reset]
set_property IOSTANDARD LVCMOS18 [get_ports reset]

# pause is S button
set_property PACKAGE_PIN AF8 [get_ports pause]
set_property IOSTANDARD LVCMOS18 [get_ports pause]

# toggle is top button
set_property PACKAGE_PIN AD10 [get_ports toggle]
set_property IOSTANDARD LVCMOS18 [get_ports toggle]

# programming voltages
set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]

# don't touch for the multiplier
set_property DONT_TOUCH true [get_cells my_mult_0]
set_property DONT_TOUCH 1 [get_nets -hierarchical -regexp {my_mult_0\/.*}]

######################################## END PIN ASSIGNMENT ########################################


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_0/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {count_out_OBUF[0]} {count_out_OBUF[1]} {count_out_OBUF[2]} {count_out_OBUF[3]} {count_out_OBUF[4]} {count_out_OBUF[5]} {count_out_OBUF[6]} {count_out_OBUF[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 4 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {count_out_pre[0]} {count_out_pre[1]} {count_out_pre[2]} {count_out_pre[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {mul_out_pre[0]} {mul_out_pre[1]} {mul_out_pre[2]} {mul_out_pre[3]} {mul_out_pre[4]} {mul_out_pre[5]} {mul_out_pre[6]} {mul_out_pre[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 1 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list pause_vio]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 1 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list reset_vio]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 1 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list state]]


set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets CLK]
