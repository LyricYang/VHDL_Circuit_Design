/************************************************************
module name 	: AD80305_SPI_INTF
project			: AD936x FPGA
version			: 0.1
author			: SunCai
called by		: 
calling			:
description		: Configure the AD80305

revision history:
---------------------------------------------------------------
1. 2016-01-28, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_SPI_INTF
    (
    input               Clk,                    //* 30.72MHz
    input               Reset,					//* Reset
    input               Pll_locked,				//* FPGA PLL is locked or not to control the FSM to initial the registers of AD80305
    input               Reconfig_ad80305,		//* Reconfigure the ad80305 registers, High active pluse 
    input               Reconfig_freq,          //* Reconfigure the ad80305 frequency, High active pluse  
    input               Wr_en_1byte,			//* Enable to write one data to AD80305 when you set from outside 
    input               Rd_en_1byte,			//* Enable to read one data from AD80305 when you set from outside 
                                                //* Be care, when you write AD80305, set the read enable to 0
                                                //* when you read AD80305, set the write enable to 0
    input               Wr_ind_1byte,			//* Indicate to write one data to AD80305 when you set from outside 
    input               Rd_ind_1byte,			//* Indicate to read one data from AD80305 when you set from outside 
    input       [9:0]   Wr_addr_1byte,			//* Send the write address to AD80305 when you set from outside 
    input       [9:0]   Rd_addr_1byte,			//* Send the read address to AD80305 when you set from outside
                                                //* Be care, when you write AD80305, set the read address to 0
                                                //* when you read AD80305, set the write address to 0
    input       [7:0]   Wr_data_1byte,          //* Send the incoming data to AD80305 when you set from outside  
    input               Spi_do_ad80305,			//* Interface to AD80305
    input       [2:0]   RxVCO_divider,
    input       [10:0]  Freq_rx_integer,
    input       [22:0]  Freq_rx_fractional,
    input       [2:0]   TxVCO_divider,
    input       [10:0]  Freq_tx_integer,
    input       [22:0]  Freq_tx_fractional,
    input       [6:0]   Rx_gain_initial,
    input       [8:0]   Tx_gain_initial,
    input       [3:0]   Rx_data_delay,
    input       [3:0]   Tx_data_delay,

    output  reg [7:0]   Rd_data_1byte,			//* Read back one data from AD80305 when you set from outside 
    output  reg         Config_initial_error,	//* The whole initial parameters are transimitted to AD80305 but there are some errors
    output  reg         Config_initial_done,	//* The whole initial configure operation is done
    output  wire        Spi_clk_ad80305,		//* Interface to AD80305
    output  wire        Spi_enb_ad80305,		//* Interface to AD80305
    output  wire        Spi_di_ad80305,			//* Interface to AD80305
	output  reg         Enable_ad80305,
	output  reg         Txnrx_ad80305,
	output  wire        En_agc_ad80305
	
    );

//*
//* Key Signals Timing
//*
//* Rd_wr_en_1byte			_________________|------|_____________________________________________   
//* Rd_wr_ind_1byte			__________|--------------------------|________________________________
//* Rd_wr_addr_1byte		__________|			 10h028			 |________________________________
//* Wr_data_1byte      		__________|			 8'h39			 |________________________________
   


//=============================================================================
//* Parameters
//=============================================================================
//* FSM Parameters
parameter   [5:0]   IDLE = 6'd0;                                                                   
parameter   [5:0]   CONFIG_PART1 = 6'd1;
parameter   [5:0]   CONFIG_PART2_BBPLL = 6'd2;
parameter   [5:0]   CONFIG_PART3_TX_FILTER = 6'd3; 
parameter   [5:0]   CONFIG_PART4_RX_FILTER = 6'd4;
parameter   [5:0]   CONFIG_PART5_PARALLEL_PORT = 6'd5;
parameter   [5:0]   CONFIG_PART6_AUXDAC_AUXADC = 6'd6; 
parameter   [5:0]   CONFIG_PART7_CONTROL_OUT = 6'd7;
parameter   [5:0]   CONFIG_PART8_GPO = 6'd8;
parameter   [5:0]   CONFIG_PART9_ENSM = 6'd9;
parameter   [5:0]   CONFIG_PART10_RFVCO = 6'd10;
parameter   [5:0]   CONFIG_PART11_MIXER_SUBTABLE = 6'd11;
parameter   [5:0]   CONFIG_PART12_RX_GAIN_TABLE = 6'd12;
parameter   [5:0]   CONFIG_PART13_RX_MANUAL_GAIN = 6'd13;
parameter   [5:0]   CONFIG_PART14_RX_BB_FILTER_TUNE = 6'd14;
parameter   [5:0]   CONFIG_PART15_TX_BB_FILTER_TUNE = 6'd15;
parameter   [5:0]   CONFIG_PART16_RX_TIA = 6'd16;
parameter   [5:0]   CONFIG_PART17_TX_2ND_FILTER = 6'd17;
parameter   [5:0]   CONFIG_PART18_ADC_TUNE = 6'd18;
parameter   [5:0]   CONFIG_PART19_TX_QUAD_CAL = 6'd19;
parameter   [5:0]   CONFIG_PART20_TX_ATT = 6'd20;
parameter   [5:0]   CONFIG_PART21_RSSI_POWER_MEASURE = 6'd21;
parameter   [5:0]   CONFIG_PART22_END_ENABLE_RX_TX = 6'd22;

parameter   [5:0]   CONFIG_END = 6'd63; 

 
//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire            Start_config_whole;
wire    [7:0]   Config_data_rd_spi;    
wire            Config_done_spi;
wire            Config_end_part1;
wire            Config_end_part2;
wire            Config_end_part3;
wire            Config_end_part4;
wire            Config_end_part5;
wire            Config_end_part6;
wire            Config_end_part7;
wire            Config_end_part8;
wire            Config_end_part9; 
wire            Config_end_part10;
wire            Config_end_part11;
wire            Config_end_part12;
wire            Config_end_part13;
wire            Config_end_part14;
wire            Config_end_part15;
wire            Config_end_part16;
wire            Config_end_part17;
wire            Config_end_part18;
wire            Config_end_part19; 
wire            Config_end_part20;    
wire            Config_end_part21;
wire            Config_end_part22;
wire            Config_en_1byte_part1;
wire            Config_en_1byte_part2;
wire            Config_en_1byte_part3;
wire            Config_en_1byte_part4;
wire            Config_en_1byte_part5;
wire            Config_en_1byte_part6;
wire            Config_en_1byte_part7;
wire            Config_en_1byte_part8;
wire            Config_en_1byte_part9;
wire            Config_en_1byte_part10;
wire            Config_en_1byte_part11;
wire            Config_en_1byte_part12;
wire            Config_en_1byte_part13;
wire            Config_en_1byte_part14;
wire            Config_en_1byte_part15;
wire            Config_en_1byte_part16;
wire            Config_en_1byte_part17;
wire            Config_en_1byte_part18;
wire            Config_en_1byte_part19;
wire            Config_en_1byte_part20;
wire            Config_en_1byte_part21;
wire            Config_en_1byte_part22;
wire            Config_wr_rd_1byte_part1;
wire            Config_wr_rd_1byte_part2;
wire            Config_wr_rd_1byte_part3;
wire            Config_wr_rd_1byte_part4;
wire            Config_wr_rd_1byte_part5;
wire            Config_wr_rd_1byte_part6;
wire            Config_wr_rd_1byte_part7;
wire            Config_wr_rd_1byte_part8;
wire            Config_wr_rd_1byte_part9;   
wire            Config_wr_rd_1byte_part10;
wire            Config_wr_rd_1byte_part11;
wire            Config_wr_rd_1byte_part12;
wire            Config_wr_rd_1byte_part13;
wire            Config_wr_rd_1byte_part14;
wire            Config_wr_rd_1byte_part15;
wire            Config_wr_rd_1byte_part16;
wire            Config_wr_rd_1byte_part17;
wire            Config_wr_rd_1byte_part18;
wire            Config_wr_rd_1byte_part19;   
wire            Config_wr_rd_1byte_part20;
wire            Config_wr_rd_1byte_part21;
wire            Config_wr_rd_1byte_part22;
wire    [9:0]   Config_addr_1byte_part1;
wire    [9:0]   Config_addr_1byte_part2;
wire    [9:0]   Config_addr_1byte_part3;
wire    [9:0]   Config_addr_1byte_part4;
wire    [9:0]   Config_addr_1byte_part5;
wire    [9:0]   Config_addr_1byte_part6;
wire    [9:0]   Config_addr_1byte_part7;
wire    [9:0]   Config_addr_1byte_part8;
wire    [9:0]   Config_addr_1byte_part9;
wire    [9:0]   Config_addr_1byte_part10;
wire    [9:0]   Config_addr_1byte_part11;
wire    [9:0]   Config_addr_1byte_part12;
wire    [9:0]   Config_addr_1byte_part13;
wire    [9:0]   Config_addr_1byte_part14;
wire    [9:0]   Config_addr_1byte_part15;
wire    [9:0]   Config_addr_1byte_part16;
wire    [9:0]   Config_addr_1byte_part17;
wire    [9:0]   Config_addr_1byte_part18;
wire    [9:0]   Config_addr_1byte_part19;
wire    [9:0]   Config_addr_1byte_part20;
wire    [9:0]   Config_addr_1byte_part21;
wire    [9:0]   Config_addr_1byte_part22;
wire    [7:0]   Config_data_wr_1byte_part1;
wire    [7:0]   Config_data_wr_1byte_part2;
wire    [7:0]   Config_data_wr_1byte_part3;
wire    [7:0]   Config_data_wr_1byte_part4;
wire    [7:0]   Config_data_wr_1byte_part5;
wire    [7:0]   Config_data_wr_1byte_part6;
wire    [7:0]   Config_data_wr_1byte_part7;
wire    [7:0]   Config_data_wr_1byte_part8;
wire    [7:0]   Config_data_wr_1byte_part9;
wire    [7:0]   Config_data_wr_1byte_part10;
wire    [7:0]   Config_data_wr_1byte_part11;
wire    [7:0]   Config_data_wr_1byte_part12;
wire    [7:0]   Config_data_wr_1byte_part13;
wire    [7:0]   Config_data_wr_1byte_part14;
wire    [7:0]   Config_data_wr_1byte_part15;
wire    [7:0]   Config_data_wr_1byte_part16;
wire    [7:0]   Config_data_wr_1byte_part17;
wire    [7:0]   Config_data_wr_1byte_part18;
wire    [7:0]   Config_data_wr_1byte_part19;
wire    [7:0]   Config_data_wr_1byte_part20;
wire    [7:0]   Config_data_wr_1byte_part21;
wire    [7:0]   Config_data_wr_1byte_part22;

//* Regs
reg             Posedge_pll_locked;
reg             Posedge_reconfig_ad80305;
reg     [1:0]   Pll_locked_reg;
reg     [1:0]   Reconfig_ad80305_reg;
reg     [6:0]   Rx_gain_reg;
reg     [8:0]   Tx_gain_reg;
reg             Rx_gain_change;
reg             Tx_gain_change;

reg     [5:0]   Current_state;
reg     [5:0]   Current_state_reg;
reg     [5:0]   Next_state;
reg             Config_start_part1;
reg             Config_start_part2;
reg             Config_start_part3;
reg             Config_start_part4;
reg             Config_start_part5;
reg             Config_start_part6;
reg             Config_start_part7;
reg             Config_start_part8;
reg             Config_start_part9;
reg             Config_start_part10;
reg             Config_start_part11;
reg             Config_start_part12;
reg             Config_start_part13;
reg             Config_start_part14;
reg             Config_start_part15;
reg             Config_start_part16;
reg             Config_start_part17;
reg             Config_start_part18;
reg             Config_start_part19;
reg             Config_start_part20;  
reg             Config_start_part21;
reg             Config_start_part22;
reg             Config_en_spi;
reg             Config_wr_rd_spi;
reg     [9:0]	Config_addr_spi;
reg     [7:0]	Config_data_wr_spi;
reg     [30:0]	Cnt_30s;

reg             Reconfig_freq_reg;
reg             Reconfig_freq_ind;
/*****************************************************/
/*-------               Main Code            --------*/
/*****************************************************/
//* [1]
//* Get a enable signal to start the process of configure
//* 1: After the FPGA PLL is locked; 
//* 2: When we need to reconfigure the AD80305
//* 
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Pll_locked_reg <= 2'b0;
	else
		Pll_locked_reg <= { Pll_locked_reg[0], Pll_locked };
