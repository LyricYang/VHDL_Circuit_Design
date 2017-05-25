/************************************************************
module name 	: AD80305_CONFIG_PART4_RX_FILTER
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: Configure the AD80305 RX filter

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/
module  AD80305_CONFIG_PART4_RX_FILTER
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
parameter   [2:0]   WAIT_1MS = 3'b010;
parameter   [2:0]   CONFIG_DATA = 3'b011;
parameter   [2:0]   WAIT_2US = 3'b100;    
parameter   [2:0]   DISABLE_CLK = 3'b101;
parameter   [2:0]   CONFIG_END = 3'b110;


//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire			Config_en_1byte_tmp;
wire			Done_2us;
wire			Done_1ms;

//* Regs
reg				Config_strat_reg1;
reg				Config_strat_reg2;
reg		[2:0]	Current_state;
reg		[2:0]	Next_state;
reg		[2:0]	Current_state_reg;
reg		[6:0]	Cnt_128;
reg		[7:0]	Cnt_2us;
reg		[15:0]	Cnt_1ms;
reg		[6:0]	Rom_addr;   
reg		[15:0]	Rom_data;
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
                Next_state = ENABLE_CLK;
            else
                Next_state = IDLE;   
                
		ENABLE_CLK:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h0F6 ) ) 
				Next_state = WAIT_1MS;
			else
				Next_state = ENABLE_CLK; 

		WAIT_1MS:
			if ( Done_1ms == 1'b1 )
				Next_state = CONFIG_DATA;
			else
				Next_state = WAIT_1MS; 
				
		CONFIG_DATA:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h0F5 ) ) 
				Next_state = WAIT_2US;	
			else
				Next_state = CONFIG_DATA; 	
				
		WAIT_2US:
			if ( ( Done_2us == 1'b1 ) && ( Rom_addr == 8'h7F ) )	
				Next_state = DISABLE_CLK;
			else if ( ( Done_2us == 1'b1 ) && ( Rom_addr < 8'h7F ) )
				Next_state = CONFIG_DATA;	
			else
				Next_state = WAIT_2US;
				
		DISABLE_CLK:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h0F5 ) ) 
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
			|| ( Current_state == WAIT_1MS ) || ( Current_state == WAIT_2US ) )
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
		Cnt_1ms <= 15'b0;
	else if ( Current_state == WAIT_1MS )
		Cnt_1ms <= Cnt_1ms + 15'b01;
	else
		Cnt_1ms <= 15'b0;
end

assign Done_1ms = ( Cnt_1ms >= 15'd30720 ) ? 1'b1 : 1'b0;	


always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Rom_addr <= 7'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) )
		Rom_addr <= 7'b0;
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == WAIT_2US ) )	
		Rom_addr <= Rom_addr + 7'b01;
	else
		;
end


//* [4]
//* Write data to AD80305
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_en_1byte <= 1'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) 
			|| ( Current_state == WAIT_1MS ) || ( Current_state == WAIT_2US ) )
		Config_en_1byte <= 1'b0;	
	else if ( ( Current_state == ENABLE_CLK ) || ( Current_state == CONFIG_DATA ) || ( Current_state == DISABLE_CLK ) )	
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
	else if ( ( Current_state == ENABLE_CLK ) && ( Current_state_reg == IDLE ) )	 
		Config_addr_1byte <= 10'h0F5;
	else if ( ( Current_state == ENABLE_CLK )  && ( Config_done_1byte == 1'b1 ) )	 
		Config_addr_1byte <= 10'h0F6;		
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == WAIT_1MS ) )
		Config_addr_1byte <= 10'h0F0; 
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == WAIT_2US ) )
		Config_addr_1byte <= 10'h0F0; 
	else if ( ( Current_state == CONFIG_DATA ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h0F0: Config_addr_1byte <= 10'h0F1;
			10'h0F1: Config_addr_1byte <= 10'h0F2;
			10'h0F2: Config_addr_1byte <= 10'h0F5;
			default: Config_addr_1byte <= 10'h0F0;
		endcase
	else if ( Current_state == DISABLE_CLK ) 
		Config_addr_1byte <= 10'h0F5;			
	else
		;
end

//ROM_AD80305_RX_FILTER	U_ROM_AD80305_RX_FILTER
//	(
//	//* Inputs
//	.clock				( Clk ),	
//	.address			( Rom_addr ),
//	
//	//* Outputs
//	.q					( Rom_data )
//	);		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Rom_data <= 16'b0;
	else
		case ( Rom_addr )
			7'h00 : Rom_data <= 16'h0031;
			7'h01 : Rom_data <= 16'h00D9;
			7'h02 : Rom_data <= 16'h008E;
			7'h03 : Rom_data <= 16'h013E;
			7'h04 : Rom_data <= 16'h0039;
			7'h05 : Rom_data <= 16'h0032;
			7'h06 : Rom_data <= 16'hFF47;
			7'h07 : Rom_data <= 16'hFF9E;
			7'h08 : Rom_data <= 16'hFFBF;
			7'h09 : Rom_data <= 16'h0087;
			7'h0a : Rom_data <= 16'h008A;
			7'h0b : Rom_data <= 16'h005E;
			7'h0c : Rom_data <= 16'hFF9B;
			7'h0d : Rom_data <= 16'hFF53;
			7'h0e : Rom_data <= 16'hFF72;
			7'h0f : Rom_data <= 16'h003B;
  			7'h10 : Rom_data <= 16'h00C7;
  			7'h11 : Rom_data <= 16'h00CB;
  			7'h12 : Rom_data <= 16'hFFFF;
  			7'h13 : Rom_data <= 16'hFF30;
  			7'h14 : Rom_data <= 16'hFEF2;
  			7'h15 : Rom_data <= 16'hFFB3;
  			7'h16 : Rom_data <= 16'h00C4;
  			7'h17 : Rom_data <= 16'h0151;
  			7'h18 : Rom_data <= 16'h00B0;
  			7'h19 : Rom_data <= 16'hFF66;
  			7'h1a : Rom_data <= 16'hFE77;
  			7'h1b : Rom_data <= 16'hFEDB;
  			7'h1c : Rom_data <= 16'h004E;
  			7'h1d : Rom_data <= 16'h01AE;
  			7'h1e : Rom_data <= 16'h01A9;
  			7'h1f : Rom_data <= 16'h0024;
  			7'h20 : Rom_data <= 16'hFE4B;
  			7'h21 : Rom_data <= 16'hFDCD;
  			7'h22 : Rom_data <= 16'hFF3F;
  			7'h23 : Rom_data <= 16'h0192;
  			7'h24 : Rom_data <= 16'h02B9;
  			7'h25 : Rom_data <= 16'h0189;
  			7'h26 : Rom_data <= 16'hFEC7;
  			7'h27 : Rom_data <= 16'hFCD0;
  			7'h28 : Rom_data <= 16'hFD84;
  			7'h29 : Rom_data <= 16'h009B;
  			7'h2a : Rom_data <= 16'h0388;
  			7'h2b : Rom_data <= 16'h039A;
  			7'h2c : Rom_data <= 16'h0059;
  			7'h2d : Rom_data <= 16'hFC53;
  			7'h2e : Rom_data <= 16'hFB1F;
  			7'h2f : Rom_data <= 16'hFE47;
  			7'h30 : Rom_data <= 16'h0384;
  			7'h31 : Rom_data <= 16'h0653;
  			7'h32 : Rom_data <= 16'h03AF;
  			7'h33 : Rom_data <= 16'hFD1E;
  			7'h34 : Rom_data <= 16'hF806;
  			7'h35 : Rom_data <= 16'hF979;
  			7'h36 : Rom_data <= 16'h0178;
  			7'h37 : Rom_data <= 16'h09F6;
  			7'h38 : Rom_data <= 16'h0AFD;
  			7'h39 : Rom_data <= 16'h0174;
  			7'h3a : Rom_data <= 16'hF321;
  			7'h3b : Rom_data <= 16'hEC34;
  			7'h3c : Rom_data <= 16'hF720;
  			7'h3d : Rom_data <= 16'h1458;
  			7'h3e : Rom_data <= 16'h3813;
  			7'h3f : Rom_data <= 16'h5078;
  			7'h40 : Rom_data <= 16'h5078;
  			7'h41 : Rom_data <= 16'h3813;
  			7'h42 : Rom_data <= 16'h1458;
  			7'h43 : Rom_data <= 16'hF720;
  			7'h44 : Rom_data <= 16'hEC34;
  			7'h45 : Rom_data <= 16'hF321;
  			7'h46 : Rom_data <= 16'h0174;
  			7'h47 : Rom_data <= 16'h0AFD;
  			7'h48 : Rom_data <= 16'h09F6;
  			7'h49 : Rom_data <= 16'h0178;
  			7'h4a : Rom_data <= 16'hF979;
  			7'h4b : Rom_data <= 16'hF806;
  			7'h4c : Rom_data <= 16'hFD1E;
  			7'h4d : Rom_data <= 16'h03AF;
  			7'h4e : Rom_data <= 16'h0653;
  			7'h4f : Rom_data <= 16'h0384;
  			7'h50 : Rom_data <= 16'hFE47;
  			7'h51 : Rom_data <= 16'hFB1F;
  			7'h52 : Rom_data <= 16'hFC53;
  			7'h53 : Rom_data <= 16'h0059;
  			7'h54 : Rom_data <= 16'h039A;
  			7'h55 : Rom_data <= 16'h0388;
  			7'h56 : Rom_data <= 16'h009B;
  			7'h57 : Rom_data <= 16'hFD84;
  			7'h58 : Rom_data <= 16'hFCD0;
  			7'h59 : Rom_data <= 16'hFEC7;
  			7'h5a : Rom_data <= 16'h0189;
  			7'h5b : Rom_data <= 16'h02B9;
  			7'h5c : Rom_data <= 16'h0192;
  			7'h5d : Rom_data <= 16'hFF3F;
  			7'h5e : Rom_data <= 16'hFDCD;
  			7'h5f : Rom_data <= 16'hFE4B;
  			7'h60 : Rom_data <= 16'h0024;
  			7'h61 : Rom_data <= 16'h01A9;
  			7'h62 : Rom_data <= 16'h01AE;
  			7'h63 : Rom_data <= 16'h004E;
  			7'h64 : Rom_data <= 16'hFEDB;
  			7'h65 : Rom_data <= 16'hFE77;
  			7'h66 : Rom_data <= 16'hFF66;
  			7'h67 : Rom_data <= 16'h00B0;
  			7'h68 : Rom_data <= 16'h0151;
  			7'h69 : Rom_data <= 16'h00C4;
  			7'h6a : Rom_data <= 16'hFFB3;
  			7'h6b : Rom_data <= 16'hFEF2;
  			7'h6c : Rom_data <= 16'hFF30;
  			7'h6d : Rom_data <= 16'hFFFF;
  			7'h6e : Rom_data <= 16'h00CB;
  			7'h6f : Rom_data <= 16'h00C7;
  			7'h70 : Rom_data <= 16'h003B;
  			7'h71 : Rom_data <= 16'hFF72;
  			7'h72 : Rom_data <= 16'hFF53;
  			7'h73 : Rom_data <= 16'hFF9B;
  			7'h74 : Rom_data <= 16'h005E;
  			7'h75 : Rom_data <= 16'h008A;
  			7'h76 : Rom_data <= 16'h0087;
  			7'h77 : Rom_data <= 16'hFFBF;
  			7'h78 : Rom_data <= 16'hFF9E;
  			7'h79 : Rom_data <= 16'hFF47;
  			7'h7a : Rom_data <= 16'h0032;
  			7'h7b : Rom_data <= 16'h0039;
  			7'h7c : Rom_data <= 16'h013E;
  			7'h7d : Rom_data <= 16'h008E;
  			7'h7e : Rom_data <= 16'h00D9;
  			7'h7f : Rom_data <= 16'h0031;	
  		endcase
end	
	
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_data_wr_1byte <= 8'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) ) 	
		Config_data_wr_1byte <= 8'b0;
	else if ( Current_state == ENABLE_CLK )
		case ( Config_addr_1byte )
			10'h0F5: Config_data_wr_1byte <= 8'hFA;
			10'h0F6: Config_data_wr_1byte <= 8'h02;
		  	default: Config_data_wr_1byte <= 8'h00;
		endcase
	else if ( Current_state == DISABLE_CLK )
		Config_data_wr_1byte <= 8'hF8;
	else if ( Current_state == CONFIG_DATA )
		case ( Config_addr_1byte )
			10'h0F0: Config_data_wr_1byte <= Rom_addr;
			10'h0F1: Config_data_wr_1byte <= Rom_data[7:0];
			10'h0F2: Config_data_wr_1byte <= Rom_data[15:8];			
		  	10'h0F5: Config_data_wr_1byte <= 8'hFE;	
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