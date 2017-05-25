`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/02/28 11:00:35
// Design Name: 
// Module Name: Test4ddr
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


module Test4Tx2Rx(

    );
/* Input */
// Rx   
reg         Clk;
reg         Reset;
reg         Start_transfer;
reg         Ad80305_clk_in;
reg         Ad80305_frame_in;
reg  [11:0] Ad80305_data_in;
        
// Tx
reg  [11:0] Data_out_i;             //* I signal which will be be sent to AD80305
reg  [11:0] Data_out_q;             //* Q signal which will be be sent to AD80305    
            
/* Outputs */
// Rx
wire [11:0] Data_in_i;
wire [11:0] Data_in_q;
        
// Tx
wire        Ad80305_clk_out;        //* Correspond to AD80305 "FB_CLK" interface
wire        Ad80305_frame_out;      //* Correspond to AD80305 "TX_FRAME" interface
wire [11:0] Ad80305_data_out;        //* Correspond to AD80305 "P1_D[11:0]" interface
        
/* Counter */
reg  [11:0] counter_data_in;
reg  [11:0] counter_data_in_t;
    
/* Initail for Clk & Reset */
initial begin
/* Initialize Inputs */
// Rx
    Clk = 0;
    Reset = 0;
    Start_transfer = 0;
    Ad80305_clk_in = 0;
    Ad80305_frame_in = 0;
    Ad80305_data_in = 12'b0;
                   
// Tx
    Data_out_i = 12'b0;
    Data_out_q = 12'b0;
                   
// Other
    counter_data_in = 12'b0;
    counter_data_in_t = 12'b0;             
       
// Wait 100 ns for global reset to finish
    #100;
                   
    Reset = 1;
    #100 Reset = 0;
    #100 Start_transfer = 1;                     
end

always begin
    #5 Clk = 0;
    #5 Clk = 1;
end
                
always @ ( posedge  Clk)
begin
    counter_data_in = counter_data_in + 12'd1;
end
        
always @ ( posedge  Clk)
begin
    counter_data_in_t = counter_data_in + 12'd100;
end
        
always @ ( posedge Clk )
begin
    Data_out_i <= counter_data_in;
end
        
always @ ( posedge Clk )
begin
    Data_out_q <= counter_data_in_t;
end
        
AD80305_DATA_INTF_TX   U_DATA_INTF_TX
(
                    .Clk                ( Clk               ),
                    .Reset              ( Reset             ),
                    .Data_out_i         ( Data_out_i        ),             //* I signal which will be be sent to AD80305
                    .Data_out_q         ( Data_out_q        ),             //* Q signal which will be be sent to AD80305    
                    
                    .Ad80305_clk_out    ( Ad80305_clk_out   ),        //* Correspond to AD80305 "FB_CLK" interface
                    .Ad80305_frame_out  ( Ad80305_frame_out ),      //* Correspond to AD80305 "TX_FRAME" interface
                    .Ad80305_data_out   ( Ad80305_data_out  )        //* Correspond to AD80305 "P1_D[11:0]" interface
);
         
always @ ( * )
begin
    Ad80305_clk_in <= Ad80305_clk_out;
end
         
always @ ( * )
begin
    Ad80305_frame_in <= Ad80305_frame_out;
end
         
always @ ( * )
begin
    Ad80305_data_in <= Ad80305_data_out;
end
         
AD80305_DATA_INTF_RX    U_DATA_INTF_RX
 (
                     .Clk                ( Clk               ),
                     .Reset              ( Reset             ),
                     .Start_transfer     ( Start_transfer    ),
                     .Ad80305_clk_in     ( Ad80305_clk_in    ),         //* Correspond to AD80305 "DATA_CLK" interface
                     .Ad80305_frame_in   ( Ad80305_frame_in  ),       //* Correspond to AD80305 "RX_FRAME" interface
                     .Ad80305_data_in    ( Ad80305_data_in   ),        //* Correspond to AD80305 "P0_D[11:0]" interface
                 
                     .Clk_out            (                   ),
                     .Data_in_i          ( Data_in_i         ),              //* I signal which comes from AD80305
                     .Data_in_q          ( Data_in_q         )               //* Q signal which comes from AD80305
);
                     
endmodule
