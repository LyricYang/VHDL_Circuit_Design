/************************************************************
module name 	: AD80305_DATA_INTF_RX
project			: AD936x FPGA
version			: 0.1
author			: Sun Cai
called by		: 
calling			: 
description		: Data Interface with AD80305( RX Part)

revision history:
---------------------------------------------------------------
1. 2016-01-23, initial version
---------------------------------------------------------------
*************************************************************/
module  AD80305_DATA_INTF_RX
    (
    input               Clk,
    input               Reset,
    input               Start_transfer,
    input               Ad80305_clk_in,         //* Correspond to AD80305 "DATA_CLK" interface
    input               Ad80305_frame_in,       //* Correspond to AD80305 "RX_FRAME" interface
    input       [11:0]  Ad80305_data_in,        //* Correspond to AD80305 "P0_D[11:0]" interface

    output              Clk_out,                //* Output test for IP core "DDR_FDD_IN"
    output  reg [11:0]  Data_in_i,              //* I signal which comes from AD80305
    output  reg [11:0]  Data_in_q               //* Q signal which comes from AD80305
    );
/*****************************************************
			 Variable declaration              
*****************************************************/
wire    [25:0]  data_in_to_device;

reg     [11:0]  Data_in_i_tmp;
reg     [11:0]  Data_in_q_tmp;
wire    [23:0]  Data_fifo_out;
/*****************************************************/
/*-------               Main Code            --------*/
/*****************************************************/
//* Received data from AD80305 
DDR_FDD_IN      U_DDR_FDD_IN (
  .data_in_from_pins    ( { Ad80305_frame_in, Ad80305_data_in } ),  // input wire [12 : 0] data_in_from_pins
  .clk_in               ( Ad80305_clk_in                        ),  // input wire clk_in
  .io_reset             ( Reset                                 ),  // input wire io_reset
  .clk_out              ( Clk_out                               ),  // output wire clk_out
  .data_in_to_device    ( data_in_to_device                     )   // output wire [25 : 0] data_in_to_device
);

always @ ( posedge Ad80305_clk_in )
begin
    if ( ( data_in_to_device[25] == 1'b1 ) && ( data_in_to_device[12] == 1'b0 ) )
        Data_in_q_tmp <= data_in_to_device[11:0];
    else if ( ( data_in_to_device[25] == 1'b0 ) && ( data_in_to_device[12] == 1'b1 ) )
        Data_in_q_tmp <= data_in_to_device[24:13];
    else
        Data_in_q_tmp <= 12'b0;
end

always @ ( posedge Ad80305_clk_in )
begin
    if ( ( data_in_to_device[25] == 1'b1 ) && ( data_in_to_device[12] == 1'b0 ) )
        Data_in_i_tmp <= data_in_to_device[24:13];
    else if ( ( data_in_to_device[25] == 1'b0 ) && ( data_in_to_device[12] == 1'b1 ) )
        Data_in_i_tmp <= data_in_to_device[11:0];
    else
        Data_in_i_tmp <= 12'b0;
end
/* No FIFO Test 
always @ ( posedge Clk )
begin
    if( Start_transfer == 1'b1 )
    begin
        Data_in_i <= Data_in_i_tmp;
        Data_in_q <= Data_in_q_tmp;
    end
    else
    begin
        Data_in_i <= 12'b0;
        Data_in_q <= 12'b0;
    end
end
*/

INTF_FIFO U_INTF_FIFO (
  .rst      ( Reset                         ),  // input wire rst
  .wr_clk   ( Ad80305_clk_in                ),  // input wire wr_clk
  .rd_clk   ( Clk                           ),  // input wire rd_clk
  .din      ( {Data_in_i_tmp,Data_in_q_tmp} ),  // input wire [23 : 0] din
  .wr_en    ( 1'b1                          ),  // input wire wr_en
  .rd_en    ( 1'b1                          ),  // input wire rd_en
  .dout     ( Data_fifo_out                 ),      // output wire [23 : 0] dout
  .full     (),      // output wire full
  .empty    ()    // output wire empty
);

always @ ( posedge Clk )
begin
    if( Start_transfer == 1'b1 )
    begin
        Data_in_i <= Data_fifo_out[23:12];
        Data_in_q <= Data_fifo_out[11:0];
    end
    else
    begin
        Data_in_i <= 12'b0;
        Data_in_q <= 12'b0;
    end
end

endmodule