end		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Posedge_pll_locked <= 1'b0;
	else if ( ( Pll_locked_reg[0] == 1'b1 ) && ( Pll_locked_reg[1] == 1'b0 ) ) 	
		Posedge_pll_locked <= 1'b1; 
	else
		Posedge_pll_locked <= 1'b0;
end		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Reconfig_ad80305_reg <= 2'b0;
	else
		Reconfig_ad80305_reg <= { Reconfig_ad80305_reg[0], Reconfig_ad80305 };	
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Posedge_reconfig_ad80305 <= 1'b0;
	else if ( ( Reconfig_ad80305_reg[0] == 1'b1 ) && ( Reconfig_ad80305_reg[1] == 1'b0 ) ) 	
		Posedge_reconfig_ad80305 <= 1'b1; 
	else
		Posedge_reconfig_ad80305 <= 1'b0;
end				

assign Start_config_whole = Posedge_pll_locked | Posedge_reconfig_ad80305; 

always @ ( posedge Clk )
begin
    Rx_gain_reg <= Rx_gain_initial;
    Tx_gain_reg <= Tx_gain_initial;
end

always @ ( posedge Clk )
begin
    if( ( Rx_gain_initial != Rx_gain_reg ) && ( Reconfig_ad80305 == 1'b1 ) )
        Rx_gain_change <= 1'b1;
    else if( Config_end_part13 == 1'b1 )
        Rx_gain_change <= 1'b0;
    else
        ;
end

always @ ( posedge Clk )
begin
    if( ( Tx_gain_initial != Tx_gain_reg ) && ( Reconfig_ad80305 == 1'b1 ) )
        Tx_gain_change <= 1'b1;
    else if( Config_end_part20 == 1'b1 )
        Tx_gain_change <= 1'b0;
    else
        ;
end

//* [2]
//* FSM which control and write data to AD80305
//* Initial configuration
//*		  _______________________________________________________________________
//*		  |														  			    |
//*		  |																		|
//* 	IDLE --> CONFIG_PART1 --> ... --> CONFIG_PART22--> CONFIG_DUMP --> CONFIG_DONE 
//*		             						    |			   |			    |							
//*  	             						    |			   |----------------|
//*		   									    |								|
//*		   										---------------------------------
//*
//*		
always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Current_state <= IDLE;
    else
        Current_state <= Next_state;
end

always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Current_state_reg <= IDLE;
    else
        Current_state_reg <= Current_state;
end 

assign Probe_current_state = Current_state;

always @ ( * )
begin
    Next_state = IDLE; 
    case ( Current_state )
        IDLE:
            if ( Start_config_whole == 1'b1 )  
                Next_state = CONFIG_PART1;
            else if( Reconfig_freq_ind == 1'b1 )
                Next_state = CONFIG_PART10_RFVCO;
            else if( Rx_gain_change == 1'b1 )
                Next_state = CONFIG_PART13_RX_MANUAL_GAIN;
            else if( Tx_gain_change == 1'b1 )
                Next_state = CONFIG_PART20_TX_ATT;
            else
                Next_state = IDLE;
                
        CONFIG_PART1:
        	if ( Config_end_part1 == 1'b1 )  
        		Next_state = CONFIG_PART2_BBPLL; 
        	else
        		Next_state = CONFIG_PART1;     
                
        CONFIG_PART2_BBPLL:
        	if ( Config_end_part2 == 1'b1 )  
        		Next_state = CONFIG_PART3_TX_FILTER; 
        	else
        		Next_state = CONFIG_PART2_BBPLL;   
        		
        CONFIG_PART3_TX_FILTER:
        	if ( Config_end_part3 == 1'b1 )  
        		Next_state = CONFIG_PART4_RX_FILTER; 
        	else
        		Next_state = CONFIG_PART3_TX_FILTER;          		        

        CONFIG_PART4_RX_FILTER:
        	if ( Config_end_part4 == 1'b1 )  
        		Next_state = CONFIG_PART5_PARALLEL_PORT; 
        	else
        		Next_state = CONFIG_PART4_RX_FILTER;  
        		
        CONFIG_PART5_PARALLEL_PORT:
        	if ( Config_end_part5 == 1'b1 )  
        		Next_state = CONFIG_PART6_AUXDAC_AUXADC; 
        	else
        		Next_state = CONFIG_PART5_PARALLEL_PORT;      
        		
        CONFIG_PART6_AUXDAC_AUXADC:
        	if ( Config_end_part6 == 1'b1 )  
        		Next_state = CONFIG_PART7_CONTROL_OUT; 
        	else
        		Next_state = CONFIG_PART6_AUXDAC_AUXADC;   
        		
        CONFIG_PART7_CONTROL_OUT:
        	if ( Config_end_part7 == 1'b1 )  
        		Next_state = CONFIG_PART8_GPO; 
        	else
        		Next_state = CONFIG_PART7_CONTROL_OUT;           		
        		
        CONFIG_PART8_GPO:
        	if ( Config_end_part8 == 1'b1 )  
        		Next_state = CONFIG_PART9_ENSM; 
        	else
        		Next_state = CONFIG_PART8_GPO;   
        
        CONFIG_PART9_ENSM:
        	if ( Config_end_part9 == 1'b1 )  
        		Next_state = CONFIG_PART10_RFVCO; 
        	else
        		Next_state = CONFIG_PART9_ENSM;  
        		
        CONFIG_PART10_RFVCO:     
        	if ( Config_end_part10 == 1'b1 )
        	    begin
                    if( Reconfig_freq_ind == 1'b1 )
                        Next_state = IDLE;
                    else
                        Next_state = CONFIG_PART11_MIXER_SUBTABLE;
                end
        	else
        		Next_state = CONFIG_PART10_RFVCO;
        		
        CONFIG_PART11_MIXER_SUBTABLE:     
        	if ( Config_end_part11 == 1'b1 )  
        		Next_state = CONFIG_PART12_RX_GAIN_TABLE; 
        	else
        		Next_state = CONFIG_PART11_MIXER_SUBTABLE;           		

        CONFIG_PART12_RX_GAIN_TABLE:     
        	if ( Config_end_part12 == 1'b1 )  
        		Next_state = CONFIG_PART13_RX_MANUAL_GAIN; 
        	else
        		Next_state = CONFIG_PART12_RX_GAIN_TABLE;         		

        CONFIG_PART13_RX_MANUAL_GAIN:     
        	if ( Config_end_part13 == 1'b1 )  
                begin
                    if( Rx_gain_change == 1'b1 )
                        Next_state = IDLE;
                    else
                        Next_state = CONFIG_PART14_RX_BB_FILTER_TUNE;
                end
        	else
        		Next_state = CONFIG_PART13_RX_MANUAL_GAIN;         		           

        CONFIG_PART14_RX_BB_FILTER_TUNE:     
        	if ( Config_end_part14 == 1'b1 )  
        		Next_state = CONFIG_PART15_TX_BB_FILTER_TUNE; 
        	else
        		Next_state = CONFIG_PART14_RX_BB_FILTER_TUNE;    

        CONFIG_PART15_TX_BB_FILTER_TUNE:     
        	if ( Config_end_part15 == 1'b1 )  
        		Next_state = CONFIG_PART16_RX_TIA; 
        	else
        		Next_state = CONFIG_PART15_TX_BB_FILTER_TUNE; 

        CONFIG_PART16_RX_TIA:     
        	if ( Config_end_part16 == 1'b1 )  
        		Next_state = CONFIG_PART17_TX_2ND_FILTER; 
        	else
        		Next_state = CONFIG_PART16_RX_TIA; 

        CONFIG_PART17_TX_2ND_FILTER:     
        	if ( Config_end_part17 == 1'b1 )  
        		Next_state = CONFIG_PART18_ADC_TUNE; 
        	else
        		Next_state = CONFIG_PART17_TX_2ND_FILTER; 

        CONFIG_PART18_ADC_TUNE:     
        	if ( Config_end_part18 == 1'b1 )  
        		Next_state = CONFIG_PART19_TX_QUAD_CAL; 
        	else
        		Next_state = CONFIG_PART18_ADC_TUNE; 

        CONFIG_PART19_TX_QUAD_CAL:     
        	if ( Config_end_part19 == 1'b1 )  
        		Next_state = CONFIG_PART20_TX_ATT; 
        	else
        		Next_state = CONFIG_PART19_TX_QUAD_CAL; 

        CONFIG_PART20_TX_ATT:     
        	if ( Config_end_part20 == 1'b1 )
                begin
                    if( Tx_gain_change == 1'b1 )
                        Next_state = IDLE;
                    else
                        Next_state = CONFIG_PART21_RSSI_POWER_MEASURE;
                end
        	else
        		Next_state = CONFIG_PART20_TX_ATT; 

        CONFIG_PART21_RSSI_POWER_MEASURE:     
        	if ( Config_end_part21 == 1'b1 )  
        		Next_state = CONFIG_PART22_END_ENABLE_RX_TX; 
        	else
        		Next_state = CONFIG_PART21_RSSI_POWER_MEASURE; 

        CONFIG_PART22_END_ENABLE_RX_TX:     
        	if ( Config_end_part22 == 1'b1 )  
        		Next_state = CONFIG_END; 
        	else
        		Next_state = CONFIG_PART22_END_ENABLE_RX_TX; 
        		
        CONFIG_END:
        	if ( ( Pll_locked == 1'b0 ) || ( Reconfig_ad80305 == 1'b1 ) )
                Next_state = IDLE;
            else
                Next_state = CONFIG_END;
    endcase                
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part1 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART1 ) && ( Current_state_reg == IDLE ) )
		Config_start_part1 <= 1'b1;
	else
		Config_start_part1 <= 1'b0;
end	

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part2 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART2_BBPLL ) && ( Current_state_reg == CONFIG_PART1 ) )
		Config_start_part2 <= 1'b1;
	else
		Config_start_part2 <= 1'b0;
end		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part3 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART3_TX_FILTER ) && ( Current_state_reg == CONFIG_PART2_BBPLL ) )
		Config_start_part3 <= 1'b1;
	else
		Config_start_part3 <= 1'b0;
end	

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part4 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART4_RX_FILTER ) && ( Current_state_reg == CONFIG_PART3_TX_FILTER ) )
		Config_start_part4 <= 1'b1;
	else
		Config_start_part4 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part5 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART5_PARALLEL_PORT ) && ( Current_state_reg == CONFIG_PART4_RX_FILTER ) )
		Config_start_part5 <= 1'b1;
	else
		Config_start_part5 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part6 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART6_AUXDAC_AUXADC ) && ( Current_state_reg == CONFIG_PART5_PARALLEL_PORT ) )
		Config_start_part6 <= 1'b1;
	else
		Config_start_part6 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part7 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART7_CONTROL_OUT ) && ( Current_state_reg == CONFIG_PART6_AUXDAC_AUXADC ) )
		Config_start_part7 <= 1'b1;
	else
		Config_start_part7 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part8 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART8_GPO ) && ( Current_state_reg == CONFIG_PART7_CONTROL_OUT ) )
		Config_start_part8 <= 1'b1;
	else
		Config_start_part8 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part9 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART9_ENSM ) && ( Current_state_reg == CONFIG_PART8_GPO ) )
		Config_start_part9 <= 1'b1;
	else
		Config_start_part9 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part10 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART10_RFVCO ) && ( Current_state_reg != CONFIG_PART10_RFVCO ) )
		Config_start_part10 <= 1'b1;
	else
		Config_start_part10 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part11 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART11_MIXER_SUBTABLE ) && ( Current_state_reg == CONFIG_PART10_RFVCO ) )
		Config_start_part11 <= 1'b1;
	else
		Config_start_part11 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part12 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART12_RX_GAIN_TABLE ) && ( Current_state_reg == CONFIG_PART11_MIXER_SUBTABLE ) )
		Config_start_part12 <= 1'b1;
	else
		Config_start_part12 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part13 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART13_RX_MANUAL_GAIN ) && ( Current_state_reg != CONFIG_PART13_RX_MANUAL_GAIN ) )
		Config_start_part13 <= 1'b1;
	else
		Config_start_part13 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part14 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART14_RX_BB_FILTER_TUNE ) && ( Current_state_reg == CONFIG_PART13_RX_MANUAL_GAIN ) )
		Config_start_part14 <= 1'b1;
	else
		Config_start_part14 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part15 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART15_TX_BB_FILTER_TUNE ) && ( Current_state_reg == CONFIG_PART14_RX_BB_FILTER_TUNE ) )
		Config_start_part15 <= 1'b1;
	else
		Config_start_part15 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part16 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART16_RX_TIA ) && ( Current_state_reg == CONFIG_PART15_TX_BB_FILTER_TUNE ) )
		Config_start_part16 <= 1'b1;
	else
		Config_start_part16 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part17 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART17_TX_2ND_FILTER ) && ( Current_state_reg == CONFIG_PART16_RX_TIA ) )
		Config_start_part17 <= 1'b1;
	else
		Config_start_part17 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part18 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART18_ADC_TUNE ) && ( Current_state_reg == CONFIG_PART17_TX_2ND_FILTER ) )
		Config_start_part18 <= 1'b1;
	else
		Config_start_part18 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part19 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART19_TX_QUAD_CAL ) && ( Current_state_reg == CONFIG_PART18_ADC_TUNE ) )
		Config_start_part19 <= 1'b1;
	else
		Config_start_part19 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part20 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART20_TX_ATT ) && ( Current_state_reg != CONFIG_PART20_TX_ATT ) )
		Config_start_part20 <= 1'b1;
	else
		Config_start_part20 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part21 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART21_RSSI_POWER_MEASURE ) && ( Current_state_reg == CONFIG_PART20_TX_ATT ) )
		Config_start_part21 <= 1'b1;
	else
		Config_start_part21 <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start_part22 <= 1'b0;
	else if ( ( Current_state == CONFIG_PART22_END_ENABLE_RX_TX ) && ( Current_state_reg == CONFIG_PART21_RSSI_POWER_MEASURE ) )
		Config_start_part22 <= 1'b1;
	else
		Config_start_part22 <= 1'b0;
