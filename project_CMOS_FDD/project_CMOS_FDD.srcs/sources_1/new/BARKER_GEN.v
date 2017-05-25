`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/28 15:17:47
// Design Name: 
// Module Name: BARKER_GEN
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


module BARKER_GEN(
    Clk,
	Reset,
	
	Barker_Code
    );
// INPUTS
input           Clk;            // Clock
input           Reset;          // Reset
    
 // OUTPUTS
output          Barker_Code;    // LFSR data
    
// SIGNAL DECLARATIONS
reg             Barker_Code;
reg     [6:0]   shf_reg = 7'b1110010;// LFSR data
    
// MAIN CODE
always @(posedge Clk or posedge Reset)
begin
    if (Reset)
        begin
            shf_reg <= 7'b1110010;
            Barker_Code <= 1'b0;
        end
    else
        begin
            shf_reg[6:1] <= shf_reg[5:0];
            shf_reg[0]   <= shf_reg[6];
            Barker_Code  <= shf_reg[6];
        end
end
        
endmodule
