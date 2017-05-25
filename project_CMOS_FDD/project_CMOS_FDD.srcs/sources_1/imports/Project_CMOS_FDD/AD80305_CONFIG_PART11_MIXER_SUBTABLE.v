/************************************************************
module name 	: AD80305_CONFIG_PART11_MIXER_SUBTABLE
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: Program Mixer GM Sub-table

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_CONFIG_PART11_MIXER_SUBTABLE
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
parameter   [2:0]   IDLE = 3'b000;                                                                   
parameter   [2:0]   ENABLE_CLK = 3'b001;
parameter   [2:0]   CONFIG_DATA = 3'b010;
parameter   [2:0]   WAIT_2US = 3'b011;    
parameter   [2:0]   CLEAR_WRITE = 3'b100;  
parameter   [2:0]   WAIT_2US_2 = 3'b101;
parameter   [2:0]   DISABLE_CLK = 3'b110;  
parameter   [2:0]   CONFIG_END = 3'b111;


//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire			Config_en_1byte_tmp;
wire			Done_2us;
wire			Done_2us_2;

//* Regs
reg				Config_strat_reg1;
reg				Config_strat_reg2;
reg		[2:0]	Current_state;
reg		[2:0]	Next_state;
reg		[2:0]	Current_state_reg;
reg		[6:0]	Cnt_128;
reg		[7:0]	Cnt_2us;
reg		[7:0]	Cnt_2us_2;
reg				Config_en_1byte;
reg		[9:0]	Config_addr_1byte;
reg		[7:0]	Config_data_wr_1byte;
reg				Config_end;   
reg		[3:0]	Addr_index;  
reg		[7:0]	Config_gain;
reg		[7:0]	Config_gm;
reg		[7:0]	Config_bias;


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
                Next_state = ENABLE_CLK;
            else
                Next_state = IDLE;   
                
		ENABLE_CLK:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h13F ) ) 
				Next_state = CONFIG_DATA;
			else
				Next_state = ENABLE_CLK; 
				
		CONFIG_DATA:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h13F ) ) 
				Next_state = WAIT_2US;	
			else
				Next_state = CONFIG_DATA; 				
				
		WAIT_2US:
			if ( ( Done_2us == 1'b1 ) && ( Addr_index == 4'h0 ) )	
				Next_state = CLEAR_WRITE;
			else if ( ( Done_2us == 1'b1 ) && ( Addr_index > 4'h0 ) )
				Next_state = CONFIG_DATA;	
			else
				Next_state = WAIT_2US;
				
		CLEAR_WRITE:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h13F ) ) 
				Next_state = WAIT_2US_2;
			else
				Next_state = CLEAR_WRITE; 
				
		WAIT_2US_2:
			if ( Done_2us_2 == 1'b1 ) 
				Next_state = DISABLE_CLK;
			else
				Next_state = WAIT_2US_2;				
								
		DISABLE_CLK:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h13F ) ) 
				Next_state = CONFIG_END;
			else
				Next_state = DISABLE_CLK; 		
		
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
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) 
			|| ( Current_state == WAIT_2US ) || ( Current_state == WAIT_2US_2 ) )
		Cnt_128 <= 7'b0;
	else
		Cnt_128 <= Cnt_128 + 7'b01;
end

assign Config_en_1byte_tmp = &Cnt_128;		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_2us <= 8'b0;
	else if ( Current_state == WAIT_2US )
		Cnt_2us <= Cnt_2us + 8'b01;
	else
		Cnt_2us <= 8'b0;
end

assign Done_2us = ( Cnt_2us == 8'hFF ) ? 1'b1 : 1'b0;		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_2us_2 <= 8'b0;
	else if ( Current_state == WAIT_2US_2 )
		Cnt_2us_2 <= Cnt_2us_2 + 8'b01;
	else
		Cnt_2us_2 <= 8'b0;
end

assign Done_2us_2 = ( Cnt_2us_2 == 8'hFF ) ? 1'b1 : 1'b0;	


always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Addr_index <= 4'hF;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) )
		Addr_index <= 4'hF;
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == WAIT_2US ) )	
		Addr_index <= Addr_index - 4'b01;
	else
		;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_gain <= 8'b0;
	else
		case ( Addr_index )
			4'hF: Config_gain <= 8'h78;	
			4'hE: Config_gain <= 8'h74; 
			4'hD: Config_gain <= 8'h70; 
			4'hC: Config_gain <= 8'h6C; 
			4'hB: Config_gain <= 8'h68; 
			4'hA: Config_gain <= 8'h64; 
			4'h9: Config_gain <= 8'h60; 
			4'h8: Config_gain <= 8'h5C; 
			4'h7: Config_gain <= 8'h58; 
			4'h6: Config_gain <= 8'h54; 
			4'h5: Config_gain <= 8'h50; 
			4'h4: Config_gain <= 8'h4C; 
			4'h3: Config_gain <= 8'h48; 
			4'h2: Config_gain <= 8'h30; 
			4'h1: Config_gain <= 8'h18; 
			4'h0: Config_gain <= 8'h00; 
		endcase
end		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_gm <= 8'b0;
	else
		case ( Addr_index )
			4'hF: Config_gm <= 8'h00;	
			4'hE: Config_gm <= 8'h0D;   
			4'hD: Config_gm <= 8'h15;   
			4'hC: Config_gm <= 8'h1B;   
			4'hB: Config_gm <= 8'h21;   
			4'hA: Config_gm <= 8'h25;   
			4'h9: Config_gm <= 8'h29;   
			4'h8: Config_gm <= 8'h2C;   
			4'h7: Config_gm <= 8'h2F;   
			4'h6: Config_gm <= 8'h31;   
			4'h5: Config_gm <= 8'h33;   
			4'h4: Config_gm <= 8'h34;   
			4'h3: Config_gm <= 8'h35;   
			4'h2: Config_gm <= 8'h3A;   
			4'h1: Config_gm <= 8'h3D;   
			4'h0: Config_gm <= 8'h3E;   
		endcase
end		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_bias <= 8'b0;
	else
		case ( Addr_index )
			4'hF: Config_bias <= 8'h00;
			4'hE: Config_bias <= 8'h00;
			4'hD: Config_bias <= 8'h00;
			4'hC: Config_bias <= 8'h00;
			4'hB: Config_bias <= 8'h00;
			4'hA: Config_bias <= 8'h00;
			4'h9: Config_bias <= 8'h00;
			4'h8: Config_bias <= 8'h00;
			4'h7: Config_bias <= 8'h00;
			4'h6: Config_bias <= 8'h00;
			4'h5: Config_bias <= 8'h00;
			4'h4: Config_bias <= 8'h00;
			4'h3: Config_bias <= 8'h00;
			4'h2: Config_bias <= 8'h00;
			4'h1: Config_bias <= 8'h00;
			4'h0: Config_bias <= 8'h00;
		endcase
end						


//* [4]
//* Write data to AD80305
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_en_1byte <= 1'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) 
			|| ( Current_state == WAIT_2US ) || ( Current_state == WAIT_2US_2 ) )
		Config_en_1byte <= 1'b0;	
	else if ( ( Current_state == ENABLE_CLK ) || ( Current_state == CONFIG_DATA ) || ( Current_state == CLEAR_WRITE ) || ( Current_state == DISABLE_CLK ) )	
		Config_en_1byte <= Config_en_1byte_tmp;
	else
		Config_en_1byte <= 1'b0;	
end

assign Config_wr_rd_1byte = Config_en_1byte;
		
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) 
			|| ( Current_state == WAIT_2US ) || ( Current_state == WAIT_2US_2 ) )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == ENABLE_CLK ) || ( Current_state == CLEAR_WRITE ) || ( Current_state == DISABLE_CLK ) )	 
		Config_addr_1byte <= 10'h13F;
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == ENABLE_CLK ) )
		Config_addr_1byte <= 10'h138; 
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == WAIT_2US ) )
		Config_addr_1byte <= 10'h138; 
	else if ( ( Current_state == CONFIG_DATA ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h138: Config_addr_1byte <= 10'h139;
			10'h139: Config_addr_1byte <= 10'h13A;
			10'h13A: Config_addr_1byte <= 10'h13B;
			10'h13B: Config_addr_1byte <= 10'h13F;
			default: Config_addr_1byte <= 10'h138;
		endcase
	else
		;
end	
	
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_data_wr_1byte <= 8'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) 
			|| ( Current_state == WAIT_2US ) || ( Current_state == WAIT_2US_2 ) )
		Config_data_wr_1byte <= 8'b0;
	else if ( Current_state == ENABLE_CLK )
		Config_data_wr_1byte <= 8'h02;
	else if ( Current_state == CLEAR_WRITE )
		Config_data_wr_1byte <= 8'h02;		
	else if ( Current_state == DISABLE_CLK )
		Config_data_wr_1byte <= 8'h00;
	else if ( Current_state == CONFIG_DATA )
		case ( Config_addr_1byte )
			10'h138: Config_data_wr_1byte <= Addr_index;
			10'h139: Config_data_wr_1byte <= Config_gain;
			10'h13A: Config_data_wr_1byte <= Config_bias;			
		  	10'h13B: Config_data_wr_1byte <= Config_gm;
		  	10'h13F: Config_data_wr_1byte <= 8'h06;
		  	default: Config_data_wr_1byte <= 8'h0F;
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