end

AD80305_CONFIG_PART1	U_AD80305_CONFIG_PART1
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part1 ),					
    .Config_done_1byte		( Config_done_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part1 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part1 ),
    .Config_addr_1byte		( Config_addr_1byte_part1 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part1 ),    
    .Config_end				( Config_end_part1 )					
    );
    
AD80305_CONFIG_PART2_BBPLL		U_AD80305_CONFIG_PART2_BBPLL
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part2 ),					
    .Config_done_1byte		( Config_done_spi ),
    .Config_data_rd_1byte	( Config_data_rd_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part2 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part2 ),
    .Config_addr_1byte		( Config_addr_1byte_part2 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part2 ),    
    .Config_end				( Config_end_part2 )					
    );    

AD80305_CONFIG_PART3_TX_FILTER		U_AD80305_CONFIG_PART3_TX_FILTER
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part3 ),					
    .Config_done_1byte		( Config_done_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part3 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part3 ),
    .Config_addr_1byte		( Config_addr_1byte_part3 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part3 ),    
    .Config_end				( Config_end_part3 )					
    );
    
AD80305_CONFIG_PART4_RX_FILTER		U_AD80305_CONFIG_PART4_RX_FILTER
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part4 ),					
    .Config_done_1byte		( Config_done_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part4 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part4 ),
    .Config_addr_1byte		( Config_addr_1byte_part4 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part4 ),    
    .Config_end				( Config_end_part4 )					
    );  
    
