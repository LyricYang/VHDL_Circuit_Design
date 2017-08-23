#cd c:/ug939-design-files/lab_4

set_part xc7k70tfbg484-3

read_verilog [glob ../Lab_3_4_sources/HDL/*.v]

read_ip ../Lab_3_4_sources/IP/char_fifo/char_fifo.xci

file mkdir IP/blk_mem
file mkdir IP/clk_wiz
file mkdir IP/accum

file copy -force \
../Lab_3_4_sources/IP/blk_mem/blk_mem_gen_v7_3_0.xci ./IP/blk_mem
file copy -force \
../Lab_3_4_sources/IP/clk_wiz/clk_wiz_0.xci ./IP/clk_wiz
file copy -force ../Lab_3_4_sources/IP/Accumulator/Accumulator.xco ./IP/accum

read_ip ./IP/blk_mem/blk_mem_gen_v7_3_0.xci
read_ip ./IP/clk_wiz/clk_wiz_0.xci
read_ip ./IP/accum/Accumulator.xco

set_property generate_synth_checkpoint false [get_files clk_wiz_0.xci]
generate_target all [get_ips clk_wiz_0]
set clk_wiz_xdc [get_files -of_objects [get_files \
clk_wiz_0.xci] -filter {FILE_TYPE == XDC}]
set_property is_enabled false [get_files $clk_wiz_xdc]

set locked [get_property IS_LOCKED [get_ips blk_mem_gen_v7_3_0]]
set upgrade [get_property UPGRADE_VERSIONS [get_ips blk_mem_gen_v7_3_0]]
if {$upgrade != "" && $locked} {
  upgrade_ip [get_ips blk_mem_gen_v7_3_0]}
generate_target all [get_ips blk_mem_gen_v7_3_0]
  
set locked [get_property IS_LOCKED [get_ips Accumulator]]
set upgrade [get_property UPGRADE_VERSIONS [get_ips Accumulator]]
if {$upgrade != "" && $locked} {
  upgrade_ip [get_ips Accumulator]}  
generate_target all [get_ips Accumulator]

synth_ip [get_ips Accumulator]
synth_ip [get_ips blk_mem_gen_v7_3_0]
  
read_xdc ../Lab_3_4_sources/Constraints/top_timing.xdc

synth_design -top sys_integration_top
write_checkpoint -force post_synth.dcp
report_timing_summary -file timing_syn.rpt

read_xdc ../Lab_3_4_sources/Constraints/top_physical.xdc

opt_design
place_design
write_checkpoint -force post_place.dcp
report_timing -file timing_place.rpt

phys_opt_design
route_design
write_checkpoint -force post_route.dcp
report_timing_summary -file timing_summary

write_bitstream -force sys_integration_top.bit