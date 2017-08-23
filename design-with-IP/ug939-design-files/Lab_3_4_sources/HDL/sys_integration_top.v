`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2013 04:09:23 PM
// Design Name: 
// Module Name: sys_integration_top
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


module sys_integration_top (
    input   [4:0]   bram_addr,        // Input Address Bus to BlockRAM 
    input           clkin,			  // Input Clock Signal
    input   [2:0]   control_op,	      // Input Control Operation Bus
    input   [15:0]  fifo_data_in,     // Input Data Bus to FIFO
    input           rst,              // Input Reset Signal
    
    output  [31:0]  data_out,         // Output Data Bus from BlockRAM
	output			clk_locked,		  // Output CMT Locked Signal
    output          fifo_empty_flag,  // Output FIFO Empty Flag
    output          fifo_full_flag    // Output FIFO Full Flag
);
    //-----------------------------------
	// Declarations (wire)
	//-----------------------------------
	wire			accum_en;		  // Accumulator enable
   	wire	[31:0]	accum_out;		  // Accumulator output
	wire			accum_ctrl_rst;	  // Accumulator controller reset
	wire			accum_rst;		  // Accumulator reset
        
   	wire			bram_write_en;	  // BlockRAM write enable
    
	wire			clk_100;          // Global clock
    wire            clk_166;          // Global clock
	
    wire	[15:0]	fifo_data_out;    // FIFO data out bus
   	wire			fifo_rd_en;       // FIFO read enable
	wire			fifo_wr_en;       // FIFO write enable

	//------------------------------------
	// Assignments
	//------------------------------------
	assign accum_rst = accum_ctrl_rst | rst;

    //------------------------------------
    // Instantiate Clocking Wizard
    //------------------------------------    
    clk_wiz_0 clk_wiz_inst (
      .clk_in1(clkin),
      .clk_out1(clk_100),
      .clk_out2(clk_166),
      .reset(rst),
      .locked(clk_locked)
    );    
 
    //------------------------------------
    // Instantiate FIFO Generator
    //------------------------------------
    char_fifo char_fifo_inst (
      .rst(rst),
      .wr_clk(clk_166),
      .rd_clk(clk_100),
      .din(fifo_data_in),
      .wr_en(fifo_wr_en),
      .rd_en(fifo_rd_en),
      .dout(fifo_data_out),
      .full(fifo_full_flag),
      .empty(fifo_empty_flag)
    );
    //------------------------------------
    // Instantiate Accumulator
    //------------------------------------    
    Accumulator accum_inst (
      .B(fifo_data_out),
      .CLK(clk_100),
      .CE(accum_en),
      .SCLR(accum_rst),
      .Q(accum_out)
    );

    //------------------------------------
    // Instantiate Block Mem Gen
    //------------------------------------     
    blk_mem_gen_v7_3_0 block_mem_inst (
      .clka(clk_100),
      .rsta(rst),
      .wea(bram_write_enable),
      .addra(bram_addr),
      .dina(accum_out),
      .douta(data_out)
    );

    //------------------------------------
    // Instantiate Controller
    //------------------------------------      
    control_fsm controller (
        .control_state(control_op),
        .fifo_write_enable(fifo_wr_en),
        .fifo_read_enable(fifo_rd_en),
        .accum_enable(accum_en),
        .accum_reset(accum_ctrl_rst),
        .bram_write_enable(bram_write_enable)
    );
    
endmodule
