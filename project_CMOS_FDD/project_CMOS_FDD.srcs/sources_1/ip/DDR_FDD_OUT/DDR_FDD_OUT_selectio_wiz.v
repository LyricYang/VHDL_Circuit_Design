
// file: DDR_FDD_OUT_selectio_wiz.v
// (c) Copyright 2009 - 2013 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//----------------------------------------------------------------------------

`timescale 1ps/1ps

module DDR_FDD_OUT_selectio_wiz
   // width of the data for the system
 #(parameter SYS_W = 13,
   // width of the data for the device
   parameter DEV_W = 26)
 (
  // From the device out to the system
  input  [DEV_W-1:0] data_out_from_device,
  output [SYS_W-1:0] data_out_to_pins,
  input              clk_in,        // Single ended clock from IOB
  output             clk_out,
  input              io_reset);
  wire clock_enable = 1'b1;
  // Signal declarations
  ////------------------------------
  // Before the buffer
  wire   [SYS_W-1:0] data_out_to_pins_int;
  // Between the delay and serdes
  wire   [SYS_W-1:0] data_out_to_pins_predelay;
  // Create the clock logic


  IBUF
    #(.IOSTANDARD ("LVCMOS25"))
   ibuf_clk_inst
     (.I          (clk_in),
      .O          (clk_in_int));
  
   // BUFR generates the slow clock
   BUFR
    #(.SIM_DEVICE("7SERIES"),
    .BUFR_DIVIDE("BYPASS"))
    clkout_buf_inst
    (.O (clk_div),
     .CE(),
     .CLR(),
     .I (clk_in_int));

   assign clk_out = clk_div; // This is regional clock;
  // We have multiple bits- step over every bit, instantiating the required elements
  genvar pin_count;
  generate for (pin_count = 0; pin_count < SYS_W; pin_count = pin_count + 1) begin: pins
    // Instantiate the buffers
    ////------------------------------
    // Instantiate a buffer for every bit of the data bus
    OBUF
      #(.IOSTANDARD ("LVCMOS25"))
     obuf_inst
       (.O          (data_out_to_pins    [pin_count]),
        .I          (data_out_to_pins_int[pin_count]));

    // Pass through the delay
    ////-------------------------------
   assign data_out_to_pins_int[pin_count]    = data_out_to_pins_predelay[pin_count];
 
    // Connect the delayed data to the fabric
    ////--------------------------------------
   // DDR register instantation
    ODDR
     #(.DDR_CLK_EDGE   ("OPPOSITE_EDGE"), //"OPPOSITE_EDGE" "SAME_EDGE"
       .INIT           (1'b0),
       .SRTYPE         ("ASYNC"))
     oddr_inst
      (.D1             (data_out_from_device[pin_count]),
       .D2             (data_out_from_device[SYS_W + pin_count]),
       .C              (clk_div),
       .CE             (clock_enable),
       .Q              (data_out_to_pins_predelay[pin_count]),
       .R              (io_reset),
       .S              (1'b0));
  end
  endgenerate

endmodule
