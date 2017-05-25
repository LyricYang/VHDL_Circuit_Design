/************************************************************
module name 	: AD80305_CONFIG_PART1
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: Configure Part1

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/
module  AD80305_CONFIG_PART1
(
//* Inputs
Clk,                    		//* 40MHz
Reset,							//* Reset
Config_strat,					//* A high active signal to start the whole operation
Config_done_1byte,              //* A high active signal to indicate 1-byte-configuration data has been send to AD80305 through SPI interface
                                //* Most of the outputs are the inputs of the module "AD80305_SPI_READ_WRITE", and "Config_done_1byte" is the output of module "AD80305_SPI_READ_WRITE"

//* Outputs
Config_en_1byte,
Config_wr_rd_1byte,
Config_addr_1byte,
Config_data_wr_1byte,    
Config_end						//* A high active signal to end the whole operation
);

//* Key Signals Timing
//*
//* Config_en_1byte			_________________|------|_____________________________________________   
//* Config_wr_rd_1byte		__________|--------------------------|________________________________
//* Config_addr_1byte		__________|			 10h028			 |________________________________
//* Config_data_wr_1byte    __________|			 8'h39			 |________________________________    
    
//=============================================================================
//* Inputs and Outputs
//=============================================================================
//* Inputs
input           Clk;
input           Reset; 
input			Config_strat;
input			Config_done_1byte;

//* Outputs
output			Config_en_1byte;
output			Config_wr_rd_1byte;
output	[9:0]	Config_addr_1byte;
output	[7:0]	Config_data_wr_1byte;
output			Config_end;


//=============================================================================
//* Parameters
//=============================================================================
//* FSM Parameters
parameter   [1:0]   IDLE = 2'b00;                                                                   
parameter   [1:0]   CONFIG_DATA = 2'b01;
parameter   [1:0]   WAIT_20MS = 2'b10;
parameter   [1:0]   CONFIG_END = 2'b11;


//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire			Config_en_1byte_tmp;
wire			Done_20ms;

//* Regs
reg				Config_strat_reg1;
reg				Config_strat_reg2;
reg		[1:0]	Current_state;
reg		[1:0]	Next_state;
reg		[1:0]	Current_state_reg;
reg		[6:0]	Cnt_128;
reg		[19:0]	Cnt_20ms;
reg				Config_en_1byte;
reg		[9:0]	Config_addr_1byte;
reg		[7:0]	Config_data_wr_1byte;
reg				Config_end;



//=============================================================================
//* Model Body
//=============================================================================
//* [1]
//* Get a enable signal to start the process of configure
//*
always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
    	Config_strat_reg1 <= 1'b0;
    else
    	Config_strat_reg1 <= Config_strat;
end

always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
    	Config_strat_reg2 <= 1'b0;
    else
    	Config_strat_reg2 <= Config_strat_reg1;
end    		


//* [2]
//* FSM which control and write data to AD80305 or read data from AD80305
//* TX FIR
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
            if ( Config_strat_reg2 == 1'b1 )  
                Next_state = CONFIG_DATA;
            else
                Next_state = IDLE;                   
				
		CONFIG_DATA:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h009 ) ) 
				Next_state = WAIT_20MS;	
			else
				Next_state = CONFIG_DATA; 	
				
		WAIT_20MS:
			if ( Done_20ms == 1'b1 )
				Next_state = CONFIG_END;
			else
				Next_state = WAIT_20MS;					
		
		CONFIG_END:
			if ( Config_strat == 1'b1 )
				Next_state = IDLE; 
			else
				Next_state = CONFIG_END; 	
	endcase
end


//* [3]
//* Some control signals
//* It is indicated from the simulation of "Test4SPI_Write" that, it takes 128 clocks(Clk) 
//* from the start of 1-byte-data SPI transmission to its end,which is indicated by the signal "Congif_done" of module "AD80305_SPI_READ_WRITE".
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_128 <= 7'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) || ( Current_state == WAIT_20MS ) )
		Cnt_128 <= 7'b0;
	else
		Cnt_128 <= Cnt_128 + 7'b01;
end

assign Config_en_1byte_tmp = &Cnt_128;		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_20ms <= 20'b0;
	else if ( Current_state == WAIT_20MS )
		Cnt_20ms <= Cnt_20ms + 20'b01;
	else
		Cnt_20ms <= 20'b0;
end

assign Done_20ms = ( Cnt_20ms >= 20'd614400 ) ? 1'b1 : 1'b0;		
//* assign Done_20ms = ( Cnt_20ms >= 20'd10 ) ? 1'b1 : 1'b0;	// set as 10 just for test
//* [4]
//* Write data to AD80305
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_en_1byte <= 1'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) || ( Current_state == WAIT_20MS ) )
		Config_en_1byte <= 1'b0;	
	else if ( Current_state == CONFIG_DATA ) 
		Config_en_1byte <= Config_en_1byte_tmp;
	else
		Config_en_1byte <= 1'b0;	
end

assign Config_wr_rd_1byte = Config_en_1byte;
		
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) || ( Current_state == WAIT_20MS ) )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == IDLE ) )
		Config_addr_1byte <= 10'h3DF; 
	else if ( ( Current_state == CONFIG_DATA ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h3DF: Config_addr_1byte <= 10'h295;
			10'h295: Config_addr_1byte <= 10'h2A6;
			10'h2A6: Config_addr_1byte <= 10'h2A8;
			10'h2A8: Config_addr_1byte <= 10'h292;
			10'h292: Config_addr_1byte <= 10'h293;
			10'h293: Config_addr_1byte <= 10'h294;
			10'h294: Config_addr_1byte <= 10'h2AB;								
			10'h2AB: Config_addr_1byte <= 10'h2AC;
			10'h2AC: Config_addr_1byte <= 10'h009;			
			default: Config_addr_1byte <= 10'b0;
		endcase
	else
		;
end	
	
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_data_wr_1byte <= 8'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) || ( Current_state == WAIT_20MS ) )	
		Config_data_wr_1byte <= 8'b0;
	else if ( Current_state == CONFIG_DATA )
		case ( Config_addr_1byte )
			10'h3DF: Config_data_wr_1byte <= 8'h01;  // Control Register, Set to 8'h01
			// DCXO Registers 292 Through 299( We use no temperature compensation(Register 296 through 298). )
			// Master Bias and bandgap configuration Registers 2A6 and 2A8
			10'h295: Config_data_wr_1byte <= 8'h14;  // DCXO Config, Set to 8'h14(Default)
			10'h2A6: Config_data_wr_1byte <= 8'h0E;		
		  	10'h2A8: Config_data_wr_1byte <= 8'h0E;
			10'h292: Config_data_wr_1byte <= 8'h08;  // DCXO Coarse Tune
			10'h293: Config_data_wr_1byte <= 8'h80;  // DCXO Fine Tune
			10'h294: Config_data_wr_1byte <= 8'h00;  // DCXO Fine Tune
			// Reference Divider Register 2AB and 2AC		
		  	10'h2AB: Config_data_wr_1byte <= 8'h07;
			10'h2AC: Config_data_wr_1byte <= 8'hFF;  // Tx and Rx Ref Divider set to "11", i.e., Divider Ratio set to 2	
			// Clock Control Registers 009 through 00A
		  	10'h009: Config_data_wr_1byte <= 8'h07;    // Set 8'h07 to choose DCXO, while set 8'h17 to choose External reference Input
		  	// set D0 of 009 to 1 to enable BBPLL; Since 00A is "BBPLL Register", we initialize 00A in CONFIG_PART2_BBPLL.  	
		  	default: Config_data_wr_1byte <= 8'h00;
		endcase
	else
		Config_data_wr_1byte <= 8'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_end <= 1'b0;
	else if ( ( Current_state == CONFIG_END ) && ( Current_state_reg != CONFIG_END ) )
		Config_end <= 1'b1;
	else
		Config_end <= 1'b0;
end

endmodule
