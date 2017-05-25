/************************************************************
module name 	: PICO_ICS_FDD
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: Setup GPO,This program is compatiable to all ADI AD936x chips

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_CONFIG_PART8_GPO
    (
    //* Inputs
    Clk,                    		//* 30.72MHz
    Reset,							//* Reset
    Config_strat,					//* A high active signal to start the whole operation
    Config_done_1byte,
    
    //* Outputs
    Config_en_1byte,
    Config_wr_rd_1byte,
    Config_addr_1byte,
    Config_data_wr_1byte,    
    Config_end						//* A high active signal to end the whole operation
    );
    
    
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
parameter   [1:0]   CONFIG_END = 2'b11;


//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire			Config_en_1byte_tmp;

//* Regs
reg				Config_strat_reg1;
reg				Config_strat_reg2;
reg		[1:0]	Current_state;
reg		[1:0]	Next_state;
reg		[1:0]	Current_state_reg;
reg		[6:0]	Cnt_128;
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
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h02F ) ) 
				Next_state = CONFIG_END;	
			else
				Next_state = CONFIG_DATA; 									
		
		CONFIG_END:
			if ( Config_strat == 1'b1 )
				Next_state = IDLE; 
			else
				Next_state = CONFIG_END; 	
	endcase
end


//* [3]
//* Some control signals
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_128 <= 7'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) )
		Cnt_128 <= 7'b0;
	else
		Cnt_128 <= Cnt_128 + 7'b01;
end

assign Config_en_1byte_tmp = &Cnt_128;			


//* [4]
//* Write data to AD80305
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_en_1byte <= 1'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) )
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
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == IDLE ) )
		Config_addr_1byte <= 10'h03A; 
	else if ( ( Current_state == CONFIG_DATA ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h03A: Config_addr_1byte <= 10'h020;
			10'h020: Config_addr_1byte <= 10'h027;
			10'h027: Config_addr_1byte <= 10'h028;
			10'h028: Config_addr_1byte <= 10'h029;		
			10'h029: Config_addr_1byte <= 10'h02A;
			10'h02A: Config_addr_1byte <= 10'h02B;
			10'h02B: Config_addr_1byte <= 10'h02C;
			10'h02C: Config_addr_1byte <= 10'h02D;	
			10'h02D: Config_addr_1byte <= 10'h02E;
			10'h02E: Config_addr_1byte <= 10'h02F;						
			default: Config_addr_1byte <= 10'h03A;
		endcase
	else
		;
end	
	
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_data_wr_1byte <= 8'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) )	
		Config_data_wr_1byte <= 8'b0;
	else if ( Current_state == CONFIG_DATA )
		case ( Config_addr_1byte )
			10'h03A: Config_data_wr_1byte <= 8'h1E;
			10'h020: Config_data_wr_1byte <= 8'h00;
			10'h027: Config_data_wr_1byte <= 8'h03;		
		  	10'h028: Config_data_wr_1byte <= 8'h00;
			10'h029: Config_data_wr_1byte <= 8'h00;		
			10'h02A: Config_data_wr_1byte <= 8'h00;
			10'h02B: Config_data_wr_1byte <= 8'h00;
			10'h02C: Config_data_wr_1byte <= 8'h00;		
		  	10'h02D: Config_data_wr_1byte <= 8'h00;
			10'h02E: Config_data_wr_1byte <= 8'h00;	
			10'h02F: Config_data_wr_1byte <= 8'h00;					  	
		  	default: Config_data_wr_1byte <= 8'h1E;
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