/************************************************************
module name 	: AD80305_CONFIG_PART12_RX_GAIN_TABLE
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: Program Rx Gain Tables with GainTable2300MHz.csv

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_CONFIG_PART12_RX_GAIN_TABLE
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
reg		[6:0]	Addr_index;  
reg		[7:0]	Word_1;
reg		[7:0]	Word_2;
reg		[7:0]	Word_3;


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
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h137 ) ) 
				Next_state = CONFIG_DATA;
			else
				Next_state = ENABLE_CLK; 
				
		CONFIG_DATA:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h137 ) ) 
				Next_state = WAIT_2US;	
			else
				Next_state = CONFIG_DATA; 				
				
		WAIT_2US:
			if ( ( Done_2us == 1'b1 ) && ( Addr_index == 7'h5A ) )	
				Next_state = CLEAR_WRITE;
			else if ( ( Done_2us == 1'b1 ) && ( Addr_index < 7'h5A ) )
				Next_state = CONFIG_DATA;	
			else
				Next_state = WAIT_2US;
				
		CLEAR_WRITE:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h137 ) ) 
				Next_state = WAIT_2US_2;
			else
				Next_state = CLEAR_WRITE; 
				
		WAIT_2US_2:
			if ( Done_2us_2 == 1'b1 ) 
				Next_state = DISABLE_CLK;
			else
				Next_state = WAIT_2US_2;				
								
		DISABLE_CLK:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h137 ) ) 
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
		Addr_index <= 7'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) )
		Addr_index <= 7'b0;
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == WAIT_2US ) )	
		Addr_index <= Addr_index + 7'b01;
	else
		;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Word_1 <= 8'b0;
	else
		case ( Addr_index )
			7'd0 : Word_1 <= 8'h0;
			7'd1 : Word_1 <= 8'h0;
			7'd2 : Word_1 <= 8'h0;
			7'd3 : Word_1 <= 8'h0;
			7'd4 : Word_1 <= 8'h0;
			7'd5 : Word_1 <= 8'h0;
			7'd6 : Word_1 <= 8'h0;
			7'd7 : Word_1 <= 8'h0;
			7'd8 : Word_1 <= 8'h1;
			7'd9 : Word_1 <= 8'h1;
			7'd10: Word_1 <= 8'h1;
			7'd11: Word_1 <= 8'h1;
			7'd12: Word_1 <= 8'h1;
			7'd13: Word_1 <= 8'h1;
			7'd14: Word_1 <= 8'h1;
			7'd15: Word_1 <= 8'h1;
			7'd16: Word_1 <= 8'h1;
			7'd17: Word_1 <= 8'h1;
			7'd18: Word_1 <= 8'h1;
			7'd19: Word_1 <= 8'h1;
			7'd20: Word_1 <= 8'h2;
			7'd21: Word_1 <= 8'h2;
			7'd22: Word_1 <= 8'h2;
			7'd23: Word_1 <= 8'h2;
			7'd24: Word_1 <= 8'h2;
			7'd25: Word_1 <= 8'h2;
			7'd26: Word_1 <= 8'h2;
			7'd27: Word_1 <= 8'h2;
			7'd28: Word_1 <= 8'h2;
			7'd29: Word_1 <= 8'h2;
			7'd30: Word_1 <= 8'h4;
			7'd31: Word_1 <= 8'h4;
			7'd32: Word_1 <= 8'h4;
			7'd33: Word_1 <= 8'h4;
			7'd34: Word_1 <= 8'h24;
			7'd35: Word_1 <= 8'h24;
			7'd36: Word_1 <= 8'h44;
			7'd37: Word_1 <= 8'h44;
			7'd38: Word_1 <= 8'h44;
			7'd39: Word_1 <= 8'h44;
			7'd40: Word_1 <= 8'h44;
			7'd41: Word_1 <= 8'h44;
			7'd42: Word_1 <= 8'h44;
			7'd43: Word_1 <= 8'h44;
			7'd44: Word_1 <= 8'h44;
			7'd45: Word_1 <= 8'h44;
			7'd46: Word_1 <= 8'h44;
			7'd47: Word_1 <= 8'h44;
			7'd48: Word_1 <= 8'h44;
			7'd49: Word_1 <= 8'h44;
			7'd50: Word_1 <= 8'h44;
			7'd51: Word_1 <= 8'h44;
			7'd52: Word_1 <= 8'h44;
			7'd53: Word_1 <= 8'h44;
			7'd54: Word_1 <= 8'h44;
			7'd55: Word_1 <= 8'h64;
			7'd56: Word_1 <= 8'h64;
			7'd57: Word_1 <= 8'h64;
			7'd58: Word_1 <= 8'h64;
			7'd59: Word_1 <= 8'h64;
			7'd60: Word_1 <= 8'h64;
			7'd61: Word_1 <= 8'h64;
			7'd62: Word_1 <= 8'h64;
			7'd63: Word_1 <= 8'h64;
			7'd64: Word_1 <= 8'h64;
			7'd65: Word_1 <= 8'h64;
			7'd66: Word_1 <= 8'h65;
			7'd67: Word_1 <= 8'h66;
			7'd68: Word_1 <= 8'h67;
			7'd69: Word_1 <= 8'h68;
			7'd70: Word_1 <= 8'h69;
			7'd71: Word_1 <= 8'h6A;
			7'd72: Word_1 <= 8'h6B;
			7'd73: Word_1 <= 8'h6C;
			7'd74: Word_1 <= 8'h6D;
			7'd75: Word_1 <= 8'h6E;
			7'd76: Word_1 <= 8'h6F;
			default: Word_1 <= 8'b0;
		endcase
end		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Word_2 <= 8'b0;
	else
		case ( Addr_index )
			7'd0 : Word_2 <= 8'h0; 
			7'd1 : Word_2 <= 8'h0; 
			7'd2 : Word_2 <= 8'h0; 
			7'd3 : Word_2 <= 8'h1; 
			7'd4 : Word_2 <= 8'h2; 
			7'd5 : Word_2 <= 8'h3; 
			7'd6 : Word_2 <= 8'h4; 
			7'd7 : Word_2 <= 8'h5; 
			7'd8 : Word_2 <= 8'h3; 
			7'd9 : Word_2 <= 8'h4; 
			7'd10: Word_2 <= 8'h5; 
			7'd11: Word_2 <= 8'h6; 
			7'd12: Word_2 <= 8'h7; 
			7'd13: Word_2 <= 8'h8; 
			7'd14: Word_2 <= 8'h9; 
			7'd15: Word_2 <= 8'hA; 
			7'd16: Word_2 <= 8'hB; 
			7'd17: Word_2 <= 8'hC; 
			7'd18: Word_2 <= 8'hD; 
			7'd19: Word_2 <= 8'hE; 
			7'd20: Word_2 <= 8'h9; 
			7'd21: Word_2 <= 8'hA; 
			7'd22: Word_2 <= 8'hB; 
			7'd23: Word_2 <= 8'hC; 
			7'd24: Word_2 <= 8'hD; 
			7'd25: Word_2 <= 8'hE; 
			7'd26: Word_2 <= 8'hF; 
			7'd27: Word_2 <= 8'h10;
			7'd28: Word_2 <= 8'h2B;
			7'd29: Word_2 <= 8'h2C;
			7'd30: Word_2 <= 8'h28;
			7'd31: Word_2 <= 8'h29;
			7'd32: Word_2 <= 8'h2A;
			7'd33: Word_2 <= 8'h2B;
			7'd34: Word_2 <= 8'h20;
			7'd35: Word_2 <= 8'h21;
			7'd36: Word_2 <= 8'h20;
			7'd37: Word_2 <= 8'h21;
			7'd38: Word_2 <= 8'h22;
			7'd39: Word_2 <= 8'h23;
			7'd40: Word_2 <= 8'h24;
			7'd41: Word_2 <= 8'h25;
			7'd42: Word_2 <= 8'h26;
			7'd43: Word_2 <= 8'h27;
			7'd44: Word_2 <= 8'h28;
			7'd45: Word_2 <= 8'h29;
			7'd46: Word_2 <= 8'h2A;
			7'd47: Word_2 <= 8'h2B;
			7'd48: Word_2 <= 8'h2C;
			7'd49: Word_2 <= 8'h2D;
			7'd50: Word_2 <= 8'h2E;
			7'd51: Word_2 <= 8'h2F;
			7'd52: Word_2 <= 8'h30;
			7'd53: Word_2 <= 8'h31;
			7'd54: Word_2 <= 8'h32;
			7'd55: Word_2 <= 8'h2E;
			7'd56: Word_2 <= 8'h2F;
			7'd57: Word_2 <= 8'h30;
			7'd58: Word_2 <= 8'h31;
			7'd59: Word_2 <= 8'h32;
			7'd60: Word_2 <= 8'h33;
			7'd61: Word_2 <= 8'h34;
			7'd62: Word_2 <= 8'h35;
			7'd63: Word_2 <= 8'h36;
			7'd64: Word_2 <= 8'h37;
			7'd65: Word_2 <= 8'h38;
			7'd66: Word_2 <= 8'h38;
			7'd67: Word_2 <= 8'h38;
			7'd68: Word_2 <= 8'h38;
			7'd69: Word_2 <= 8'h38;
			7'd70: Word_2 <= 8'h38;
			7'd71: Word_2 <= 8'h38;
			7'd72: Word_2 <= 8'h38;
			7'd73: Word_2 <= 8'h38;
			7'd74: Word_2 <= 8'h38;
			7'd75: Word_2 <= 8'h38;
			7'd76: Word_2 <= 8'h38;
			default: Word_2 <= 8'b0;
		endcase
end						

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Word_3 <= 8'b0;
	else
		case ( Addr_index )
			7'd0 : Word_3 <= 8'h20; 
			7'd1 : Word_3 <= 8'h0 ; 
			7'd2 : Word_3 <= 8'h0 ; 
			7'd3 : Word_3 <= 8'h0 ; 
			7'd4 : Word_3 <= 8'h0 ; 
			7'd5 : Word_3 <= 8'h0 ; 
			7'd6 : Word_3 <= 8'h0 ; 
			7'd7 : Word_3 <= 8'h0 ; 
			7'd8 : Word_3 <= 8'h20; 
			7'd9 : Word_3 <= 8'h0 ; 
			7'd10: Word_3 <= 8'h0 ; 
			7'd11: Word_3 <= 8'h0 ; 
			7'd12: Word_3 <= 8'h0 ; 
			7'd13: Word_3 <= 8'h0 ; 
			7'd14: Word_3 <= 8'h0 ; 
			7'd15: Word_3 <= 8'h0 ; 
			7'd16: Word_3 <= 8'h0 ; 
			7'd17: Word_3 <= 8'h0 ; 
			7'd18: Word_3 <= 8'h0 ; 
			7'd19: Word_3 <= 8'h0 ; 
			7'd20: Word_3 <= 8'h20; 
			7'd21: Word_3 <= 8'h0 ; 
			7'd22: Word_3 <= 8'h0 ; 
			7'd23: Word_3 <= 8'h0 ; 
			7'd24: Word_3 <= 8'h0 ; 
			7'd25: Word_3 <= 8'h0 ; 
			7'd26: Word_3 <= 8'h0 ; 
			7'd27: Word_3 <= 8'h0 ;
			7'd28: Word_3 <= 8'h20;
			7'd29: Word_3 <= 8'h0 ;
			7'd30: Word_3 <= 8'h20;
			7'd31: Word_3 <= 8'h0 ;
			7'd32: Word_3 <= 8'h0 ;
			7'd33: Word_3 <= 8'h0 ;
			7'd34: Word_3 <= 8'h20;
			7'd35: Word_3 <= 8'h0 ;
			7'd36: Word_3 <= 8'h20;
			7'd37: Word_3 <= 8'h0 ;
			7'd38: Word_3 <= 8'h0 ;
			7'd39: Word_3 <= 8'h0 ;
			7'd40: Word_3 <= 8'h0 ;
			7'd41: Word_3 <= 8'h0 ;
			7'd42: Word_3 <= 8'h0 ;
			7'd43: Word_3 <= 8'h0 ;
			7'd44: Word_3 <= 8'h0 ;
			7'd45: Word_3 <= 8'h0 ;
			7'd46: Word_3 <= 8'h0 ;
			7'd47: Word_3 <= 8'h0 ;
			7'd48: Word_3 <= 8'h0 ;
			7'd49: Word_3 <= 8'h0 ;
			7'd50: Word_3 <= 8'h0 ;
			7'd51: Word_3 <= 8'h0 ;
			7'd52: Word_3 <= 8'h0 ;
			7'd53: Word_3 <= 8'h0 ;
			7'd54: Word_3 <= 8'h0 ;
			7'd55: Word_3 <= 8'h20;
			7'd56: Word_3 <= 8'h0 ;
			7'd57: Word_3 <= 8'h0 ;
			7'd58: Word_3 <= 8'h0 ;
			7'd59: Word_3 <= 8'h0 ;
			7'd60: Word_3 <= 8'h0 ;
			7'd61: Word_3 <= 8'h0 ;
			7'd62: Word_3 <= 8'h0 ;
			7'd63: Word_3 <= 8'h0 ;
			7'd64: Word_3 <= 8'h0 ;
			7'd65: Word_3 <= 8'h0 ;
			7'd66: Word_3 <= 8'h20;
			7'd67: Word_3 <= 8'h20;
			7'd68: Word_3 <= 8'h20;
			7'd69: Word_3 <= 8'h20;
			7'd70: Word_3 <= 8'h20;
			7'd71: Word_3 <= 8'h20;
			7'd72: Word_3 <= 8'h20;
			7'd73: Word_3 <= 8'h20;
			7'd74: Word_3 <= 8'h20;
			7'd75: Word_3 <= 8'h20;
			7'd76: Word_3 <= 8'h20;
			default: Word_3 <= 8'b0;
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
		Config_addr_1byte <= 10'h137;
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == ENABLE_CLK ) )
		Config_addr_1byte <= 10'h130; 
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == WAIT_2US ) )
		Config_addr_1byte <= 10'h130; 
	else if ( ( Current_state == CONFIG_DATA ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h130: Config_addr_1byte <= 10'h131;
			10'h131: Config_addr_1byte <= 10'h132;
			10'h132: Config_addr_1byte <= 10'h133;
			10'h133: Config_addr_1byte <= 10'h137;
			default: Config_addr_1byte <= 10'h130;
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
		Config_data_wr_1byte <= 8'h1A;
	else if ( Current_state == CLEAR_WRITE )
		Config_data_wr_1byte <= 8'h1A;		
	else if ( Current_state == DISABLE_CLK )
		Config_data_wr_1byte <= 8'h00;
	else if ( Current_state == CONFIG_DATA )
		case ( Config_addr_1byte )
			10'h130: Config_data_wr_1byte <= Addr_index;
			10'h131: Config_data_wr_1byte <= Word_1;
			10'h132: Config_data_wr_1byte <= Word_2;			
		  	10'h133: Config_data_wr_1byte <= Word_3;
		  	10'h137: Config_data_wr_1byte <= 8'h1E;
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