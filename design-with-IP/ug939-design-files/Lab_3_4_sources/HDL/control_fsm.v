`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2013 10:25:45 AM
// Design Name: 
// Module Name: control_fsm
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


module control_fsm(
    input      [2:0]   control_state,
    output reg         fifo_write_enable,
    output reg         fifo_read_enable,
    output reg         accum_enable,
    output reg         accum_reset,
    output reg         bram_write_enable
);
    
    always @ (control_state) begin
        // Write FIFO Registers
        if (control_state == 3'b001) begin
            fifo_write_enable <= 1;
            fifo_read_enable  <= 0;
            accum_enable      <= 0;
            accum_reset       <= 0;
            bram_write_enable <= 0;
        end
        // Read FIFO Registers
        else if (control_state == 3'b010) begin
            fifo_write_enable <= 0;
            fifo_read_enable  <= 1;
            accum_enable      <= 0;
            accum_reset       <= 0;
            bram_write_enable <= 0;        
        end
        // Write Accumulator
        else if (control_state == 3'b011) begin
            fifo_write_enable <= 0;
            fifo_read_enable  <= 0;
            accum_enable      <= 1;
            accum_reset       <= 0;
            bram_write_enable <= 0; 
        end
        // Write BRAM Registers
        else if (control_state == 3'b100) begin
            fifo_write_enable <= 0;
            fifo_read_enable  <= 0;
            accum_enable      <= 0;
            accum_reset       <= 0;
            bram_write_enable <= 1;             
        end
		// Reset Accumulator
		else if (control_state == 3'b101) begin
			fifo_write_enable <= 0;
            fifo_read_enable  <= 0;
            accum_enable      <= 0;
            accum_reset       <= 1;
            bram_write_enable <= 0;
		end
        // No Operation
        else begin
            fifo_write_enable <= 0;
            fifo_read_enable  <= 0;
            accum_enable      <= 0;
            accum_reset       <= 0;
            bram_write_enable <= 0;        
        end
    end
    
endmodule