AD80305_CONFIG_PART5_PARALLEL_PORT		U_AD80305_CONFIG_PART5_PARALLEL_PORT
    (
    //input signals
    .Clk                    ( Clk                           ),
    .Reset                  ( Reset                         ),
    .Config_strat           ( Config_start_part5            ),
    .Config_done_1byte      ( Config_done_spi               ),
    .Rx_data_delay          ( Rx_data_delay                 ),
    .Tx_data_delay          ( Tx_data_delay                 ),

    //output signals
    .Config_en_1byte        ( Config_en_1byte_part5         ),
    .Config_wr_rd_1byte     ( Config_wr_rd_1byte_part5      ),
    .Config_addr_1byte      ( Config_addr_1byte_part5       ),
    .Config_data_wr_1byte   ( Config_data_wr_1byte_part5    ),
    .Config_end             ( Config_end_part5              )
    );      

AD80305_CONFIG_PART6_AUXDAC_AUXADC		U_AD80305_CONFIG_PART6_AUXDAC_AUXADC
    (
    //input signals
    .Clk                    ( Clk                           ),
    .Reset                  ( Reset                         ),
    .Config_start           ( Config_start_part6            ),
    .Config_done_1byte      ( Config_done_spi               ),


    //output signals
    .Config_en_1byte        ( Config_en_1byte_part6         ),
    .Config_wr_rd_1byte     ( Config_wr_rd_1byte_part6      ),
    .Config_addr_1byte      ( Config_addr_1byte_part6       ),
    .Config_data_wr_1byte   ( Config_data_wr_1byte_part6    ),
    .Config_end             ( Config_end_part6              )
    );

