`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/12 09:19:36
// Design Name: 
// Module Name: Test4Reconfig
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


module Test4Reconfig(

    );
    
//* Inputs
    reg           Clk;
            
    // Reconfig
    reg             Reconfig_ad80305;
    reg     [1:0]   Reconfig_ad80305_reg;
    reg     [19:0]  Reconfig_cnt;
    wire            Reconfig_ind;
    wire            Reconfig_pulse;
           
    // Initail for Clk & Reset
    initial begin
    // Initialize Inputs
        Clk = 0;
        Reconfig_ad80305 = 0;
     
    // Wait 100 ns for global reset to finish
        #100;
                              
        Reconfig_ad80305 = 1;
        #10 Reconfig_ad80305 = 0;               
    end
                   
    always begin
        #1 Clk = 0;
        #1 Clk = 1;
    end
    
// Reconfig_ad80305
    always @ ( posedge Clk )
    begin
        Reconfig_ad80305_reg <= {Reconfig_ad80305_reg[0],Reconfig_ad80305};
    end
    
    always @ ( posedge Clk )
    begin
        if( ( Reconfig_ad80305_reg[0] == 1'b1 ) && ( Reconfig_ad80305_reg[1] == 1'b0 ) )
            Reconfig_cnt <= 20'd0;
        else if( Reconfig_cnt < 20'd100 )
            Reconfig_cnt <= Reconfig_cnt + 20'd1;
        else
            ;
    end
    
    assign  Reconfig_ind   = ( Reconfig_cnt < 20'd15 ) ? 1'b0 : 1'b1;
    assign  Reconfig_pulse = ( Reconfig_cnt < 20'd100 ) ? 1'b0 : 1'b1;
    
endmodule
