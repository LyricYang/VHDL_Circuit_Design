// Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2015.2.1 (win64) Build 1302555 Wed Aug  5 13:06:02 MDT 2015
// Date        : Thu Sep 08 10:25:30 2016
// Host        : user-PC running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode funcsim
//               e:/Project_CMOS_FDD/project_CMOS_FDD/project_CMOS_FDD.srcs/sources_1/ip/DDR_FDD_IN/DDR_FDD_IN_funcsim.v
// Design      : DDR_FDD_IN
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tsbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "DDR_FDD_IN,selectio_wiz_v5_1,{component_name=DDR_FDD_IN,bus_dir=INPUTS,bus_sig_type=SINGLE,bus_io_std=LVCMOS25,use_serialization=false,use_phase_detector=false,serialization_factor=4,enable_bitslip=false,enable_train=false,system_data_width=13,bus_in_delay=NONE,bus_out_delay=NONE,clk_sig_type=SINGLE,clk_io_std=LVCMOS18,clk_buf=BUFIO2,active_edge=RISING,clk_delay=NONE,selio_bus_in_delay=NONE,selio_bus_out_delay=NONE,selio_clk_buf=BUFIO,selio_active_edge=DDR,selio_ddr_alignment=OPPOSITE_EDGE,selio_oddr_alignment=SAME_EDGE,ddr_alignment=C0,selio_interface_type=NETWORKING,interface_type=NETWORKING,selio_bus_in_tap=0,selio_bus_out_tap=0,selio_clk_io_std=LVCMOS25,selio_clk_sig_type=SINGLE}" *) (* DEV_W = "26" *) (* SYS_W = "13" *) 
(* NotValidForBitStream *)
module DDR_FDD_IN
   (data_in_from_pins,
    data_in_to_device,
    clk_in,
    clk_out,
    io_reset);
  input [12:0]data_in_from_pins;
  output [25:0]data_in_to_device;
  input clk_in;
  output clk_out;
  input io_reset;

  (* IBUF_LOW_PWR *) (* IOSTANDARD = "LVCMOS25" *) wire clk_in;
  wire clk_out;
  (* IBUF_LOW_PWR *) (* IOSTANDARD = "LVCMOS25" *) wire [12:0]data_in_from_pins;
  wire [25:0]data_in_to_device;
  wire io_reset;

  (* DEV_W = "26" *) 
  (* SYS_W = "13" *) 
  DDR_FDD_IN_DDR_FDD_IN_selectio_wiz inst
       (.clk_in(clk_in),
        .clk_out(clk_out),
        .data_in_from_pins(data_in_from_pins),
        .data_in_to_device(data_in_to_device),
        .io_reset(io_reset));
endmodule

(* DEV_W = "26" *) (* ORIG_REF_NAME = "DDR_FDD_IN_selectio_wiz" *) (* SYS_W = "13" *) 
module DDR_FDD_IN_DDR_FDD_IN_selectio_wiz
   (data_in_from_pins,
    data_in_to_device,
    clk_in,
    clk_out,
    io_reset);
  input [12:0]data_in_from_pins;
  output [25:0]data_in_to_device;
  input clk_in;
  output clk_out;
  input io_reset;

  wire clk_in;
  wire clk_in_int;
  wire clk_out;
  wire [12:0]data_in_from_pins;
  wire [12:0]data_in_from_pins_int;
  wire [25:0]data_in_to_device;
  wire io_reset;
  wire NLW_clkout_buf_inst_CE_UNCONNECTED;
  wire NLW_clkout_buf_inst_CLR_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFR #(
    .BUFR_DIVIDE("BYPASS"),
    .SIM_DEVICE("7SERIES")) 
    clkout_buf_inst
       (.CE(NLW_clkout_buf_inst_CE_UNCONNECTED),
        .CLR(NLW_clkout_buf_inst_CLR_UNCONNECTED),
        .I(clk_in_int),
        .O(clk_out));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF ibuf_clk_inst
       (.I(clk_in),
        .O(clk_in_int));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[0].ibuf_inst 
       (.I(data_in_from_pins[0]),
        .O(data_in_from_pins_int[0]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[0].iddr_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_int[0]),
        .Q1(data_in_to_device[0]),
        .Q2(data_in_to_device[13]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[10].ibuf_inst 
       (.I(data_in_from_pins[10]),
        .O(data_in_from_pins_int[10]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[10].iddr_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_int[10]),
        .Q1(data_in_to_device[10]),
        .Q2(data_in_to_device[23]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[11].ibuf_inst 
       (.I(data_in_from_pins[11]),
        .O(data_in_from_pins_int[11]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[11].iddr_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_int[11]),
        .Q1(data_in_to_device[11]),
        .Q2(data_in_to_device[24]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[12].ibuf_inst 
       (.I(data_in_from_pins[12]),
        .O(data_in_from_pins_int[12]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[12].iddr_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_int[12]),
        .Q1(data_in_to_device[12]),
        .Q2(data_in_to_device[25]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[1].ibuf_inst 
       (.I(data_in_from_pins[1]),
        .O(data_in_from_pins_int[1]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[1].iddr_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_int[1]),
        .Q1(data_in_to_device[1]),
        .Q2(data_in_to_device[14]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[2].ibuf_inst 
       (.I(data_in_from_pins[2]),
        .O(data_in_from_pins_int[2]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[2].iddr_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_int[2]),
        .Q1(data_in_to_device[2]),
        .Q2(data_in_to_device[15]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[3].ibuf_inst 
       (.I(data_in_from_pins[3]),
        .O(data_in_from_pins_int[3]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[3].iddr_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_int[3]),
        .Q1(data_in_to_device[3]),
        .Q2(data_in_to_device[16]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[4].ibuf_inst 
       (.I(data_in_from_pins[4]),
        .O(data_in_from_pins_int[4]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[4].iddr_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_int[4]),
        .Q1(data_in_to_device[4]),
        .Q2(data_in_to_device[17]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[5].ibuf_inst 
       (.I(data_in_from_pins[5]),
        .O(data_in_from_pins_int[5]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[5].iddr_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_int[5]),
        .Q1(data_in_to_device[5]),
        .Q2(data_in_to_device[18]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[6].ibuf_inst 
       (.I(data_in_from_pins[6]),
        .O(data_in_from_pins_int[6]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[6].iddr_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_int[6]),
        .Q1(data_in_to_device[6]),
        .Q2(data_in_to_device[19]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[7].ibuf_inst 
       (.I(data_in_from_pins[7]),
        .O(data_in_from_pins_int[7]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[7].iddr_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_int[7]),
        .Q1(data_in_to_device[7]),
        .Q2(data_in_to_device[20]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[8].ibuf_inst 
       (.I(data_in_from_pins[8]),
        .O(data_in_from_pins_int[8]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[8].iddr_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_int[8]),
        .Q1(data_in_to_device[8]),
        .Q2(data_in_to_device[21]),
        .R(io_reset),
        .S(1'b0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF \pins[9].ibuf_inst 
       (.I(data_in_from_pins[9]),
        .O(data_in_from_pins_int[9]));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* __SRVAL = "FALSE" *) 
  IDDR #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .INIT_Q1(1'b0),
    .INIT_Q2(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .SRTYPE("ASYNC")) 
    \pins[9].iddr_inst 
       (.C(clk_out),
        .CE(1'b1),
        .D(data_in_from_pins_int[9]),
        .Q1(data_in_to_device[9]),
        .Q2(data_in_to_device[22]),
        .R(io_reset),
        .S(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
