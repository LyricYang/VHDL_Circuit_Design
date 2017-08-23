cd c:/ug939-design-files/lab_3
create_project -force -part xc7k70tfbg484-3 my_project my_project

add_files -scan_for_includes ../Lab_3_4_sources/HDL 
import_files

import_files -fileset constrs_1 \
{../Lab_3_4_sources/Constraints/top_timing.xdc \
 ../Lab_3_4_sources/Constraints/top_physical.xdc}

set_property used_in_synthesis false [get_files top_physical.xdc]

import_ip \
{../Lab_3_4_sources/IP/Accumulator/Accumulator.xco \
 ../Lab_3_4_sources/IP/blk_mem/blk_mem_gen_v7_3_0.xci \
 ../Lab_3_4_sources/IP/clk_wiz/clk_wiz_0.xci \
 ../Lab_3_4_sources/IP/char_fifo/char_fifo.xci}

set_property generate_synth_checkpoint false [get_files clk_wiz_0.xci]
generate_target all [get_files clk_wiz_0.xci]

set clk_wiz_xdc [get_files -of_objects [get_files \
clk_wiz_0.xci] -filter {FILE_TYPE == XDC}]

set_property is_enabled false [get_files $clk_wiz_xdc]

set locked [get_property IS_LOCKED [get_ips blk_mem_gen_v7_3_0]]
set upgrade [get_property UPGRADE_VERSIONS [get_ips blk_mem_gen_v7_3_0]]
if {$upgrade != "" && $locked} { 
  upgrade_ip [get_ips blk_mem_gen_v7_3_0]}
 
set locked [get_property IS_LOCKED [get_ips Accumulator]]
set upgrade [get_property UPGRADE_VERSIONS [get_ips Accumulator]]
if {$upgrade != "" && $locked} { 
  upgrade_ip [get_ips Accumulator]}
 
create_ip_run [get_ips Accumulator] 
launch_runs [get_runs Accumulator_synth_1]
 
launch_runs synth_1
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1