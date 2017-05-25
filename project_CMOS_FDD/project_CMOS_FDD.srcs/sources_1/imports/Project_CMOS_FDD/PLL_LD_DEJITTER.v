/************************************************************
module name 	: PLL_LD_DEJITTER
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: PLL dejitter

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/

module	PLL_LD_DEJITTER
	(
	//* Inputs
	Clk,
	Pll_ld,
	
	//* Outputs
	Pll_ld_dejitter
	);

	
//=============================================================================
//* Inputs and Outputs
//=============================================================================
//* Inputs
input           Clk;
input			Pll_ld;

//* Outputs
output			Pll_ld_dejitter;


//=============================================================================
//* Variable declaration 
//=============================================================================
//* Regs
reg		[24:0]	Cnt_1s = 25'd0;
reg				Pll_ld_dejitter;


//=============================================================================
//* Model Body
//=============================================================================

always @ ( posedge Clk )
begin
	if ( Pll_ld == 1'b1 )
		if ( Cnt_1s >= 25'd30720000 )
			Cnt_1s <= 25'd30720000;
		else
			Cnt_1s <= Cnt_1s + 25'b01;
	else
		Cnt_1s <= 25'b0;	
end

always @ ( posedge Clk )
begin
	if ( Cnt_1s >= 25'd30720000 )
		Pll_ld_dejitter <= 1'b1;
	else
		Pll_ld_dejitter <= 1'b0;
end

endmodule				
