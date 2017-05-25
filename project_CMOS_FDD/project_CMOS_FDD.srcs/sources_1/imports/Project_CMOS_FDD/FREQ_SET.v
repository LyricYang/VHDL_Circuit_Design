/************************************************************
module name     : FREQ_SET
project         : NexysV_Ad9361
version         : 0.1
author          : Sun Cai
called by       : PICO_ICS_FDD
calling         : 
description     : This program is the frequency setting module of AD936x

revision history:
---------------------------------------------------------------
1. 2016-01-25, initial version
---------------------------------------------------------------
*************************************************************/
module FREQ_SET
    (
    input                   Reset,
    input                   Clk,               // 30.72MHZ
    input       [32:0]      Rx_freq,           // 70MHz~3GHz
    input       [32:0]      Tx_freq,           // 70MHz~3GHz
    input                   Config_initial_done,

    output  reg [2 :0]      Rx_VcoDivider,
    output  reg [10:0]      Rx_FreqInteger,
    output  reg [22:0]      Rx_FreqFractional,
    output  reg [2 :0]      Tx_VcoDivider,
    output  reg [10:0]      Tx_FreqInteger,
    output  reg [22:0]      Tx_FreqFractional,
    output  reg             Reconfig_freq
    );

/*****************************************************
			 Variable declaration              
*****************************************************/
reg     [32:0]  Rx_freq_reg;
reg     [32:0]  Tx_freq_reg;
reg             Start_ind;
reg             Start_ind_reg  = 1'b0;
reg             Start_ind_reg1 = 1'b0;
reg     [32:0]  Rx_dividend1;
reg     [32:0]  Tx_dividend1;
reg     [32:0]  Rx_dividend1_sub;
reg     [32:0]  Tx_dividend1_sub;
reg     [10:0]  Rx_sub1_cnt;
reg     [10:0]  Tx_sub1_cnt;
reg     [7:0]   Cnt1;
reg             Frac_ind;
reg     [47:0]  Rx_dividend2;
reg     [47:0]  Tx_dividend2;
reg     [47:0]  Rx_dividend2_sub;
reg     [47:0]  Tx_dividend2_sub;
reg     [22:0]  Rx_sub2_cnt;
reg     [22:0]  Tx_sub2_cnt;
reg             Rx_rounding;
reg             Tx_rounding;
reg             Cal_end = 1'b0;
reg             Cal_end_reg = 1'b0;
/*****************************************************/
/*-------               Main Code            --------*/
/*****************************************************/
// Reference clock(30.72MHz Xtal) --> [Ref divider(x2)] --> F_ref(61.44MHz) --> [PLL(N_integer & N_fractional)] --> F_rfpll --> [VCO devider] --> LO(46.875MHz-6GHz)
// Get the start indication signal once the setted LO(which is the output of VCO divider, labeled here as "Rx_freq" or "Tx_freq") has changed
always @ ( posedge Clk or posedge Reset )
begin
    if( Reset == 1'b1 )
        begin
            Rx_freq_reg <= 33'b0;
            Tx_freq_reg <= 33'b0;
        end
    else
        begin
            Rx_freq_reg <= Rx_freq;
            Tx_freq_reg <= Tx_freq;
        end
end

always @ (posedge Clk)
begin
    if( ( Rx_freq != Rx_freq_reg ) || ( Tx_freq != Tx_freq_reg ) )
        Start_ind <= 1'b1;
    else
        Start_ind <= 1'b0;
end

always @ (posedge Clk)
begin
    Start_ind_reg  <= Start_ind;
    Start_ind_reg1 <= Start_ind_reg;
end

// Look up table for VCO devider according to LO( This table is given by ADI in its UG ) 
always @ (posedge Clk)
begin
    if ( (Rx_freq >= 33'd70000000) && (Rx_freq < 33'd93750000) )            //  70MHz~93.75MHz
        Rx_VcoDivider <= 3'd6;
    else if ( (Rx_freq >= 33'd93750000  ) && (Rx_freq < 33'd187500000  ) )  //  93.75MHz~187.5MHz
        Rx_VcoDivider <= 3'd5;
    else if ( (Rx_freq >= 33'd187500000 ) && (Rx_freq < 33'd375000000  ) )  //  187.5MHz~375MHz
        Rx_VcoDivider <= 3'd4;
    else if ( (Rx_freq >= 33'd375000000 ) && (Rx_freq < 33'd750000000  ) )  //  375MHz~750MHz
        Rx_VcoDivider <= 3'd3;
    else if ( (Rx_freq >= 33'd750000000 ) && (Rx_freq < 33'd1500000000 ) )  //  750MHz~1500MHz
        Rx_VcoDivider <= 3'd2;
    else if ( (Rx_freq >= 33'd1500000000) && (Rx_freq < 33'd3000000000 ) )  //  1500MHz~3000MHz
        Rx_VcoDivider <= 3'd1;
    else if ( (Rx_freq >= 33'd3000000000) && (Rx_freq <= 33'd6000000000) )  //  3000MHz~6000MHz
        Rx_VcoDivider <= 3'd0;
    else                                                                    //  illegal value
        Rx_VcoDivider <= 3'd7;
end

always @ (posedge Clk)
begin
    if ( (Tx_freq >= 33'd70000000) && (Tx_freq < 33'd93750000) )            //  70MHz~93.75MHz
        Tx_VcoDivider <= 3'd6;
    else if ( (Tx_freq >= 33'd93750000  ) && (Tx_freq < 33'd187500000  ) )  //  93.75MHz~187.5MHz
        Tx_VcoDivider <= 3'd5;
    else if ( (Tx_freq >= 33'd187500000 ) && (Tx_freq < 33'd375000000  ) )  //  187.5MHz~375MHz
        Tx_VcoDivider <= 3'd4;
    else if ( (Tx_freq >= 33'd375000000 ) && (Tx_freq < 33'd750000000  ) )  //  375MHz~750MHz
        Tx_VcoDivider <= 3'd3;
    else if ( (Tx_freq >= 33'd750000000 ) && (Tx_freq < 33'd1500000000 ) )  //  750MHz~1500MHz
        Tx_VcoDivider <= 3'd2;
    else if ( (Tx_freq >= 33'd1500000000) && (Tx_freq < 33'd3000000000 ) )  //  1500MHz~3000MHz
        Tx_VcoDivider <= 3'd1;
    else if ( (Tx_freq >= 33'd3000000000) && (Tx_freq <= 33'd6000000000) )  //  3000MHz~6000MHz
        Tx_VcoDivider <= 3'd0;
    else                                                                    //  illegal value
        Tx_VcoDivider <= 3'd7;
end

// Calculate N_integer according to Pll input(F_ref = 61.44MHz) and  Pll output(F_rfpll, which is also the VCO input = LO * 2^( VCO divider + 1 ) )
// Since N_integer = Floor( F_rfpll / F_ref ), N_integer is also right when both F_rfpll and F_ref are divided by 2
// Rx_dividend1 = F_rfpll/2, Rx_sub1_cnt = N_integer
// But the final remain Rx_dividend1_sub is not ( F_rfpll / F_ref  - N_integer ).
// Rx_dividend1_sub = ( F_rfpll / F_ref  - N_integer ) * 30.72MHz, which is actually some form of fix_point of ( F_rfpll / F_ref  - N_integer )
always @ (posedge Clk)
begin
    case(Rx_VcoDivider)
        3'd0   : Rx_dividend1 <= Rx_freq;
        3'd1   : Rx_dividend1 <= {Rx_freq,1'b0};
        3'd2   : Rx_dividend1 <= {Rx_freq,2'b0};
        3'd3   : Rx_dividend1 <= {Rx_freq,3'b0};
        3'd4   : Rx_dividend1 <= {Rx_freq,4'b0};
        3'd5   : Rx_dividend1 <= {Rx_freq,5'b0};
        3'd6   : Rx_dividend1 <= {Rx_freq,6'b0};
        default: Rx_dividend1 <= 33'b0;
    endcase
