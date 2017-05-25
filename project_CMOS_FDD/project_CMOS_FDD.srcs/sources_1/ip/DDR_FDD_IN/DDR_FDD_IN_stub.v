// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2.1 (win64) Build 1302555 Wed Aug  5 13:06:02 MDT 2015
// Date        : Thu Sep 08 10:25:30 2016
// Host        : user-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub
//               e:/Project_CMOS_FDD/project_CMOS_FDD/project_CMOS_FDD.srcs/sources_1/ip/DDR_FDD_IN/DDR_FDD_IN_stub.v
// Design      : DDR_FDD_IN
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module DDR_FDD_IN(data_in_from_pins, data_in_to_device, clk_in, clk_out, io_reset)
/* synthesis syn_black_box black_box_pad_pin="data_in_from_pins[12:0],data_in_to_device[25:0],clk_in,clk_out,io_reset" */;
  input [12:0]data_in_from_pins;
  output [25:0]data_in_to_device;
  input clk_in;
  output clk_out;
  input io_reset;
endmodule
