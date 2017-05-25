`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/02/26 15:08:54
// Design Name: 
// Module Name: Test4SPI
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


module Test4_SPI_CONFIG(

    );
reg               Clk;                    //* 40MHz
reg               Reset;                  //* Reset
reg               Pll_locked;             //* FPGA PLL is locked or not to control the FSM to initial the registers of AD80305
reg               Reconfig_ad80305;       //* Reconfigure the ad80305 registers, High active pluse 
reg               Wr_en_1byte;            //* Enable to write one data to AD80305 when you set from outside 
reg               Rd_en_1byte;            //* Enable to read one data from AD80305 when you set from outside 
                                                   //* Be care, when you write AD80305, set the read enable to 0
                                                   //* when you read AD80305, set the write enable to 0
reg               Wr_ind_1byte;            //* Indicate to write one data to AD80305 when you set from outside 
reg               Rd_ind_1byte;            //* Indicate to read one data from AD80305 when you set from outside 
reg       [9:0]   Wr_addr_1byte;            //* Send the write address to AD80305 when you set from outside 
reg       [9:0]   Rd_addr_1byte;            //* Send the read address to AD80305 when you set from outside
                                                   //* Be care, when you write AD80305, set the read address to 0
                                                   //* when you read AD80305, set the write address to 0
reg       [7:0]   Wr_data_1byte;          //* Send the incoming data to AD80305 when you set from outside  
reg               Spi_do_ad80305;            //* Interface to AD80305
   
wire [7:0]   Rd_data_1byte;            //* Read back one data from AD80305 when you set from outside 
wire         Config_initial_done;    //* The whole initial configure operation is done
wire          Spi_clk_ad80305;        //* Interface to AD80305
wire          Spi_enb_ad80305;        //* Interface to AD80305
wire          Spi_di_ad80305;            //* Interface to AD80305
wire         Enable_ad80305;
wire         Txnrx_ad80305;
wire          En_agc_ad80305;
       
// Initail for Clk & Reset
initial begin
// Initialize Inputs
    Clk = 0;
    Reset = 0;
    Pll_locked = 0;
    Reconfig_ad80305 = 0;
    Wr_en_1byte = 0;
    Rd_en_1byte = 0;
                          
    Wr_ind_1byte = 0;
    Rd_ind_1byte = 0;
                          
    Wr_addr_1byte = 10'b0;
    Rd_addr_1byte = 10'b0;
                          
    Wr_data_1byte = 8'b0;
    Spi_do_ad80305 = 0;
                          
// Wait 100 ns for global reset to finish
    #100;
                          
    Reset = 1;
    #10 Reset = 0;
    Pll_locked = 1;
    #10 Pll_locked = 0;                     
end
               
always begin
    #1 Clk = 0;
    #1 Clk = 1;
end
               
               
AD80305_SPI_INTF_TestVersion        U_AD80305_SPI_INTF_TestVersion
(
                   .Clk(Clk),
                   .Reset(Reset),
                   .Pll_locked(Pll_locked),
                   .Reconfig_ad80305(Reconfig_ad80305),
                   .Wr_en_1byte(Wr_en_1byte),
                   .Rd_en_1byte(Rd_en_1byte),

                   .Wr_ind_1byte(Wr_ind_1byte),
                   .Rd_ind_1byte(Rd_ind_1byte),
                   .Wr_addr_1byte(Wr_addr_1byte),
                   .Rd_addr_1byte(Rd_addr_1byte),

                   .Wr_data_1byte(Wr_data_1byte),
                   .Spi_do_ad80305(Spi_do_ad80305),

                   .Rd_data_1byte(Rd_data_1byte),
                   .Config_initial_done(Config_initial_done),
                   .Spi_clk_ad80305(Spi_clk_ad80305),
                   .Spi_enb_ad80305(Spi_enb_ad80305),
                   .Spi_di_ad80305(Spi_di_ad80305),
                   .Enable_ad80305(Enable_ad80305),
                   .Txnrx_ad80305(Txnrx_ad80305),
                   .En_agc_ad80305(En_agc_ad80305)
);

endmodule
