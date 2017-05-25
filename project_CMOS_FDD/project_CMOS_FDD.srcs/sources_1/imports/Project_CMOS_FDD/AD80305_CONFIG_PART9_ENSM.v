/************************************************************
module name 	: AD80305_CONFIG_PART9_ENSM
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: Configure the AD80305 ENSM and VCO,This program is compatiable to all ADI AD936x chips

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/
module  AD80305_CONFIG_PART9_ENSM
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
    Config_end,						//* A high active signal to end the whole operation
    Probe_Current_state
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
output  [3:0]   Probe_Current_state;

//=============================================================================
//* Parameters
//=============================================================================
//* FSM Parameters
parameter   [3:0]   IDLE = 4'b0000;                                                                   
parameter   [3:0]   CONFIG_DATA = 4'b0001;
parameter   [3:0]   WAIT_1MS = 4'b0010;
parameter	[3:0]	CONFIG_0X23D = 4'b0011;  
parameter   [3:0]   WAIT_100MS_1 = 4'b0100; 
parameter	[3:0]	CONFIG_0X244 = 4'b0101;    
parameter	[3:0]	CONFIG_0X27D = 4'b0110;  
parameter   [3:0]   WAIT_100MS_2 = 4'b0111;  
parameter	[3:0]	CONFIG_0X284 = 4'b1000;   
parameter   [3:0]   CONFIG_END = 4'b1001;


//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire			Config_en_1byte_tmp;
wire			Done_1ms;   
wire			Done_100ms_1;
wire			Done_100ms_2;

//* Regs
reg				Config_strat_reg1;
reg				Config_strat_reg2;
reg		[3:0]	Current_state;
reg		[3:0]	Next_state;
reg		[3:0]	Current_state_reg;
reg		[6:0]	Cnt_128;
reg		[15:0]	Cnt_1ms;
reg		[21:0]	Cnt_100ms_1;
reg		[21:0]	Cnt_100ms_2;
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

assign  Probe_Current_state = Current_state;

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
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h013 ) ) 
				Next_state = WAIT_1MS;	
			else
				Next_state = CONFIG_DATA; 	
				
		WAIT_1MS:
			if ( Done_1ms == 1'b1 )
				Next_state = CONFIG_0X23D;
			else
				Next_state = WAIT_1MS;	
				
		CONFIG_0X23D:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h23D ) ) 
				Next_state = WAIT_100MS_1;	
			else
				Next_state = CONFIG_0X23D; 	
				
		WAIT_100MS_1:
			if ( Done_100ms_1 == 1'b1 )
				Next_state = CONFIG_0X244;
			else
				Next_state = WAIT_100MS_1;	
		
		CONFIG_0X244:
			if ( ( Config_data_rd_1byte[7] == 1'b1 ) && ( Config_done_1byte == 1'b1 ) )	
				Next_state = CONFIG_0X27D;
			else if ( ( Config_data_rd_1byte[7] == 1'b0 ) && ( Config_done_1byte == 1'b1 ) )	
				Next_state = CONFIG_0X23D;				
			else
				Next_state = CONFIG_0X244;		
											
		CONFIG_0X27D:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h27D ) ) 
				Next_state = WAIT_100MS_2;	
			else
				Next_state = CONFIG_0X27D; 	
				
		WAIT_100MS_2:
			if ( Done_100ms_2 == 1'b1 )
				Next_state = CONFIG_0X284;
			else
				Next_state = WAIT_100MS_2;	
		
		CONFIG_0X284:
			if ( ( Config_data_rd_1byte[7] == 1'b1 ) && ( Config_done_1byte == 1'b1 ) )	
				Next_state = CONFIG_END;
			else if ( ( Config_data_rd_1byte[7] == 1'b0 ) && ( Config_done_1byte == 1'b1 ) )	
				Next_state = CONFIG_0X27D;				
			else
				Next_state = CONFIG_0X284;					
																 								
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
			|| ( Current_state == WAIT_1MS ) || ( Current_state == WAIT_100MS_1 ) || ( Current_state == WAIT_100MS_2 ) )
		Cnt_128 <= 7'b0;
	else
		Cnt_128 <= Cnt_128 + 7'b01;
end

assign Config_en_1byte_tmp = &Cnt_128;		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_1ms <= 16'b0;
	else if ( Current_state == WAIT_1MS )
		Cnt_1ms <= Cnt_1ms + 16'b01;
	else
		Cnt_1ms <= 16'b0;
end

assign Done_1ms = ( Cnt_1ms >= 16'd30720 ) ? 1'b1 : 1'b0;		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_100ms_1 <= 22'b0;
	else if ( Current_state == WAIT_100MS_1 )
		Cnt_100ms_1 <= Cnt_100ms_1 + 22'b01;
	else
		Cnt_100ms_1 <= 22'b0;
end

assign Done_100ms_1 = ( Cnt_100ms_1 >= 22'd3072000 ) ? 1'b1 : 1'b0;		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_100ms_2 <= 22'b0;
	else if ( Current_state == WAIT_100MS_2 )
		Cnt_100ms_2 <= Cnt_100ms_2 + 22'b01;
	else
		Cnt_100ms_2 <= 22'b0;
end

assign Done_100ms_2 = ( Cnt_100ms_2 >= 22'd3072000 ) ? 1'b1 : 1'b0;		


//* [4]
//* Write data to AD80305
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_en_1byte <= 1'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) 
			|| ( Current_state == WAIT_1MS ) || ( Current_state == WAIT_100MS_1 ) || ( Current_state == WAIT_100MS_2 ) )
		Config_en_1byte <= 1'b0;	
	else if ( ( Current_state == CONFIG_DATA ) 
			|| ( Current_state == CONFIG_0X23D ) || ( Current_state == CONFIG_0X244 ) 
			|| ( Current_state == CONFIG_0X27D ) || ( Current_state == CONFIG_0X284 ) ) 
		Config_en_1byte <= Config_en_1byte_tmp;
	else
		Config_en_1byte <= 1'b0;	
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_wr_rd_1byte <= 1'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) 
			|| ( Current_state == WAIT_1MS ) || ( Current_state == WAIT_100MS_1 ) || ( Current_state == WAIT_100MS_2 ) )
		Config_wr_rd_1byte <= 1'b0;	
	else if ( ( Current_state == CONFIG_DATA ) || ( Current_state == CONFIG_0X23D ) || ( Current_state == CONFIG_0X27D ) ) 
		Config_wr_rd_1byte <= Config_en_1byte_tmp;
	else if ( ( Current_state == CONFIG_0X244 ) || ( Current_state == CONFIG_0X284 ) )
		Config_wr_rd_1byte <= 1'b0;	 
	else
		Config_wr_rd_1byte <= 1'b0;	
end
	
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) 
			|| ( Current_state == WAIT_1MS ) || ( Current_state == WAIT_100MS_1 ) || ( Current_state == WAIT_100MS_2 ) )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == IDLE ) )
		Config_addr_1byte <= 10'h261; 
	else if ( ( Current_state == CONFIG_DATA ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h261: Config_addr_1byte <= 10'h2A1;
			10'h2A1: Config_addr_1byte <= 10'h248;
			10'h248: Config_addr_1byte <= 10'h288;
			10'h288: Config_addr_1byte <= 10'h246;
			10'h246: Config_addr_1byte <= 10'h286;
			10'h286: Config_addr_1byte <= 10'h249;
			10'h249: Config_addr_1byte <= 10'h289;								
			10'h289: Config_addr_1byte <= 10'h23B;
			10'h23B: Config_addr_1byte <= 10'h27B;	
			10'h27B: Config_addr_1byte <= 10'h243;  		
			10'h243: Config_addr_1byte <= 10'h283;	
			10'h283: Config_addr_1byte <= 10'h23D;	
			10'h23D: Config_addr_1byte <= 10'h27D;	
			10'h27D: Config_addr_1byte <= 10'h015;	
			10'h015: Config_addr_1byte <= 10'h014;
			10'h014: Config_addr_1byte <= 10'h013;
			default: Config_addr_1byte <= 10'h261;
		endcase
	else if ( Current_state == CONFIG_0X23D ) 
		Config_addr_1byte <= 10'h23D;	
	else if ( Current_state == CONFIG_0X244 ) 
		Config_addr_1byte <= 10'h244;	
	else if ( Current_state == CONFIG_0X27D ) 
		Config_addr_1byte <= 10'h27D;	
	else if ( Current_state == CONFIG_0X284 ) 
		Config_addr_1byte <= 10'h284;					
	else
		;
end	
	
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_data_wr_1byte <= 8'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) 
			|| ( Current_state == WAIT_1MS ) || ( Current_state == WAIT_100MS_1 ) || ( Current_state == WAIT_100MS_2 ) )
		Config_data_wr_1byte <= 8'b0;
	else if ( Current_state == CONFIG_DATA )
		case ( Config_addr_1byte )
			10'h261: Config_data_wr_1byte <= 8'h00;
			10'h2A1: Config_data_wr_1byte <= 8'h00;
			10'h248: Config_data_wr_1byte <= 8'h0B;
			10'h288: Config_data_wr_1byte <= 8'h0B;
			10'h246: Config_data_wr_1byte <= 8'h02;
			10'h286: Config_data_wr_1byte <= 8'h02;
			10'h249: Config_data_wr_1byte <= 8'h8E;								
			10'h289: Config_data_wr_1byte <= 8'h8E;
			10'h23B: Config_data_wr_1byte <= 8'h80;	
			10'h27B: Config_data_wr_1byte <= 8'h80;  		
			10'h243: Config_data_wr_1byte <= 8'h0D;	
			10'h283: Config_data_wr_1byte <= 8'h0D;	
			10'h23D: Config_data_wr_1byte <= 8'h00;	
			10'h27D: Config_data_wr_1byte <= 8'h00;	
			10'h015: Config_data_wr_1byte <= 8'h0C;
			10'h014: Config_data_wr_1byte <= 8'h1D;
			10'h013: Config_data_wr_1byte <= 8'h01;		  	
		  	default: Config_data_wr_1byte <= 8'h00;		  	
		endcase
	else if ( Current_state == CONFIG_0X23D ) 
		Config_data_wr_1byte <= 8'h04;	
	else if ( Current_state == CONFIG_0X244 ) 
		Config_data_wr_1byte <= 8'h00;	
	else if ( Current_state == CONFIG_0X27D ) 
		Config_data_wr_1byte <= 8'h04;	
	else if ( Current_state == CONFIG_0X284 ) 
		Config_data_wr_1byte <= 8'h00;	
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