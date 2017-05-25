`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/10 11:12:55
// Design Name: 
// Module Name: Test4Reset
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


module Teset4Vadj(

    );
//* Inputs
    reg             Clk;
    
//* Outputs
    wire            Reset;
    wire    [1:0]   set_vadj;
    wire            vadj_en;

// Initail for Clk & Reset
    initial begin
    // Initialize Inputs
        Clk = 0;
    // Wait 100 ns for global reset to finish
        #100;
    end
                  
    always begin
        #1 Clk = 0;
        #1 Clk = 1;
    end
    
    RESET       U_Reset_Test
        (
        //input signals
        .Clk    ( Clk   ),
    
        //output signals
        .Reset  ( Reset )
        );

    VADJ_SET    U_VADJ_SET
	(
	//* Inputs
	.Clk       ( Clk       ),
	.Reset     ( Reset     ),
	
	//* Outputs
	.SET_VADJ  ( set_vadj  ),
	.VADJ_EN   ( vadj_en   )
	);
    
endmodule
