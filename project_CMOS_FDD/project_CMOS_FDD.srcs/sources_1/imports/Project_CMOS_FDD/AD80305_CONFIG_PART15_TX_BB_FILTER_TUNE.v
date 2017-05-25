/************************************************************
module name 	: AD80305_CONFIG_PART15_TX_BB_FILTER_TUNE
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: TX Baseband Filter Tuning (Real BW: 9.000000 MHz) 3dB Filter, Corner @ 14.400000 MHz)

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_CONFIG_PART15_TX_BB_FILTER_TUNE
    (
    //* Inputs
    Clk,                    		//* 30.72MHz
    Reset,							//* Reset
    Config_strat,					//* A high active signal to start the whole operation
    Config_done_1byte,
	Config_data_rd_1byte,
    
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
input	[7:0]	Config_data_rd_1byte;

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
parameter   [2:0]   IDLE = 3'b000;                                                                   
parameter   [2:0]   CONFIG_DATA_PART1 = 3'b001;
parameter   [2:0]   WAIT_2S = 3'b010;
parameter	[2:0]	CHECK_LOCK = 3'b011;  
parameter   [2:0]   CONFIG_DATA_PART2 = 3'b100;   
parameter   [2:0]   CONFIG_END = 3'b101;


//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire			Config_en_1byte_tmp;
wire			Done_2s;

//* Regs
reg				Config_strat_reg1;
reg				Config_strat_reg2;
reg		[2:0]	Current_state;
reg		[2:0]	Next_state;
reg		[2:0]	Current_state_reg;
reg		[6:0]	Cnt_128;
reg		[25:0]	Cnt_2s;
reg				Config_en_1byte;
reg				Config_wr_rd_1byte;
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
                Next_state = CONFIG_DATA_PART1;
            else
                Next_state = IDLE;                   
				
		CONFIG_DATA_PART1:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h016 ) ) 
				Next_state = WAIT_2S;	
			else
				Next_state = CONFIG_DATA_PART1; 	
				
		WAIT_2S:
			if ( Done_2s == 1'b1 )
				Next_state = CHECK_LOCK;
			else
				Next_state = WAIT_2S;	
				
		CHECK_LOCK:
			if ( ( Config_data_rd_1byte[6] == 1'b0 ) && ( Config_done_1byte == 1'b1 ) )		//* Done when 0x016[6]==0
				Next_state = CONFIG_DATA_PART2; 
			else if ( ( Config_data_rd_1byte[6] == 1'b1 ) && ( Config_done_1byte == 1'b1 ) )
				Next_state = CONFIG_DATA_PART1;
			else
				Next_state = CHECK_LOCK;		
				
		CONFIG_DATA_PART2:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h0CA ) ) 
				Next_state = CONFIG_END;	
			else
				Next_state = CONFIG_DATA_PART2; 				 						
		
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
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) || ( Current_state == WAIT_2S ) )
		Cnt_128 <= 7'b0;
	else
		Cnt_128 <= Cnt_128 + 7'b01;
end

assign Config_en_1byte_tmp = &Cnt_128;		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_2s <= 26'b0;
	else if ( Current_state == WAIT_2S )
		Cnt_2s <= Cnt_2s + 26'b01;
	else
		Cnt_2s <= 26'b0;
end

assign Done_2s = ( Cnt_2s >= 26'd61440000 ) ? 1'b1 : 1'b0;		


//* [4]
//* Write data to AD80305
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_en_1byte <= 1'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) || ( Current_state == WAIT_2S ) )
		Config_en_1byte <= 1'b0;	
	else if ( ( Current_state == CONFIG_DATA_PART1 )|| ( Current_state == CHECK_LOCK ) || ( Current_state == CONFIG_DATA_PART2 ) ) 
		Config_en_1byte <= Config_en_1byte_tmp;
	else
		Config_en_1byte <= 1'b0;	
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_wr_rd_1byte <= 1'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) || ( Current_state == WAIT_2S ) )
		Config_wr_rd_1byte <= 1'b0;	
	else if ( ( Current_state == CONFIG_DATA_PART1 ) || ( Current_state == CONFIG_DATA_PART2 ) ) 
		Config_wr_rd_1byte <= Config_en_1byte_tmp;
	else if ( Current_state == CHECK_LOCK )
		Config_wr_rd_1byte <= 1'b0;	 
	else
		Config_wr_rd_1byte <= 1'b0;	
end
	
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) || ( Current_state == WAIT_2S ) )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == CONFIG_DATA_PART1 ) && ( ( Current_state_reg == IDLE ) || ( Current_state_reg == CHECK_LOCK ) ) )
		Config_addr_1byte <= 10'h0D6; 
	else if ( ( Current_state == CONFIG_DATA_PART1 ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h0D6: Config_addr_1byte <= 10'h0D7;
			10'h0D7: Config_addr_1byte <= 10'h0CA;
			10'h0CA: Config_addr_1byte <= 10'h016;
			default: Config_addr_1byte <= 10'h0D6;
		endcase
	else if ( Current_state == CHECK_LOCK ) 
		Config_addr_1byte <= 10'h016;	
	else if ( Current_state == CONFIG_DATA_PART2 )
		Config_addr_1byte <= 10'h0CA; 
	else
		;
end	
	
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_data_wr_1byte <= 8'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) || ( Current_state == WAIT_2S ) )	
		Config_data_wr_1byte <= 8'b0;
	else if ( Current_state == CONFIG_DATA_PART1 )
		case ( Config_addr_1byte )
			10'h0D6: Config_data_wr_1byte <= 8'h08; 	// TX BBF Tune Divier[7:0]    
			10'h0D7: Config_data_wr_1byte <= 8'h1E;     // TX BBF Tune Divider[8]     
			10'h0CA: Config_data_wr_1byte <= 8'h22;		// Enable Tx Filter Tuner 		
			10'h016: Config_data_wr_1byte <= 8'h40;		// Start Tx Filter Tune   					  	
		  	default: Config_data_wr_1byte <= 8'h08;		  	
		endcase
	else if ( Current_state == CHECK_LOCK )
		Config_data_wr_1byte <= 8'b0;					// Wait for TX filter to tune, Max Cal Time: 2.889 us (Done when 0x016[6]==0) 
	else if ( Current_state == CONFIG_DATA_PART2 )
		Config_data_wr_1byte <= 8'h26;					// Disable Tx Filter Tuner (Both Channels)
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