end

always @ (posedge Clk)
begin
    case(Tx_VcoDivider)
        3'd0   : Tx_dividend1 <= Tx_freq;
        3'd1   : Tx_dividend1 <= {Tx_freq,1'b0};
        3'd2   : Tx_dividend1 <= {Tx_freq,2'b0};
        3'd3   : Tx_dividend1 <= {Tx_freq,3'b0};
        3'd4   : Tx_dividend1 <= {Tx_freq,4'b0};
        3'd5   : Tx_dividend1 <= {Tx_freq,5'b0};
        3'd6   : Tx_dividend1 <= {Tx_freq,6'b0};
        default: Tx_dividend1 <= 33'b0;
    endcase
end

always @ (posedge Clk)
begin
    if( ( Start_ind_reg == 1'b1 ) && ( Start_ind_reg1 == 1'b0 ) )
        begin
            Rx_dividend1_sub <= Rx_dividend1;
            Rx_sub1_cnt      <= 11'b0;
        end
    else if( Rx_dividend1_sub >= 25'd30720000 )
        begin
            Rx_dividend1_sub <= Rx_dividend1_sub - 25'd30720000;
            Rx_sub1_cnt <= Rx_sub1_cnt + 1'b1;
        end
    else
        ;
end

always @ (posedge Clk)
begin
    if( ( Start_ind_reg == 1'b1 ) && ( Start_ind_reg1 == 1'b0 ) )
        begin
            Tx_dividend1_sub <= Tx_dividend1;
            Tx_sub1_cnt      <= 11'b0;
        end
    else if( Tx_dividend1_sub >= 25'd30720000 )
        begin
            Tx_dividend1_sub <= Tx_dividend1_sub - 25'd30720000;
            Tx_sub1_cnt <= Tx_sub1_cnt + 1'b1;
        end
    else
        ;
end
// 6000M/30.72M = 195.3125
always @ (posedge Clk)
begin
    if( ( Start_ind_reg == 1'b1 ) && ( Start_ind_reg1 == 1'b0 ) )
        Cnt1 <= 8'd0;
    else if( Cnt1 < 8'd200 )
        Cnt1 <= Cnt1 + 1'b1;
    else
        ;
end

// Calculate N_fractional
// N_fractional = Round( 8388593 * ( F_rfpll / F_ref  - N_integer ) )
// 8388593 = 2^23 - 2^4 + 1
// Considering of the value of Rx_dividend1_sub, then the value of Rx_dividend2 is [ 8388593 * ( ( F_rfpll / F_ref  - N_integer ) * 30.72M ) ]
// Hence, N_fractional = round( Rx_dividend2 / 30.72M ).
always @ (posedge Clk)
begin
    if( Cnt1 == 8'd199 )
        begin
            Frac_ind       <= 1'b1; // Finish the calculation of N_integer, start the calculation of N_fractinal
            Rx_FreqInteger <= Rx_sub1_cnt;
            Tx_FreqInteger <= Tx_sub1_cnt;
            Rx_dividend2   <= {Rx_dividend1_sub[24:0],23'b0} + Rx_dividend1_sub[24:0] - {Rx_dividend1_sub[24:0],4'b0};
            Tx_dividend2   <= {Tx_dividend1_sub[24:0],23'b0} + Tx_dividend1_sub[24:0] - {Tx_dividend1_sub[24:0],4'b0};
        end
    else
        Frac_ind <= 1'b0;
end

always @ (posedge Clk)
begin
    if( Frac_ind == 1'b1 )
        begin
            Rx_dividend2_sub <= Rx_dividend2;
            Rx_sub2_cnt      <= 23'b0;
            Rx_rounding      <= 1'b1;
        end
    else if( Rx_dividend2_sub >= 25'd30720000 )
        begin
            Rx_dividend2_sub <= Rx_dividend2_sub - 25'd30720000;
            Rx_sub2_cnt      <= Rx_sub2_cnt + 1'b1;
        end
    else if( Rx_dividend2_sub <= 25'd15360000 )
        Rx_rounding <= 1'b0;
    else
        ;
end

always @ (posedge Clk)
begin
    if( Frac_ind == 1'b1 )
        begin
            Tx_dividend2_sub <= Tx_dividend2;
            Tx_sub2_cnt      <= 23'b0;
            Tx_rounding      <= 1'b1;
        end
    else if( Tx_dividend2_sub >= 25'd30720000 )
        begin
            Tx_dividend2_sub <= Tx_dividend2_sub - 25'd30720000;
            Tx_sub2_cnt      <= Tx_sub2_cnt + 1'b1;
        end
    else if( Tx_dividend2_sub <= 25'd15360000 )
        Tx_rounding <= 1'b0;
    else
        ;
end

always @ (posedge Clk)
begin
    if( Frac_ind == 1'b1 )
        Cal_end <= 1'b0;
    else if( ( Rx_dividend2_sub < 25'd30720000 ) && ( Tx_dividend2_sub < 25'd30720000 ) )
        Cal_end <= 1'b1;
    else
        ;
end


always @ (posedge Clk)
begin
    Cal_end_reg <= Cal_end;
end

always @ (posedge Clk)
begin
    if( ( Cal_end == 1'b1 ) && ( Cal_end_reg == 1'b0 ) && ( Rx_VcoDivider != 3'd7 ) && ( Tx_VcoDivider != 3'd7 ) )
        begin
            Reconfig_freq <= Config_initial_done ;
            Rx_FreqFractional <= Rx_sub2_cnt + Rx_rounding;
            Tx_FreqFractional <= Tx_sub2_cnt + Tx_rounding;
        end
    else
        Reconfig_freq <= 1'b0;
end

endmodule