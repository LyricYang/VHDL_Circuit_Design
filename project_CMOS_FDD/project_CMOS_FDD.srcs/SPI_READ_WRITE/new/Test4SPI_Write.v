`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/02/26 16:22:54
// Design Name: 
// Module Name: Test4READ_WRITE
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


module Test4SPI_Write(

    );
//* Inputs
reg           Clk;
reg           Reset;
reg           Config_en;          //* High active pluse to start the SPI operation, be sure to hold several clock cycles
reg           Config_wr_rd;       //* 1'b1: Write, 1'b0: Read
reg  [9:0]    Config_addr;        //* Address which is writed to AD80305
reg  [7:0]    Config_data_wr;     //* Data which is writed to AD80305
reg           Spi_do;             //* AD80305 SPI DO interface
        
//* Outputs
wire [7:0]    Config_data_rd;    //* Data which is readed from AD80305
wire          Config_done;       //* ACK signal, told the interface module that the "Write" or "Read" operation is done
wire          Spi_enb;           //* AD80305 SPI ENB interface
wire          Spi_clk;           //* AD80305 SPI CLK interface
wire          Spi_di;            //* AD80305 SPI DI interface
       
// Initail for Clk & Reset
initial begin
// Initialize Inputs
    Clk = 0;
    Reset = 0;
                          
    Config_en = 0;
    Config_wr_rd = 1'b1;
    Config_addr = 10'h015A;
    Config_data_wr = 8'h55;
    Spi_do = 0;
                          
// Wait 100 ns for global reset to finish
    #100;
                          
    Reset = 1;
    #10 Reset = 0;
    Config_en = 1;
    #10 Config_en = 0;                     
end
               
always begin
    #1 Clk = 0;
    #1 Clk = 1;
end
               
AD80305_SPI_READ_WRITE U_SPI_READ_WRITE
(
                   //* Inputs
                   .Clk             ( Clk               ),
                   .Reset           ( Reset             ),
                   .Config_en       ( Config_en         ),            //* High active pluse to start the SPI operation, be sure to hold several clock cycles
                   .Config_wr_rd    ( Config_wr_rd      ),        //* 1'b1: Write, 1'b0: Read
                   .Config_addr     ( Config_addr       ),        //* Address which is writed to AD80305
                   .Config_data_wr  ( Config_data_wr    ),        //* Data which is writed to AD80305
                   .Spi_do          ( Spi_do            ),                //* AD80305 SPI DO interface
                   
                   //* Outputs
                   .Config_data_rd  ( Config_data_rd    ),        //* Data which is readed from AD80305
                   .Config_done     ( Config_done       ),        //* ACK signal, told the interface module that the "Write" or "Read" operation is done
                   .Spi_enb         ( Spi_enb           ),            //* AD80305 SPI ENB interface
                   .Spi_clk         ( Spi_clk           ),            //* AD80305 SPI CLK interface
                   .Spi_di          ( Spi_di            )                //* AD80305 SPI DI interface
);

endmodule
