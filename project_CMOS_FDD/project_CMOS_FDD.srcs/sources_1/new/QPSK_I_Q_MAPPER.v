`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/28 15:23:31
// Design Name: 
// Module Name: QPSK_I_Q_MAPPER
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


module QPSK_I_Q_MAPPER(
    Clk, 
	Addr, 
	
	I_Q_Data
    );
input 				Clk;
input               Addr;
output     [11:0]   I_Q_Data;
    
reg       [11:0]   I_Q_Data;
    
always @ (posedge Clk)
begin
    case (Addr)
        8'b0: I_Q_Data = 12'b011111110000;
        8'b1: I_Q_Data = 12'b100000010000;
    endcase
end

endmodule
