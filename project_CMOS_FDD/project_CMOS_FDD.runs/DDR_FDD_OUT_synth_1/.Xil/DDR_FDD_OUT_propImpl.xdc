set_property SRC_FILE_INFO {cfile:e:/Project_CMOS_FDD/project_CMOS_FDD/project_CMOS_FDD.srcs/sources_1/ip/DDR_FDD_OUT/DDR_FDD_OUT_ooc.xdc rfile:../../../project_CMOS_FDD.srcs/sources_1/ip/DDR_FDD_OUT/DDR_FDD_OUT_ooc.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:56 export:INPUT save:INPUT read:FILTER_OUT_OF_CONTEXT} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in]] 0.1