AD80305_CONFIG_PART7_CONTROL_OUT	U_AD80305_CONFIG_PART7_CONTROL_OUT
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part7 ),					
    .Config_done_1byte		( Config_done_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part7 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part7 ),
    .Config_addr_1byte		( Config_addr_1byte_part7 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part7 ),    
    .Config_end				( Config_end_part7 )					
    );
    
AD80305_CONFIG_PART8_GPO	U_AD80305_CONFIG_PART8_GPO
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part8 ),					
    .Config_done_1byte		( Config_done_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part8 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part8 ),
    .Config_addr_1byte		( Config_addr_1byte_part8 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part8 ),    
    .Config_end				( Config_end_part8 )					
    );    

AD80305_CONFIG_PART9_ENSM		U_AD80305_CONFIG_PART9_ENSM
    (
    //input signals
    .Clk					( Clk                           ),
    .Reset					( Reset                         ),
    .Config_strat			( Config_start_part9            ),
    .Config_done_1byte		( Config_done_spi               ),
    .Config_data_rd_1byte	( Config_data_rd_spi            ),

    //output signals
    .Config_en_1byte		( Config_en_1byte_part9         ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part9      ),
    .Config_addr_1byte		( Config_addr_1byte_part9       ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part9    ),
    .Config_end				( Config_end_part9              )
	);

AD80305_CONFIG_PART10_RFVCO		U_AD80305_CONFIG_PART10_RFVCO
    (
    //input signals
    .Reset					( Reset                 ),
    .Clk					( Clk                   ),
    .Config_strat			( Config_start_part10   ),					
    .Config_done_1byte		( Config_done_spi       ),
    .Config_data_rd_1byte	( Config_data_rd_spi    ),
    .RxVCO_divider          ( RxVCO_divider         ),
    .Freq_rx_integer		( Freq_rx_integer       ),
    .Freq_rx_fractional		( Freq_rx_fractional    ),
    .TxVCO_divider          ( TxVCO_divider         ),
    .Freq_tx_integer		( Freq_tx_integer       ),
    .Freq_tx_fractional		( Freq_tx_fractional    ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part10 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part10 ),
    .Config_addr_1byte		( Config_addr_1byte_part10 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part10 ),    
    .Config_end				( Config_end_part10 )					
    ); 
    
AD80305_CONFIG_PART11_MIXER_SUBTABLE		U_AD80305_CONFIG_PART11_MIXER_SUBTABLE
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part11 ),					
    .Config_done_1byte		( Config_done_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part11 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part11 ),
    .Config_addr_1byte		( Config_addr_1byte_part11 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part11 ),    
    .Config_end				( Config_end_part11 )					
    );     

AD80305_CONFIG_PART12_RX_GAIN_TABLE		U_AD80305_CONFIG_PART12_RX_GAIN_TABLE
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part12 ),					
    .Config_done_1byte		( Config_done_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part12 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part12 ),
    .Config_addr_1byte		( Config_addr_1byte_part12 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part12 ),    
    .Config_end				( Config_end_part12 )					
    );   
    
