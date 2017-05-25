`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/09/09 14:57:47
// Design Name: 
// Module Name: Test4FREQ_SET
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


module Test4FREQ_SET(

    );
    reg             Reset;
    reg             Clk;
    reg     [32:0]  Rx_freq;           // 70MHz~3GHz
    reg     [32:0]  Tx_freq;           // 70MHz~3GHz
    reg             Config_initial_done;

    wire    [2 :0]  Rx_VcoDivider;
    wire    [10:0]  Rx_FreqInteger;
    wire    [22:0]  Rx_FreqFractional;
    wire    [2 :0]  Tx_VcoDivider;
    wire    [10:0]  Tx_FreqInteger;
    wire    [22:0]  Tx_FreqFractional;
    wire            Reconfig_freq;
    
    // Initail for Clk & Reset
    initial begin
    // Initialize Inputs
    Clk = 0;
    Reset = 0;  
    Config_initial_done = 0;   
       
    // Wait 100 ns for global reset to finish
    #100;
                             
    Reset = 1;
    #10 Reset = 0;
    Config_initial_done = 1;
    #10 Config_initial_done = 0;
   end
                  
   always begin
       #1 Clk = 0;
       #1 Clk = 1;
   end
   
   always @ ( posedge Clk or posedge Reset )
   begin
       if( Reset == 1'b1 )
           begin
               Rx_freq <= 33'd2140000000;
               Tx_freq <= 33'd1950000000;
           end
       else
       ;
   end
   
    FREQ_SET_40M    U_FREQ_SET_40M
         (
         //input signals
         .Reset                  ( Reset                     ),
         .Clk                    ( Clk                       ),
         .Rx_freq                ( Rx_freq                   ),
         .Tx_freq                ( Tx_freq                   ),
         .Config_initial_done    ( Config_initial_done       ),    
     
         //output signals
         .Rx_VcoDivider          ( Rx_VcoDivider            ),
         .Rx_FreqInteger         ( Rx_FreqInteger           ),
         .Rx_FreqFractional      ( Rx_FreqFractional        ),
         .Tx_VcoDivider          ( Tx_VcoDivider            ),
         .Tx_FreqInteger         ( Tx_FreqInteger           ),
         .Tx_FreqFractional      ( Tx_FreqFractional        ),
         .Reconfig_freq          ( Reconfig_freq            )
         );
/*  
   FREQ_SET    U_FREQ_SET
       (
       //input signals
       .Reset                  ( Reset                     ),
       .Clk                    ( Clk                       ),
       .Rx_freq                ( Rx_freq                   ),
       .Tx_freq                ( Tx_freq                   ),
       .Config_initial_done    ( Config_initial_done       ),    
   
       //output signals
       .Rx_VcoDivider          ( Rx_VcoDivider            ),
       .Rx_FreqInteger         ( Rx_FreqInteger           ),
       .Rx_FreqFractional      ( Rx_FreqFractional        ),
       .Tx_VcoDivider          ( Tx_VcoDivider            ),
       .Tx_FreqInteger         ( Tx_FreqInteger           ),
       .Tx_FreqFractional      ( Tx_FreqFractional        ),
       .Reconfig_freq          ( Reconfig_freq            )
       );
 */  
endmodule
