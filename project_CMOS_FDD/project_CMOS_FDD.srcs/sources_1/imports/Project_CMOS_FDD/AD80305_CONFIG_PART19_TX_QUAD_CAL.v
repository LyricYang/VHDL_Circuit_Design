/************************************************************
module name 	: AD80305_CONFIG_PART19_TX_QUAD_CAL
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: Tx Quadrature Calibration Settings

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_CONFIG_PART19_TX_QUAD_CAL
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
parameter   [3:0]   IDLE = 4'b0000;                                                                   
parameter   [3:0]   READ_DATA = 4'b0001;
parameter   [3:0]   CONFIG_DATA_PART1 = 4'b0010;
parameter   [3:0]   WAIT_2S_1 = 4'b0011;   
parameter   [3:0]   CHECK_CALDONE_1 = 4'b0100;  
parameter   [3:0]   CONFIG_DATA_PART2 = 4'b0101;
parameter   [3:0]   WAIT_2S_2 = 4'b0110;   
parameter   [3:0]   CHECK_CALDONE_2 = 4'b0111; 
parameter   [3:0]   CONFIG_DATA_PART3 = 4'b1000;
parameter   [3:0]   WAIT_2S_3 = 4'b1001;   
parameter   [3:0]   CHECK_CALDONE_3 = 4'b1010; 
parameter   [3:0]   CONFIG_DATA_PART4 = 4'b1011;
parameter   [3:0]   CONFIG_END = 4'b1100;


//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire			Config_en_1byte_tmp;
wire			Done_2s_1;
wire			Done_2s_2;
wire			Done_2s_3;

//* Regs
reg				Config_strat_reg1;
reg				Config_strat_reg2;
reg		[3:0]	Current_state;
reg		[3:0]	Next_state;
reg		[3:0]	Current_state_reg;
reg		[6:0]	Cnt_128;
reg		[25:0]	Cnt_2s_1;
reg		[25:0]	Cnt_2s_2;
reg		[25:0]	Cnt_2s_3;
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
                Next_state = READ_DATA;
            else
                Next_state = IDLE;   
                
		READ_DATA:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h0A3 ) ) 
				Next_state = CONFIG_DATA_PART1;
			else
				Next_state = READ_DATA; 
				
		CONFIG_DATA_PART1:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h016 ) ) 
				Next_state = WAIT_2S_1;	
			else
				Next_state = CONFIG_DATA_PART1; 				
				
		WAIT_2S_1:
			if ( Done_2s_1 == 1'b1 ) 
				Next_state = CHECK_CALDONE_1;
			else
				Next_state = WAIT_2S_1;
				
		CHECK_CALDONE_1:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_data_rd_1byte[0] == 1'b0 ) ) 
				Next_state = CONFIG_DATA_PART2;
			else if ( ( Config_done_1byte == 1'b1 ) && ( Config_data_rd_1byte[0] == 1'b1 ) ) 
				Next_state = CONFIG_DATA_PART1;
			else
				Next_state = CHECK_CALDONE_1; 
				
		CONFIG_DATA_PART2:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h016 ) ) 
				Next_state = WAIT_2S_2;	
			else
				Next_state = CONFIG_DATA_PART2; 		
				
		WAIT_2S_2:
			if ( Done_2s_2 == 1'b1 ) 
				Next_state = CHECK_CALDONE_2;
			else
				Next_state = WAIT_2S_2;

		CHECK_CALDONE_2:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_data_rd_1byte[1] == 1'b0 ) ) 
				Next_state = CONFIG_DATA_PART3;
			else if ( ( Config_done_1byte == 1'b1 ) && ( Config_data_rd_1byte[1] == 1'b1 ) ) 
				Next_state = CONFIG_DATA_PART2;
			else
				Next_state = CHECK_CALDONE_2; 

		CONFIG_DATA_PART3:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h016 ) ) 
				Next_state = WAIT_2S_3;	
			else
				Next_state = CONFIG_DATA_PART3; 		
				
		WAIT_2S_3:
			if ( Done_2s_3 == 1'b1 ) 
				Next_state = CHECK_CALDONE_3;
			else
				Next_state = WAIT_2S_3;

		CHECK_CALDONE_3:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_data_rd_1byte[4] == 1'b0 ) ) 
				Next_state = CONFIG_DATA_PART4;
			else if ( ( Config_done_1byte == 1'b1 ) && ( Config_data_rd_1byte[4] == 1'b1 ) ) 
				Next_state = CONFIG_DATA_PART3;
			else
				Next_state = CHECK_CALDONE_3; 
				
		CONFIG_DATA_PART4:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h015 ) ) 
				Next_state = CONFIG_END;	
			else
				Next_state = CONFIG_DATA_PART4; 
		
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
			|| ( Current_state == WAIT_2S_1 ) || ( Current_state == WAIT_2S_2 ) || ( Current_state == WAIT_2S_3 ) )
		Cnt_128 <= 7'b0;
	else
		Cnt_128 <= Cnt_128 + 7'b01;
end

assign Config_en_1byte_tmp = &Cnt_128;		

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_2s_1 <= 26'b0;
	else if ( Current_state == WAIT_2S_1 )
		Cnt_2s_1 <= Cnt_2s_1 + 26'b01;
	else
		Cnt_2s_1 <= 26'b0;
end

assign Done_2s_1 = ( Cnt_2s_1 >= 26'd61440000 ) ? 1'b1 : 1'b0;	

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_2s_2 <= 26'b0;
	else if ( Current_state == WAIT_2S_2 )
		Cnt_2s_2 <= Cnt_2s_2 + 26'b01;
	else
		Cnt_2s_2 <= 26'b0;
end

assign Done_2s_2 = ( Cnt_2s_2 >= 26'd61440000 ) ? 1'b1 : 1'b0;	

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_2s_3 <= 26'b0;
	else if ( Current_state == WAIT_2S_3 )
		Cnt_2s_3 <= Cnt_2s_3 + 26'b01;
	else
		Cnt_2s_3 <= 26'b0;
end

assign Done_2s_3 = ( Cnt_2s_3 >= 26'd61440000 ) ? 1'b1 : 1'b0;	


//* [4]
//* Write data to AD80305
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_en_1byte <= 1'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) 
			|| ( Current_state == WAIT_2S_1 ) || ( Current_state == WAIT_2S_2 ) || ( Current_state == WAIT_2S_3 ) )
		Config_en_1byte <= 1'b0;	
	else if ( ( Current_state == READ_DATA ) || ( Current_state == CONFIG_DATA_PART1 ) 
			|| ( Current_state == CONFIG_DATA_PART2 ) || ( Current_state == CONFIG_DATA_PART3 ) || ( Current_state == CONFIG_DATA_PART4 )
			|| ( Current_state == CHECK_CALDONE_1 ) || ( Current_state == CHECK_CALDONE_2 ) || ( Current_state == CHECK_CALDONE_3 ) )	
		Config_en_1byte <= Config_en_1byte_tmp;
	else
		Config_en_1byte <= 1'b0;	
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_wr_rd_1byte <= 1'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) 
			|| ( Current_state == WAIT_2S_1 ) || ( Current_state == WAIT_2S_2 ) || ( Current_state == WAIT_2S_3 ) )
		Config_wr_rd_1byte <= 1'b0;	
	else if ( ( Current_state == READ_DATA ) || ( Current_state == CHECK_CALDONE_1 ) 
			|| ( Current_state == CHECK_CALDONE_2 ) || ( Current_state == CHECK_CALDONE_3 ) )
		Config_wr_rd_1byte <= 1'b0;	
	else if ( ( Current_state == CONFIG_DATA_PART1 ) || ( Current_state == CONFIG_DATA_PART2 )
			|| ( Current_state == CONFIG_DATA_PART3 ) || ( Current_state == CONFIG_DATA_PART4 ) )	
		Config_wr_rd_1byte <= Config_en_1byte_tmp;
	else
		Config_wr_rd_1byte <= 1'b0;	
end
		
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) 
			|| ( Current_state == WAIT_2S_1 ) || ( Current_state == WAIT_2S_2 ) || ( Current_state == WAIT_2S_3 ) )
		Config_addr_1byte <= 10'b0;
	else if ( Current_state == READ_DATA )
		Config_addr_1byte <= 10'h0A3;
	else if ( ( Current_state == CHECK_CALDONE_1 ) || ( Current_state == CHECK_CALDONE_2 ) || ( Current_state == CHECK_CALDONE_3 ) )
		Config_addr_1byte <= 10'h016;
	else if ( ( Current_state == CONFIG_DATA_PART1 ) && ( ( Current_state_reg == READ_DATA ) || ( Current_state_reg == CHECK_CALDONE_1 ) ) )
		Config_addr_1byte <= 10'h0A0; 
	else if ( ( Current_state == CONFIG_DATA_PART2 ) &&  ( ( Current_state_reg == CHECK_CALDONE_1 ) || ( Current_state_reg == CHECK_CALDONE_2 ) ) )
		Config_addr_1byte <= 10'h185; 
	else if ( ( Current_state == CONFIG_DATA_PART4 ) && ( Current_state_reg == CHECK_CALDONE_3 ) )
		Config_addr_1byte <= 10'h168; 		
	else if ( ( Current_state == CONFIG_DATA_PART1 ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h0A0: Config_addr_1byte <= 10'h0A3;
			10'h0A3: Config_addr_1byte <= 10'h0A1;
			10'h0A1: Config_addr_1byte <= 10'h0A9;
			10'h0A9: Config_addr_1byte <= 10'h0A2;
			10'h0A2: Config_addr_1byte <= 10'h0A5;
			10'h0A5: Config_addr_1byte <= 10'h0A6;
			10'h0A6: Config_addr_1byte <= 10'h0AA;
			10'h0AA: Config_addr_1byte <= 10'h0A4;
			10'h0A4: Config_addr_1byte <= 10'h0AE;
			10'h0AE: Config_addr_1byte <= 10'h193;
			10'h193: Config_addr_1byte <= 10'h190;
			10'h190: Config_addr_1byte <= 10'h194;
			10'h194: Config_addr_1byte <= 10'h016;
			default: Config_addr_1byte <= 10'h0A0;
		endcase
	else if ( ( Current_state == CONFIG_DATA_PART2 ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h185: Config_addr_1byte <= 10'h186;
			10'h186: Config_addr_1byte <= 10'h187;
			10'h187: Config_addr_1byte <= 10'h18B;
			10'h18B: Config_addr_1byte <= 10'h188;
			10'h188: Config_addr_1byte <= 10'h189;
			10'h189: Config_addr_1byte <= 10'h016;
			default: Config_addr_1byte <= 10'h185;
		endcase
	else if ( Current_state == CONFIG_DATA_PART3 )
		Config_addr_1byte <= 10'h016; 
	else if ( ( Current_state == CONFIG_DATA_PART4 ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h168: Config_addr_1byte <= 10'h16E;
			10'h16E: Config_addr_1byte <= 10'h16A;
			10'h16A: Config_addr_1byte <= 10'h16B;
			10'h16B: Config_addr_1byte <= 10'h169;
			10'h169: Config_addr_1byte <= 10'h18B;
			10'h18B: Config_addr_1byte <= 10'h012;
			10'h012: Config_addr_1byte <= 10'h013;
			10'h013: Config_addr_1byte <= 10'h015;
			default: Config_addr_1byte <= 10'h168;
		endcase
	else
		;
end	
	
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_data_wr_1byte <= 8'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) 
			|| ( Current_state == WAIT_2S_1 ) || ( Current_state == WAIT_2S_2 ) || ( Current_state == WAIT_2S_3 ) )
		Config_data_wr_1byte <= 8'b0;
	else if ( ( Current_state == READ_DATA ) || ( Current_state == CHECK_CALDONE_1 ) 
			|| ( Current_state == CHECK_CALDONE_2 ) || ( Current_state == CHECK_CALDONE_3 ) )
		Config_data_wr_1byte <= 8'b0;
	else if ( Current_state == CONFIG_DATA_PART1 )
		case ( Config_addr_1byte )
			10'h0A0: Config_data_wr_1byte <= 8'h15;
			10'h0A3: Config_data_wr_1byte <= 8'h00;
			10'h0A1: Config_data_wr_1byte <= 8'h7B;		
		  	10'h0A9: Config_data_wr_1byte <= 8'hFF;
		  	10'h0A2: Config_data_wr_1byte <= 8'h7F;
			10'h0A5: Config_data_wr_1byte <= 8'h01;
			10'h0A6: Config_data_wr_1byte <= 8'h01;
			10'h0AA: Config_data_wr_1byte <= 8'h22;		
		  	10'h0A4: Config_data_wr_1byte <= 8'hF0;
		  	10'h0AE: Config_data_wr_1byte <= 8'h00;
			10'h193: Config_data_wr_1byte <= 8'h3F;
			10'h190: Config_data_wr_1byte <= 8'h0F;
			10'h194: Config_data_wr_1byte <= 8'h01;		
		  	10'h016: Config_data_wr_1byte <= 8'h01;  	
		  	default: Config_data_wr_1byte <= 8'h15;
		endcase
	else if ( Current_state == CONFIG_DATA_PART2 )
		case ( Config_addr_1byte )
			10'h185: Config_data_wr_1byte <= 8'h20;
			10'h186: Config_data_wr_1byte <= 8'h32;
			10'h187: Config_data_wr_1byte <= 8'h24;		
		  	10'h18B: Config_data_wr_1byte <= 8'h83;
		  	10'h188: Config_data_wr_1byte <= 8'h05;
			10'h189: Config_data_wr_1byte <= 8'h30;
			10'h016: Config_data_wr_1byte <= 8'h02; 	
		  	default: Config_data_wr_1byte <= 8'h20;
		endcase
	else if ( Current_state == CONFIG_DATA_PART3 ) 
		Config_data_wr_1byte <= 8'h10;	
	else if ( Current_state == CONFIG_DATA_PART4 )
		case ( Config_addr_1byte )
			10'h168: Config_data_wr_1byte <= 8'h03;
			10'h16E: Config_data_wr_1byte <= 8'h25;
			10'h16A: Config_data_wr_1byte <= 8'h75;		
		  	10'h16B: Config_data_wr_1byte <= 8'h15;
		  	10'h169: Config_data_wr_1byte <= 8'hCF;
			10'h18B: Config_data_wr_1byte <= 8'hAD;
			10'h012: Config_data_wr_1byte <= 8'h02;
			10'h013: Config_data_wr_1byte <= 8'h01;		
		  	10'h015: Config_data_wr_1byte <= 8'h0C; 	
		  	default: Config_data_wr_1byte <= 8'h03;
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