AD80305_CONFIG_PART13_RX_MANUAL_GAIN		U_AD80305_CONFIG_PART13_RX_MANUAL_GAIN
    (
    //input signals
    .Clk                    ( Clk                           ),
    .Reset                  ( Reset                         ),
    .Config_strat           ( Config_start_part13           ),
    .Config_done_1byte      ( Config_done_spi               ),
    .Rx_gain_initial        ( Rx_gain_initial               ),

    //output signals
    .Config_en_1byte        ( Config_en_1byte_part13        ),
    .Config_wr_rd_1byte     ( Config_wr_rd_1byte_part13     ),
    .Config_addr_1byte      ( Config_addr_1byte_part13      ),
    .Config_data_wr_1byte   ( Config_data_wr_1byte_part13   ),
    .Config_end             ( Config_end_part13             )
    );
    
AD80305_CONFIG_PART14_RX_BB_FILTER_TUNE		U_AD80305_CONFIG_PART14_RX_BB_FILTER_TUNE
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part14 ),					
    .Config_done_1byte		( Config_done_spi ),
    .Config_data_rd_1byte	( Config_data_rd_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part14 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part14 ),
    .Config_addr_1byte		( Config_addr_1byte_part14 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part14 ),    
    .Config_end				( Config_end_part14 )					
    );   
    
AD80305_CONFIG_PART15_TX_BB_FILTER_TUNE		U_AD80305_CONFIG_PART15_TX_BB_FILTER_TUNE
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part15 ),					
    .Config_done_1byte		( Config_done_spi ),
    .Config_data_rd_1byte	( Config_data_rd_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part15 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part15 ),
    .Config_addr_1byte		( Config_addr_1byte_part15 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part15 ),    
    .Config_end				( Config_end_part15 )					
    );           
    
AD80305_CONFIG_PART16_RX_TIA		U_AD80305_CONFIG_PART16_RX_TIA
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part16 ),					
    .Config_done_1byte		( Config_done_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part16 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part16 ),
    .Config_addr_1byte		( Config_addr_1byte_part16 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part16 ),    
    .Config_end				( Config_end_part16 )					
    );   
    
AD80305_CONFIG_PART17_TX_2ND_FILTER		U_AD80305_CONFIG_PART17_TX_2ND_FILTER
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part17 ),					
    .Config_done_1byte		( Config_done_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part17 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part17 ),
    .Config_addr_1byte		( Config_addr_1byte_part17 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part17 ),    
    .Config_end				( Config_end_part17 )					
    );                   
          
AD80305_CONFIG_PART18_ADC_TUNE		U_AD80305_CONFIG_PART18_ADC_TUNE
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part18 ),					
    .Config_done_1byte		( Config_done_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part18 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part18 ),
    .Config_addr_1byte		( Config_addr_1byte_part18 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part18 ),    
    .Config_end				( Config_end_part18 )					
    );           
          
AD80305_CONFIG_PART19_TX_QUAD_CAL		U_AD80305_CONFIG_PART19_TX_QUAD_CAL
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part19 ),					
    .Config_done_1byte		( Config_done_spi ),
    .Config_data_rd_1byte	( Config_data_rd_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part19 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part19 ),
    .Config_addr_1byte		( Config_addr_1byte_part19 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part19 ),    
    .Config_end				( Config_end_part19 )					
    );   
    
AD80305_CONFIG_PART20_TX_ATT		U_AD80305_CONFIG_PART20_TX_ATT
    (
    //input signals
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part20 ),					
    .Config_done_1byte		( Config_done_spi ),
    .Tx_gain_initial		( Tx_gain_initial ),

    //output signals
    .Config_en_1byte		( Config_en_1byte_part20 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part20 ),
    .Config_addr_1byte		( Config_addr_1byte_part20 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part20 ),    
    .Config_end				( Config_end_part20 )					
    );             
    
AD80305_CONFIG_PART21_RSSI_POWER_MEASURE		U_AD80305_CONFIG_PART21_RSSI_POWER_MEASURE
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part21 ),					
    .Config_done_1byte		( Config_done_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part21 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part21 ),
    .Config_addr_1byte		( Config_addr_1byte_part21 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part21 ),    
    .Config_end				( Config_end_part21 )					
    ); 
    
AD80305_CONFIG_PART22_END_ENABLE_RX_TX		U_AD80305_CONFIG_PART22_END_ENABLE_RX_TX
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start_part22 ),					
    .Config_done_1byte		( Config_done_spi ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte_part22 ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte_part22 ),
    .Config_addr_1byte		( Config_addr_1byte_part22 ),
    .Config_data_wr_1byte	( Config_data_wr_1byte_part22 ),    
    .Config_end				( Config_end_part22 )					
    );      

