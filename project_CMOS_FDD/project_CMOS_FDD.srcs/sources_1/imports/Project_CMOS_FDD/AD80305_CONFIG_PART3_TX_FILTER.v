/************************************************************
module name 	: AD80305_CONFIG_PART3_TX_FILTER
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: Configure the AD80305 TX filter

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/
module  AD80305_CONFIG_PART3_TX_FILTER
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
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h065 ) ) 
				Next_state = WAIT_1MS;
			else
				Next_state = ENABLE_CLK; 

		WAIT_1MS:
			if ( Done_1ms == 1'b1 )
				Next_state = CONFIG_DATA;
			else
				Next_state = WAIT_1MS; 
				
		CONFIG_DATA:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h065 ) ) 
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
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h065 ) ) 
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
	else if ( ( Current_state == ENABLE_CLK ) || ( Current_state == DISABLE_CLK ) )	 
		Config_addr_1byte <= 10'h065;
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == WAIT_1MS ) )
		Config_addr_1byte <= 10'h060; 
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == WAIT_2US ) )
		Config_addr_1byte <= 10'h060; 
	else if ( ( Current_state == CONFIG_DATA ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h060: Config_addr_1byte <= 10'h061;
			10'h061: Config_addr_1byte <= 10'h062;
			10'h062: Config_addr_1byte <= 10'h065;
			default: Config_addr_1byte <= 10'h060;
		endcase
	else
		;
end

//ROM_AD80305_TX_FILTER	U_ROM_AD80305_TX_FILTER
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
			7'h00 : Rom_data <= 16'hFFFB;
			7'h01 : Rom_data <= 16'h0000;
			7'h02 : Rom_data <= 16'h0004;
			7'h03 : Rom_data <= 16'h0017;
			7'h04 : Rom_data <= 16'h0024;
			7'h05 : Rom_data <= 16'h0028;
			7'h06 : Rom_data <= 16'h0012;
			7'h07 : Rom_data <= 16'hFFF3;
			7'h08 : Rom_data <= 16'hFFDC;
			7'h09 : Rom_data <= 16'hFFE6;
			7'h0a : Rom_data <= 16'h000B;
			7'h0b : Rom_data <= 16'h0030;
			7'h0c : Rom_data <= 16'h002E;
			7'h0d : Rom_data <= 16'hFFFE;
			7'h0e : Rom_data <= 16'hFFC4;
			7'h0f : Rom_data <= 16'hFFB8;
  			7'h10 : Rom_data <= 16'hFFF0;
  			7'h11 : Rom_data <= 16'h0045;
  			7'h12 : Rom_data <= 16'h0068;
  			7'h13 : Rom_data <= 16'h002B;
  			7'h14 : Rom_data <= 16'hFFB6;
  			7'h15 : Rom_data <= 16'hFF72;
  			7'h16 : Rom_data <= 16'hFFAE;
  			7'h17 : Rom_data <= 16'h0047;
  			7'h18 : Rom_data <= 16'h00B8;
  			7'h19 : Rom_data <= 16'h0088;
  			7'h1a : Rom_data <= 16'hFFC8;
  			7'h1b : Rom_data <= 16'hFF1C;
  			7'h1c : Rom_data <= 16'hFF33;
  			7'h1d : Rom_data <= 16'h001A;
  			7'h1e : Rom_data <= 16'h0110;
  			7'h1f : Rom_data <= 16'h0123;
  			7'h20 : Rom_data <= 16'h0019;
  			7'h21 : Rom_data <= 16'hFEC9;
  			7'h22 : Rom_data <= 16'hFE75;
  			7'h23 : Rom_data <= 16'hFF9A;
  			7'h24 : Rom_data <= 16'h0155;
  			7'h25 : Rom_data <= 16'h0207;
  			7'h26 : Rom_data <= 16'h00D3;
  			7'h27 : Rom_data <= 16'hFE9C;
  			7'h28 : Rom_data <= 16'hFD69;
  			7'h29 : Rom_data <= 16'hFE97;
  			7'h2a : Rom_data <= 16'h015D;
  			7'h2b : Rom_data <= 16'h033D;
  			7'h2c : Rom_data <= 16'h0234;
  			7'h2d : Rom_data <= 16'hFECD;
  			7'h2e : Rom_data <= 16'hFC02;
  			7'h2f : Rom_data <= 16'hFCB7;
  			7'h30 : Rom_data <= 16'h00D7;
  			7'h31 : Rom_data <= 16'h04E3;
  			7'h32 : Rom_data <= 16'h04CA;
  			7'h33 : Rom_data <= 16'hFFD5;
  			7'h34 : Rom_data <= 16'hFA00;
  			7'h35 : Rom_data <= 16'hF8FF;
  			7'h36 : Rom_data <= 16'hFEF4;
  			7'h37 : Rom_data <= 16'h0789;
  			7'h38 : Rom_data <= 16'h0AA8;
  			7'h39 : Rom_data <= 16'h0369;
  			7'h3a : Rom_data <= 16'hF5C3;
  			7'h3b : Rom_data <= 16'hED92;
  			7'h3c : Rom_data <= 16'hF690;
  			7'h3d : Rom_data <= 16'h12B4;
  			7'h3e : Rom_data <= 16'h369E;
  			7'h3f : Rom_data <= 16'h4F9C;
  			7'h40 : Rom_data <= 16'h4F9C;
  			7'h41 : Rom_data <= 16'h369E;
  			7'h42 : Rom_data <= 16'h12B4;
  			7'h43 : Rom_data <= 16'hF690;
  			7'h44 : Rom_data <= 16'hED92;
  			7'h45 : Rom_data <= 16'hF5C3;
  			7'h46 : Rom_data <= 16'h0369;
  			7'h47 : Rom_data <= 16'h0AA8;
  			7'h48 : Rom_data <= 16'h0789;
  			7'h49 : Rom_data <= 16'hFEF4;
  			7'h4a : Rom_data <= 16'hF8FF;
  			7'h4b : Rom_data <= 16'hFA00;
  			7'h4c : Rom_data <= 16'hFFD5;
  			7'h4d : Rom_data <= 16'h04CA;
  			7'h4e : Rom_data <= 16'h04E3;
  			7'h4f : Rom_data <= 16'h00D7;
  			7'h50 : Rom_data <= 16'hFCB7;
  			7'h51 : Rom_data <= 16'hFC02;
  			7'h52 : Rom_data <= 16'hFECD;
  			7'h53 : Rom_data <= 16'h0234;
  			7'h54 : Rom_data <= 16'h033D;
  			7'h55 : Rom_data <= 16'h015D;
  			7'h56 : Rom_data <= 16'hFE97;
  			7'h57 : Rom_data <= 16'hFD69;
  			7'h58 : Rom_data <= 16'hFE9C;
  			7'h59 : Rom_data <= 16'h00D3;
  			7'h5a : Rom_data <= 16'h0207;
  			7'h5b : Rom_data <= 16'h0155;
  			7'h5c : Rom_data <= 16'hFF9A;
  			7'h5d : Rom_data <= 16'hFE75;
  			7'h5e : Rom_data <= 16'hFEC9;
  			7'h5f : Rom_data <= 16'h0019;
  			7'h60 : Rom_data <= 16'h0123;
  			7'h61 : Rom_data <= 16'h0110;
  			7'h62 : Rom_data <= 16'h001A;
  			7'h63 : Rom_data <= 16'hFF33;
  			7'h64 : Rom_data <= 16'hFF1C;
  			7'h65 : Rom_data <= 16'hFFC8;
  			7'h66 : Rom_data <= 16'h0088;
  			7'h67 : Rom_data <= 16'h00B8;
  			7'h68 : Rom_data <= 16'h0047;
  			7'h69 : Rom_data <= 16'hFFAE;
  			7'h6a : Rom_data <= 16'hFF72;
  			7'h6b : Rom_data <= 16'hFFB6;
  			7'h6c : Rom_data <= 16'h002B;
  			7'h6d : Rom_data <= 16'h0068;
  			7'h6e : Rom_data <= 16'h0045;
  			7'h6f : Rom_data <= 16'hFFF0;
  			7'h70 : Rom_data <= 16'hFFB8;
  			7'h71 : Rom_data <= 16'hFFC4;
  			7'h72 : Rom_data <= 16'hFFFE;
  			7'h73 : Rom_data <= 16'h002E;
  			7'h74 : Rom_data <= 16'h0030;
  			7'h75 : Rom_data <= 16'h000B;
  			7'h76 : Rom_data <= 16'hFFE6;
  			7'h77 : Rom_data <= 16'hFFDC;
  			7'h78 : Rom_data <= 16'hFFF3;
  			7'h79 : Rom_data <= 16'h0012;
  			7'h7a : Rom_data <= 16'h0028;
  			7'h7b : Rom_data <= 16'h0024;
  			7'h7c : Rom_data <= 16'h0017;
  			7'h7d : Rom_data <= 16'h0004;
  			7'h7e : Rom_data <= 16'h0000;
  			7'h7f : Rom_data <= 16'hFFFB;	
  		endcase
end	
	
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_data_wr_1byte <= 8'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) ) 	
		Config_data_wr_1byte <= 8'b0;
	else if ( Current_state == ENABLE_CLK )
		Config_data_wr_1byte <= 8'hFA;
	else if ( Current_state == DISABLE_CLK )
		Config_data_wr_1byte <= 8'hF8;
	else if ( Current_state == CONFIG_DATA )
		case ( Config_addr_1byte )
			10'h060: Config_data_wr_1byte <= Rom_addr;
			10'h061: Config_data_wr_1byte <= Rom_data[7:0];
			10'h062: Config_data_wr_1byte <= Rom_data[15:8];			
		  	10'h065: Config_data_wr_1byte <= 8'hFE;	
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