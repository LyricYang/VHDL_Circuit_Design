`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2016 12:16:26 PM
// Design Name: 
// Module Name: top
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


module top(
    input reset,
    input clk_in1_p,
    input clk_in1_n,
    input pause,
    input toggle,
    output reg [7:0] count_out
   );

// Clock     
wire CLK;

// big counter to slow down clock
reg [28:0] divClk;        (* MARK_DEBUG="true" *)

// counter output (MSB of divClk)
// multiplier output = coun_out^2
reg [3:0] count_out_pre;  (* MARK_DEBUG="true" *)
reg [7:0] mul_out_pre;    (* MARK_DEBUG="true" *)
wire [7:0] mult_out_pre_pre;

// state machines for run/stop (state - changed by paused input) display count/mult (tog_state - changed by toggle input)
reg state;
wire next_state;
parameter RUN = 1'b0, STOP=1'b1;
reg tog_state;
wire next_tog_state;
parameter TOG1 = 1'b0, TOG2 = 1'b1;

// used to create pulse when button is released (i.e. prev_val = 1, current_val = 0
// pulse in turn alters state machine.
reg toggled;
reg prev_toggle;
reg paused;
reg prev_paused;

// VIO wires
wire toggle_vio;  (* MARK_DEBUG="true" *)
wire reset_vio;   (* MARK_DEBUG="true" *)
wire pause_vio;   (* MARK_DEBUG="true" *)
wire toggle_vio_out; 
wire reset_vio_out;  
wire pause_vio_out;


// Clocking wizard 
  clk_wiz_0 clk_0
   (
   // Clock in ports
    .clk_in1_p(clk_in1_p),    // input clk_in1_p
    .clk_in1_n(clk_in1_n),    // input clk_in1_n
    // Clock out ports
    .clk_out1(CLK),     // output clk_out1
    // Status and control signals
    .reset(1'b0));       // input reset
  
// VIO
vio_0 vio_inst_0 (
  .clk(CLK),                // input wire clk
  .probe_in0(count_out),    // input wire [7 : 0] probe_in0
  .probe_out0(toggle_vio_out),  // output wire [0 : 0] probe_out0
  .probe_out1(reset_vio_out),  // output wire [0 : 0] probe_out1
  .probe_out2(pause_vio_out),  // output wire [0 : 0] probe_out2
  .probe_out3(vio_select)
);

multiplier my_mult_0 (
   .in1(divClk[28:25]),
   .in2(divClk[28:25]),
   .out(mult_out_pre_pre)
);
  
// figure out next state   
//    assign vio_select = 0;
    assign next_state      = fsm_function(state,paused);
    assign next_tog_state  = fsm_tog_function(tog_state,toggled);
    assign toggle_vio = vio_select ? toggle_vio_out : toggle;
    assign pause_vio  = vio_select ? pause_vio_out : pause;
    assign reset_vio =  vio_select ? reset_vio_out : reset; 

// toggle litterally toggles between two states when the button is pushed    
    function fsm_tog_function;
      input tog_state;
      input toggled;
      case (tog_state)
        TOG1 : if (toggled == 1'b1) begin
                 fsm_tog_function = TOG2;
               end else begin
                 fsm_tog_function = TOG1;
               end 
        TOG2 : if (toggled == 1'b1) begin
                 fsm_tog_function = TOG1;
               end else begin
                 fsm_tog_function = TOG2;
               end 
        default: fsm_tog_function = TOG1;
      endcase 
    endfunction
    
// swith between paused (RUN) and running (STOP)  
    function fsm_function;
      input state;
      input paused;
      case (state)
        RUN: if (paused == 1'b1) begin
                fsm_function = STOP;
              end else begin
                fsm_function = RUN;
              end 
        STOP: if (paused == 1'b1) begin
                      fsm_function = RUN;
                    end else begin
                      fsm_function = STOP;
                    end 
        default: fsm_function = RUN;
      endcase
    endfunction
    
// next state of state machines unless reset    
   always @(posedge CLK) 
     begin : FSM_SEQ
       if (reset_vio == 1'b1) begin
         state <= RUN;
         tog_state <= TOG1;
       end else begin
         state <= next_state;
         tog_state <= next_tog_state;
       end
     end 
   
// counter - reset if reset, or figure out count and mult products
   always @(posedge CLK)
     begin : COUNTER
       if (reset_vio == 1'b1) begin
         divClk <= 29'b0;
         count_out_pre <= 3'b0;
         mul_out_pre <= 8'b0;
       end else if(state == RUN) begin
            divClk <= divClk + 1'b1;
            count_out_pre <= divClk[28:25]; 
            mul_out_pre <= mult_out_pre_pre;
//            mul_out_pre <= divClk[28:25] * divClk[28:25]; 
       end 
     end
   
// output to LEDs - if reset, clear LEDS
// if TOG1 display count (4bits)... if TOG2 then display mult (8bits)   
   always @(posedge CLK)
     begin: OUTPUT_LOGIC
     if (reset_vio == 1'b1) begin
        count_out <= 8'b0;
     end 
     else begin
       if (tog_state == TOG1) begin
          count_out <= {4'b0, count_out_pre};
       end else begin
          count_out <= mul_out_pre;
        end 
      end 
    end 
    
// create pulse on paused to switch state.
   always @(posedge CLK)
     begin : PAUSED
       if (reset_vio == 1'b1) begin
         paused <= 1'b0;
         prev_paused <= 1'b0;
       end 
       
       prev_paused <= pause_vio;
       
       if (prev_paused == 1'b1 && pause_vio == 1'b0) begin
         paused <= 1'b1;
       end else
         paused <= 1'b0;
       end
      
// create pulse on toggle to switch state.  
    always @(posedge CLK)
      begin : TOGGLED
        if (reset_vio == 1'b1) begin
          toggled <= 1'b0;
          prev_toggle <= 1'b0;
        end
        
        prev_toggle <= toggle_vio; 
        
        if (prev_toggle == 1'b1 && toggle_vio == 1'b0) begin
          toggled <= 1'b1;
        end else
          toggled <= 1'b0;
        end 
        
endmodule