//* [3]
//* Module "AD80305_SPI_READ_WRITE" Interface signals
//* 1: Initial configuration
//* 2: Configuration parameters from outside
//* 
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_en_spi <= 1'b0;
	else
		case ( Current_state )
			IDLE: 							  Config_en_spi <= Wr_en_1byte | Rd_en_1byte;
			CONFIG_PART1: 					  Config_en_spi <= Config_en_1byte_part1;                 
			CONFIG_PART2_BBPLL: 			  Config_en_spi <= Config_en_1byte_part2;           
			CONFIG_PART3_TX_FILTER: 		  Config_en_spi <= Config_en_1byte_part3;         
			CONFIG_PART4_RX_FILTER: 		  Config_en_spi <= Config_en_1byte_part4;        
			CONFIG_PART5_PARALLEL_PORT: 	  Config_en_spi <= Config_en_1byte_part5;     
			CONFIG_PART6_AUXDAC_AUXADC: 	  Config_en_spi <= Config_en_1byte_part6;     
			CONFIG_PART7_CONTROL_OUT: 		  Config_en_spi <= Config_en_1byte_part7;       
			CONFIG_PART8_GPO: 				  Config_en_spi <= Config_en_1byte_part8;             
			CONFIG_PART9_ENSM:				  Config_en_spi <= Config_en_1byte_part9;  
			CONFIG_PART10_RFVCO:			  Config_en_spi <= Config_en_1byte_part10;       
			CONFIG_PART11_MIXER_SUBTABLE:     Config_en_spi <= Config_en_1byte_part11;  
			CONFIG_PART12_RX_GAIN_TABLE:      Config_en_spi <= Config_en_1byte_part12;  
			CONFIG_PART13_RX_MANUAL_GAIN:     Config_en_spi <= Config_en_1byte_part13;  
			CONFIG_PART14_RX_BB_FILTER_TUNE:  Config_en_spi <= Config_en_1byte_part14;    
			CONFIG_PART15_TX_BB_FILTER_TUNE:  Config_en_spi <= Config_en_1byte_part15;    
			CONFIG_PART16_RX_TIA:             Config_en_spi <= Config_en_1byte_part16;  
			CONFIG_PART17_TX_2ND_FILTER:      Config_en_spi <= Config_en_1byte_part17;  
			CONFIG_PART18_ADC_TUNE:           Config_en_spi <= Config_en_1byte_part18;  
			CONFIG_PART19_TX_QUAD_CAL:        Config_en_spi <= Config_en_1byte_part19;  
			CONFIG_PART20_TX_ATT:             Config_en_spi <= Config_en_1byte_part20; 
			CONFIG_PART21_RSSI_POWER_MEASURE: Config_en_spi <= Config_en_1byte_part21;    
			CONFIG_PART22_END_ENABLE_RX_TX:   Config_en_spi <= Config_en_1byte_part22; 
			                             
			CONFIG_END: 					  Config_en_spi <= 1'b0;
			default: Config_en_spi <= 1'b0;   
		endcase					
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_wr_rd_spi <= 1'b0;
	else 
		case ( Current_state )
			IDLE: 							  Config_wr_rd_spi <= Wr_ind_1byte | Rd_ind_1byte;
			CONFIG_PART1: 					  Config_wr_rd_spi <= Config_wr_rd_1byte_part1;                 
			CONFIG_PART2_BBPLL: 			  Config_wr_rd_spi <= Config_wr_rd_1byte_part2;           
			CONFIG_PART3_TX_FILTER: 		  Config_wr_rd_spi <= Config_wr_rd_1byte_part3;         
			CONFIG_PART4_RX_FILTER: 		  Config_wr_rd_spi <= Config_wr_rd_1byte_part4;        
			CONFIG_PART5_PARALLEL_PORT: 	  Config_wr_rd_spi <= Config_wr_rd_1byte_part5;     
			CONFIG_PART6_AUXDAC_AUXADC: 	  Config_wr_rd_spi <= Config_wr_rd_1byte_part6;     
			CONFIG_PART7_CONTROL_OUT: 		  Config_wr_rd_spi <= Config_wr_rd_1byte_part7;       
			CONFIG_PART8_GPO: 				  Config_wr_rd_spi <= Config_wr_rd_1byte_part8;             
			CONFIG_PART9_ENSM:				  Config_wr_rd_spi <= Config_wr_rd_1byte_part9;  
			CONFIG_PART10_RFVCO:			  Config_wr_rd_spi <= Config_wr_rd_1byte_part10;       
			CONFIG_PART11_MIXER_SUBTABLE:     Config_wr_rd_spi <= Config_wr_rd_1byte_part11;  
			CONFIG_PART12_RX_GAIN_TABLE:      Config_wr_rd_spi <= Config_wr_rd_1byte_part12;  
			CONFIG_PART13_RX_MANUAL_GAIN:     Config_wr_rd_spi <= Config_wr_rd_1byte_part13;  
			CONFIG_PART14_RX_BB_FILTER_TUNE:  Config_wr_rd_spi <= Config_wr_rd_1byte_part14;    
			CONFIG_PART15_TX_BB_FILTER_TUNE:  Config_wr_rd_spi <= Config_wr_rd_1byte_part15;    
			CONFIG_PART16_RX_TIA:             Config_wr_rd_spi <= Config_wr_rd_1byte_part16;  
			CONFIG_PART17_TX_2ND_FILTER:      Config_wr_rd_spi <= Config_wr_rd_1byte_part17;  
			CONFIG_PART18_ADC_TUNE:           Config_wr_rd_spi <= Config_wr_rd_1byte_part18;  
			CONFIG_PART19_TX_QUAD_CAL:        Config_wr_rd_spi <= Config_wr_rd_1byte_part19;  
			CONFIG_PART20_TX_ATT:             Config_wr_rd_spi <= Config_wr_rd_1byte_part20; 
			CONFIG_PART21_RSSI_POWER_MEASURE: Config_wr_rd_spi <= Config_wr_rd_1byte_part21;    
			CONFIG_PART22_END_ENABLE_RX_TX:   Config_wr_rd_spi <= Config_wr_rd_1byte_part22; 
					                        
			CONFIG_END: 					  Config_wr_rd_spi <= 1'b0;
			default: Config_wr_rd_spi <= 1'b0;   
		endcase
end		                
			
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_addr_spi <= 10'b0;
	else 
		case ( Current_state )
			IDLE: 							  Config_addr_spi <= Wr_addr_1byte | Rd_addr_1byte;
			CONFIG_PART1: 					  Config_addr_spi <= Config_addr_1byte_part1;                 
			CONFIG_PART2_BBPLL: 			  Config_addr_spi <= Config_addr_1byte_part2;           
			CONFIG_PART3_TX_FILTER: 		  Config_addr_spi <= Config_addr_1byte_part3;         
			CONFIG_PART4_RX_FILTER: 		  Config_addr_spi <= Config_addr_1byte_part4;        
			CONFIG_PART5_PARALLEL_PORT: 	  Config_addr_spi <= Config_addr_1byte_part5;     
			CONFIG_PART6_AUXDAC_AUXADC: 	  Config_addr_spi <= Config_addr_1byte_part6;     
			CONFIG_PART7_CONTROL_OUT: 		  Config_addr_spi <= Config_addr_1byte_part7;       
			CONFIG_PART8_GPO: 				  Config_addr_spi <= Config_addr_1byte_part8;             
			CONFIG_PART9_ENSM:				  Config_addr_spi <= Config_addr_1byte_part9;  
			CONFIG_PART10_RFVCO:			  Config_addr_spi <= Config_addr_1byte_part10;       
			CONFIG_PART11_MIXER_SUBTABLE:     Config_addr_spi <= Config_addr_1byte_part11;  
			CONFIG_PART12_RX_GAIN_TABLE:      Config_addr_spi <= Config_addr_1byte_part12;  
			CONFIG_PART13_RX_MANUAL_GAIN:     Config_addr_spi <= Config_addr_1byte_part13;  
			CONFIG_PART14_RX_BB_FILTER_TUNE:  Config_addr_spi <= Config_addr_1byte_part14;    
			CONFIG_PART15_TX_BB_FILTER_TUNE:  Config_addr_spi <= Config_addr_1byte_part15;    
			CONFIG_PART16_RX_TIA:             Config_addr_spi <= Config_addr_1byte_part16;  
			CONFIG_PART17_TX_2ND_FILTER:      Config_addr_spi <= Config_addr_1byte_part17;  
			CONFIG_PART18_ADC_TUNE:           Config_addr_spi <= Config_addr_1byte_part18;  
			CONFIG_PART19_TX_QUAD_CAL:        Config_addr_spi <= Config_addr_1byte_part19;  
			CONFIG_PART20_TX_ATT:             Config_addr_spi <= Config_addr_1byte_part20; 
			CONFIG_PART21_RSSI_POWER_MEASURE: Config_addr_spi <= Config_addr_1byte_part21;    
			CONFIG_PART22_END_ENABLE_RX_TX:   Config_addr_spi <= Config_addr_1byte_part22;			
			                                              
			CONFIG_END: 					  Config_addr_spi <= 10'b0;
			default: Config_addr_spi <= 1'b0;   
		endcase
