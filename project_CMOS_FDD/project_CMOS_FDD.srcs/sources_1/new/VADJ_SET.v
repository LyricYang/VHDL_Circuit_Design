`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/12 21:02:13
// Design Name: 
// Module Name: VADJ_SET
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module	VADJ_SET
	(
	//* Inputs
	Clk,
	Reset,
	
	//* Outputs
	SET_VADJ,
	VADJ_EN
	);

	
//=============================================================================
//* Inputs and Outputs
//=============================================================================
//* Inputs
input           Clk;
input			Reset;

//* Outputs
output  [1:0]   SET_VADJ;
output          VADJ_EN;


//=============================================================================
//* Variable declaration 
//=============================================================================
reg             tmp;
//=============================================================================
//* Model Body
//=============================================================================
assign SET_VADJ = 2'b10;    // 00 for 1.2V; 01 for 1.8V; 10 for 2.5V; 11 for 3.3V.

always @ ( posedge Clk )
begin
	if ( Reset == 1'b1 )
		tmp <= 1'b0;
	else
		tmp <= 1'b1;	
end

assign VADJ_EN = tmp;

endmodule				
