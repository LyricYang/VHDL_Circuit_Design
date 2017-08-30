############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Efficient_Parallel_Correlator_HLS
set_top Efficient_Cor
add_files Efficient_Parallel_Correlator_HLS/Efficient_Parallel_Correlator.c
add_files -tb Efficient_Parallel_Correlator_HLS/Efficient_Parallel_Correlator_Test.c
open_solution "solution1"
set_part {xc7vx485tffg1761-2} -tool vivado
create_clock -period 10 -name default
#source "./Efficient_Parallel_Correlator_HLS/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl -tool xsim
export_design -format ip_catalog