end	

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_data_wr_spi <= 1'b0;
	else 
		case ( Current_state )
			IDLE: 							  Config_data_wr_spi <= Wr_data_1byte;    			
			CONFIG_PART1: 					  Config_data_wr_spi <= Config_data_wr_1byte_part1;                 
			CONFIG_PART2_BBPLL: 			  Config_data_wr_spi <= Config_data_wr_1byte_part2;           
			CONFIG_PART3_TX_FILTER: 		  Config_data_wr_spi <= Config_data_wr_1byte_part3;         
			CONFIG_PART4_RX_FILTER: 		  Config_data_wr_spi <= Config_data_wr_1byte_part4;        
			CONFIG_PART5_PARALLEL_PORT: 	  Config_data_wr_spi <= Config_data_wr_1byte_part5;     
			CONFIG_PART6_AUXDAC_AUXADC: 	  Config_data_wr_spi <= Config_data_wr_1byte_part6;     
			CONFIG_PART7_CONTROL_OUT: 		  Config_data_wr_spi <= Config_data_wr_1byte_part7;       
			CONFIG_PART8_GPO: 				  Config_data_wr_spi <= Config_data_wr_1byte_part8;             
			CONFIG_PART9_ENSM:				  Config_data_wr_spi <= Config_data_wr_1byte_part9;  
			CONFIG_PART10_RFVCO:			  Config_data_wr_spi <= Config_data_wr_1byte_part10;       
			CONFIG_PART11_MIXER_SUBTABLE:     Config_data_wr_spi <= Config_data_wr_1byte_part11;  
			CONFIG_PART12_RX_GAIN_TABLE:      Config_data_wr_spi <= Config_data_wr_1byte_part12;  
			CONFIG_PART13_RX_MANUAL_GAIN:     Config_data_wr_spi <= Config_data_wr_1byte_part13;  
			CONFIG_PART14_RX_BB_FILTER_TUNE:  Config_data_wr_spi <= Config_data_wr_1byte_part14;    
			CONFIG_PART15_TX_BB_FILTER_TUNE:  Config_data_wr_spi <= Config_data_wr_1byte_part15;    
			CONFIG_PART16_RX_TIA:             Config_data_wr_spi <= Config_data_wr_1byte_part16;  
			CONFIG_PART17_TX_2ND_FILTER:      Config_data_wr_spi <= Config_data_wr_1byte_part17;  
			CONFIG_PART18_ADC_TUNE:           Config_data_wr_spi <= Config_data_wr_1byte_part18;  
			CONFIG_PART19_TX_QUAD_CAL:        Config_data_wr_spi <= Config_data_wr_1byte_part19;  
			CONFIG_PART20_TX_ATT:             Config_data_wr_spi <= Config_data_wr_1byte_part20; 
			CONFIG_PART21_RSSI_POWER_MEASURE: Config_data_wr_spi <= Config_data_wr_1byte_part21;    
			CONFIG_PART22_END_ENABLE_RX_TX:   Config_data_wr_spi <= Config_data_wr_1byte_part22; 			
			                                              
			CONFIG_END: 					  Config_data_wr_spi <= 8'b0;
			default: Config_data_wr_spi <= 1'b0;   
		endcase
end	

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Rd_data_1byte <= 8'b0;
	else if ( Current_state == IDLE ) 
		Rd_data_1byte <= Config_data_rd_spi;
	else
		Rd_data_1byte <= 8'b0;
end			
	
		
//* [4]
//* Wirte or Read operation of SPI Interface
//*
AD80305_SPI_READ_WRITE		U1_AD80305_SPI_READ_WRITE
    (
    //* Inputs
    .Clk				( Clk ),
    .Reset				( Reset ),
    .Config_en			( Config_en_spi ),			
    .Config_wr_rd		( Config_wr_rd_spi ),		
    .Config_addr		( Config_addr_spi ),		
    .Config_data_wr		( Config_data_wr_spi ),		
    .Spi_do				( Spi_do_ad80305 ),
    
    //* Outputs
    .Config_data_rd		( Config_data_rd_spi ),		
    .Config_done		( Config_done_spi ),
    .Spi_enb			( Spi_enb_ad80305 ),
    .Spi_clk			( Spi_clk_ad80305 ),
    .Spi_di 			( Spi_di_ad80305 )
    );  


//* [5]
//* The initial operation is right or not
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_30s <= 30'b0;
    else if (  Current_state == IDLE  )
        Cnt_30s <= 30'b0;
	else
		Cnt_30s <= Cnt_30s + 1'b1;
end

always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Config_initial_error <= 1'b0;
    else if ( Start_config_whole == 1'b1 )
        Config_initial_error <= 1'b0;
    else if ( Cnt_30s >= 30'd921600000 )
        Config_initial_error <= 1'b1;
    else
        ;
end

//* [6]
//* All the initial registers have been transmitted to AD80305 with the right way
//* The initial operation is done
//*
always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Config_initial_done <= 1'b0;
	else if ( Start_config_whole == 1'b1 ) 
		Config_initial_done <= 1'b0;        
    else if ( Current_state == CONFIG_END ) 
        Config_initial_done <= 1'b1;
    else
        ;
end  


//* [7]
//* ENSM Control
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Enable_ad80305 <= 1'b0;
	else if ( Start_config_whole == 1'b1 )
		Enable_ad80305 <= 1'b0;
	else if ( Current_state == CONFIG_END )
		Enable_ad80305 <= 1'b1;
	else
		;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Txnrx_ad80305 <= 1'b0;
	else if ( Start_config_whole == 1'b1 )
		Txnrx_ad80305 <= 1'b0;
	else if ( Current_state == CONFIG_END )
		Txnrx_ad80305 <= 1'b1;
	else
		;
end

assign En_agc_ad80305 = 1'b0;

always @ ( posedge Clk )
begin
    Reconfig_freq_reg <= Reconfig_freq;
end

always @ ( posedge Clk )
begin
    if( ( Reconfig_freq == 1'b1 ) && ( Reconfig_freq_reg == 1'b0 ) && ( Reconfig_ad80305 == 1'b1 ) )
        Reconfig_freq_ind <= 1'b1;
    else if( Config_end_part10 == 1'b1 )
        Reconfig_freq_ind <= 1'b0;
    else
        ;
end

endmodule
