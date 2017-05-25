/************************************************************
module name 	: RESET
project			: AD936x FPGA
version			: 0.1
author			: Suncai
called by		: 
calling			:
description		: Global reset

revision history:
---------------------------------------------------------------
1. 2016-01-28, initial version
---------------------------------------------------------------
*************************************************************/
`timescale 1ns/1ns

module  RESET
	(
	//input signals
	Clk,

	//output signals
	Reset
	);


//=============================================================================
//* Inputs and Outputs
//=============================================================================
//* Inputs
input           Clk;

//* Outputs
output			Reset;


//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire			Reset_tmp;

//* Regs
reg             Reset_reg0;
reg             Reset_reg1;	
reg		[25:0]	Cnt_reset = 26'd0;


//=============================================================================
//* Model Body
//=============================================================================
always @ ( posedge Clk )
begin
	if ( Cnt_reset <= 26'd1000 )
		Cnt_reset <= Cnt_reset + 26'b01;
	else
		;
end

assign Reset_tmp = ( Cnt_reset < 26'd1000 ) ? 1'b1 : 1'b0;		

always @ ( posedge Clk)
begin
    Reset_reg0 <= Reset_tmp;
    Reset_reg1 <= Reset_reg0;
end

assign Reset = Reset_reg1;
/* Place the reset signal on the global clock network
global		U_GLOBAL
	(
	.in				( Reset_tmp ),
	.out			( Reset )
	);
*/

endmodule		
