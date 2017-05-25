/************************************************************
module name 	: AD80305_SPI_INTF
project			: AD936x FPGA
version			: 0.1
author			: Suncai
called by		: 
calling			:
description		: Configure the AD80305

revision history:
---------------------------------------------------------------
1. 2016-01-28, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_SPI_INTF_TestVersion
(
input               Clk,                    //* 40MHz
input               Reset,					//* Reset
input               Pll_locked,				//* FPGA PLL is locked or not to control the FSM to initial the registers of AD80305
input               Reconfig_ad80305,		//* Reconfigure the ad80305 registers, High active pluse 
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

output  reg [7:0]   Rd_data_1byte,			//* Read back one data from AD80305 when you set from outside 
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
parameter   [5:0]   CONFIG_END = 6'd63; 

 
//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire            Start_config_whole;
wire    [7:0]   Config_data_rd_spi;    
wire            Config_done_spi;
wire            Config_end_part1;
wire            Config_en_1byte_part1;
wire            Config_wr_rd_1byte_part1;
wire    [9:0]   Config_addr_1byte_part1;
wire    [7:0]   Config_data_wr_1byte_part1;

//* Regs
reg             Posedge_pll_locked;
reg             Posedge_reconfig_ad80305;
reg     [1:0]   Pll_locked_reg;
reg     [1:0]   Reconfig_ad80305_reg;

reg     [5:0]   Current_state;
reg     [5:0]   Current_state_reg;
reg     [5:0]   Next_state;
reg             Config_start_part1;

reg             Config_en_spi;
reg             Config_wr_rd_spi;
reg     [9:0]	Config_addr_spi;
reg     [7:0]	Config_data_wr_spi;

/*****************************************************/
/*-------               Main Code            --------*/
/*****************************************************/
//* [1]
//* Get a enable signal to start the process of configure
//* 1: After the FPGA PLL is locked 
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

//* [2]
//* FSM which control and write data to AD80305
//* Initial configuration
//*		  ___________________________
//*		  |							|
//*		  |							|
//* 	IDLE --> CONFIG_PART1 --> CONFIG_DONE 
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

always @ ( * )
begin
    Next_state = IDLE; 
    case ( Current_state )
        IDLE:
            if ( Start_config_whole == 1'b1 )  
                Next_state = CONFIG_PART1;
            else
                Next_state = IDLE;
                
        CONFIG_PART1:
        	if ( Config_end_part1 == 1'b1 )  
        		Next_state = CONFIG_END; 
        	else
        		Next_state = CONFIG_PART1;     
        		
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
			CONFIG_END: 					  Config_en_spi <= 1'b0;
			default:                          Config_en_spi <= 1'b0;   
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
			CONFIG_END: 					  Config_wr_rd_spi <= 1'b0;
			default:                          Config_wr_rd_spi <= 1'b0;   
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
			CONFIG_END: 					  Config_addr_spi <= 10'b0;
			default:                          Config_addr_spi <= 1'b0;   
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
			CONFIG_END: 					  Config_data_wr_spi <= 8'b0;
			default:                          Config_data_wr_spi <= 1'b0;   
		endcase
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

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Rd_data_1byte <= 8'b0;
	else if ( Current_state == IDLE ) 
		Rd_data_1byte <= Config_data_rd_spi;
	else
		Rd_data_1byte <= 8'b0;
end	

//* [5]
//* The initial operation is right or not
//*

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

endmodule
