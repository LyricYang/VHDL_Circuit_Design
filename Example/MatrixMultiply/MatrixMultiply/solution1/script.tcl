############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project MatrixMultiply
set_top MatrixMultiply
add_files MatrixMultiply.c
add_files -tb A.h
add_files -tb TestMatrixMutiply.c
add_files -tb b.h
add_files -tb c.h
open_solution "solution1"
set_part {xq7z100rf900-1i} -tool vivado
create_clock -period 10 -name default
source "./MatrixMultiply/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level port -rtl vhdl -tool xsim
export_design -format ip_catalog
