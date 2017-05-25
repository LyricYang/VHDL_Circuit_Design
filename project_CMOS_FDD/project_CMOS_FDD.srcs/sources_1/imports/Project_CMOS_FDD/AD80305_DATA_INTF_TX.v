/************************************************************
module name 	: AD80305_DATA_INTF_TX
project			: AD936x FPGA
version			: 0.1
author			: Sun Cai
called by		: 
calling			:
description		: Data Interface with AD80305( TX Part )

revision history:
---------------------------------------------------------------
1. 2016-02-28, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_DATA_INTF_TX
    (
    input                   Clk,
    input                   Reset,
    input       [11:0]      Data_out_i,             //* I signal which will be be sent to AD80305
    input       [11:0]      Data_out_q,             //* Q signal which will be be sent to AD80305	

    output                  Ad80305_clk_out,        //* Correspond to AD80305 "FB_CLK" interface
    output                  Ad80305_frame_out,      //* Correspond to AD80305 "TX_FRAME" interface
    output      [11:0]      Ad80305_data_out        //* Correspond to AD80305 "P1_D[11:0]" interface

    );
/*****************************************************
			 Variable declaration              
*****************************************************/
reg		[11:0]	Data_out_i_core;
reg		[11:0]	Data_out_q_core;

wire     [12:0]  data_out_to_pins;   
/*****************************************************/
/*-------               Main Code            --------*/
/*****************************************************/
//* Select what data is to be sent to AD80305
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Data_out_i_core <= 12'b0;
	else
		Data_out_i_core <= Data_out_i;
end	

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Data_out_q_core <= 12'b0;
	else
        Data_out_q_core <= Data_out_q;
end			   

//* [2]
//* Send data to AD80305
//*
DDR_FDD_OUT         U_DDR_FDD_OUT (
  .data_out_to_pins     ( data_out_to_pins                                   ),          // output wire [12 : 0] data_out_to_pins
  .clk_in               ( Clk                                                ),                              // input wire clk_in
  .data_out_from_device ( { 1'b1,Data_out_i_core, 1'b0, Data_out_q_core }    ),  // input wire [25 : 0] data_out_from_device
  .io_reset             ( Reset                                              ),                          // input wire io_reset
  .clk_out              ( Ad80305_clk_out                                    )                            // output wire clk_out
);

assign Ad80305_data_out = data_out_to_pins[11:0];
assign Ad80305_frame_out = data_out_to_pins[12];

endmodule
