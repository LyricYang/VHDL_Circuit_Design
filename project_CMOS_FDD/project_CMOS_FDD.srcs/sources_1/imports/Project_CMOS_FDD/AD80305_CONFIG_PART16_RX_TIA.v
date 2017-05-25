/************************************************************
module name 	: AD80305_CONFIG_PART16_RX_TIA
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: RX TIA Setup:  Setup values scale based on RxBBF calibration
                : results.  See information in Calibration Guide. 

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_CONFIG_PART16_RX_TIA
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
parameter   [1:0]   CONFIG_DATA_PART1 = 2'b01; 
parameter   [1:0]   CONFIG_DATA_PART2 = 2'b10;   
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
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h1E6 ) ) 
				Next_state = CONFIG_DATA_PART2;	
			else
				Next_state = CONFIG_DATA_PART1; 						
				
		CONFIG_DATA_PART2:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h1DE ) ) 
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
	else if ( ( Current_state == CONFIG_DATA_PART1 ) || ( Current_state == CONFIG_DATA_PART2 ) ) 
		Config_en_1byte <= Config_en_1byte_tmp;
	else
		Config_en_1byte <= 1'b0;	
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_wr_rd_1byte <= 1'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) )
		Config_wr_rd_1byte <= 1'b0;	
	else if ( Current_state == CONFIG_DATA_PART1 )
		Config_wr_rd_1byte <= 1'b0;			
	else if ( Current_state == CONFIG_DATA_PART2 )
		Config_wr_rd_1byte <= Config_en_1byte_tmp;
	else
		Config_wr_rd_1byte <= 1'b0;	
end
	
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == CONFIG_DATA_PART1 ) && ( Current_state_reg == IDLE ) )
		Config_addr_1byte <= 10'h1EB; 
	else if ( ( Current_state == CONFIG_DATA_PART2 ) && ( Current_state_reg == CONFIG_DATA_PART1 ) )
		Config_addr_1byte <= 10'h1DB; 		
	else if ( ( Current_state == CONFIG_DATA_PART1 ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h1EB: Config_addr_1byte <= 10'h1EC;
			10'h1EC: Config_addr_1byte <= 10'h1E6;
			default: Config_addr_1byte <= 10'h1EB;
		endcase
	else if ( ( Current_state == CONFIG_DATA_PART2 ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h1DB: Config_addr_1byte <= 10'h1DD;
			10'h1DD: Config_addr_1byte <= 10'h1DF;
			10'h1DF: Config_addr_1byte <= 10'h1DC;
			10'h1DC: Config_addr_1byte <= 10'h1DE;			
			default: Config_addr_1byte <= 10'h1DB; 
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
	else if ( Current_state == CONFIG_DATA_PART1 )
		case ( Config_addr_1byte )
			10'h1EB: Config_data_wr_1byte <= 8'h00;			// Read RXBBF C3(MSB)  		
			10'h1EC: Config_data_wr_1byte <= 8'h00;         // Read RXBBF C3(LSB)  
			10'h1E6: Config_data_wr_1byte <= 8'h00;			// Read RXBBF R2346     
			default: Config_data_wr_1byte <= 8'h00;			
		endcase		
	else if ( Current_state == CONFIG_DATA_PART2 )
		case ( Config_addr_1byte )
			10'h1DB: Config_data_wr_1byte <= 8'h60;			// Set TIA selcc[2:0]      			
			10'h1DD: Config_data_wr_1byte <= 8'h00;         // Set RX TIA1 C MSB[6:0]  
			10'h1DF: Config_data_wr_1byte <= 8'h00;			// Set RX TIA2 C MSB[6:0]  
			10'h1DC: Config_data_wr_1byte <= 8'h69;         // Set RX TIA1 C LSB[5:0]  
			10'h1DE: Config_data_wr_1byte <= 8'h69;         // Set RX TIA2 C LSB[5:0]  
			default: Config_data_wr_1byte <= 8'h60;			
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