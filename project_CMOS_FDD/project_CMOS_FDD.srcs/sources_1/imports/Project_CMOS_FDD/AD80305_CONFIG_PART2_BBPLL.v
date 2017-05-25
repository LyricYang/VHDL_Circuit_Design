/************************************************************
module name 	: AD80305_CONFIG_PART2_BBPLL
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
module  AD80305_CONFIG_PART2_BBPLL
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
reg				Cnt_addr_03f;
reg				Cnt_addr_04d;
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
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h04D ) && ( Config_data_wr_1byte == 8'h05  ) ) 
				Next_state = WAIT_2S;	
			else
				Next_state = CONFIG_DATA_PART1; 	
				
		WAIT_2S:
			if ( Done_2s == 1'b1 )
				Next_state = CHECK_LOCK;
			else
				Next_state = WAIT_2S;	
				
		CHECK_LOCK:
			if ( ( Config_data_rd_1byte[7] == 1'b1 ) && ( Config_done_1byte == 1'b1 ) )		//* ( 0x05E[7]==1 is locked )
				Next_state = CONFIG_DATA_PART2; 
			else if ( ( Config_data_rd_1byte[7] == 1'b0 ) && ( Config_done_1byte == 1'b1 ) )
				Next_state = CONFIG_DATA_PART1;
			else
				Next_state = CHECK_LOCK;		
				
		CONFIG_DATA_PART2:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h00A ) ) 
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


always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_addr_03f <= 1'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) || ( Current_state == WAIT_2S ) )
		Cnt_addr_03f <= 1'b0; 
	else if ( ( Current_state == CONFIG_DATA_PART1 ) && ( ( Current_state_reg == IDLE ) || ( Current_state_reg == CHECK_LOCK ) ) )
		Cnt_addr_03f <= 1'b0;
	else if ( ( Current_state == CONFIG_DATA_PART1 ) && ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h03F ) )
		Cnt_addr_03f <= 1'b1;
	else
		;
end	

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_addr_04d <= 1'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_END ) || ( Current_state == WAIT_2S ) )
		Cnt_addr_04d <= 1'b0; 
	else if ( ( Current_state == CONFIG_DATA_PART1 ) && ( ( Current_state_reg == IDLE ) || ( Current_state_reg == CHECK_LOCK ) ) )
		Cnt_addr_04d <= 1'b0;
	else if ( ( Current_state == CONFIG_DATA_PART1 ) && ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h04D ) )
		Cnt_addr_04d <= 1'b1;
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
		Config_addr_1byte <= 10'h045; 
	else if ( ( Current_state == CONFIG_DATA_PART1 ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h045: Config_addr_1byte <= 10'h046;
			10'h046: Config_addr_1byte <= 10'h048;
			10'h048: Config_addr_1byte <= 10'h049;
			10'h049: Config_addr_1byte <= 10'h04A;
			10'h04A: Config_addr_1byte <= 10'h04B;
			10'h04B: Config_addr_1byte <= 10'h04E;
			10'h04E: Config_addr_1byte <= 10'h043;								
			10'h043: Config_addr_1byte <= 10'h042;
			10'h042: Config_addr_1byte <= 10'h041;	
			10'h041: Config_addr_1byte <= 10'h044;  		
			10'h044: Config_addr_1byte <= 10'h03F;	
			10'h03F: if ( Cnt_addr_03f == 1'b1 )
					 	 Config_addr_1byte <= 10'h04C;	
					 else
					 	 Config_addr_1byte <= 10'h03F;
			10'h04C: Config_addr_1byte <= 10'h04D;	
			10'h04D: if ( Cnt_addr_04d == 1'b1 )
					 	 Config_addr_1byte <= 10'h05E;	
					 else
					 	 Config_addr_1byte <= 10'h04D;	
			default: Config_addr_1byte <= 10'h045;
		endcase
	else if ( Current_state == CHECK_LOCK ) 
		Config_addr_1byte <= 10'h05E;	
	else if ( ( Current_state == CONFIG_DATA_PART2 ) && ( Current_state_reg == CHECK_LOCK ) )
		Config_addr_1byte <= 10'h002; 
	else if ( ( Current_state == CONFIG_DATA_PART2 ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h002: Config_addr_1byte <= 10'h003;
			10'h003: Config_addr_1byte <= 10'h004;
			10'h004: Config_addr_1byte <= 10'h00A;
			default: Config_addr_1byte <= 10'h002; 
		endcase
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
		// BBPLL Control Registers 03F Through 04F
			10'h045: Config_data_wr_1byte <= 8'h03;      // Ref Frequency Scaler, set to x2, i.e., Fref = 2 x 40MHz = 80MHz
			10'h046: Config_data_wr_1byte <= 8'h03;      // CP Current
			10'h048: Config_data_wr_1byte <= 8'hE8;		 // 048 - 04A Loop Filter
		  	10'h049: Config_data_wr_1byte <= 8'h5B;
			10'h04A: Config_data_wr_1byte <= 8'h35;
			10'h04B: Config_data_wr_1byte <= 8'hE0;      // VCO Control
			10'h04E: Config_data_wr_1byte <= 8'h10;		 // SDM Control 3
		  	10'h043: Config_data_wr_1byte <= 8'h14;      // Fractional BB Frequency Word(041 - 043): 92E14(H)
			10'h042: Config_data_wr_1byte <= 8'h2E;		
		  	10'h041: Config_data_wr_1byte <= 8'h09;	
			10'h044: Config_data_wr_1byte <= 8'h0C;      // Integer BB Freq Word			
			10'h03F: if ( Cnt_addr_03f == 1'b1 )
					 	 Config_data_wr_1byte <= 8'h01;
					 else
					 	 Config_data_wr_1byte <= 8'h05;				
		  	10'h04C: Config_data_wr_1byte <= 8'h86;
			10'h04D: if ( Cnt_addr_04d == 1'b1 )
					 	 Config_data_wr_1byte <= 8'h05;
					 else
					 	 Config_data_wr_1byte <= 8'h01;				  	
		  	default: Config_data_wr_1byte <= 8'h03;		  	
		endcase
	else if ( Current_state == CHECK_LOCK )
		Config_data_wr_1byte <= 8'b0;
	else if ( Current_state == CONFIG_DATA_PART2 )
		case ( Config_addr_1byte )
			10'h002: Config_data_wr_1byte <= 8'h4E;      // Enable Tx1 and shutdown Tx2
			10'h003: Config_data_wr_1byte <= 8'h5E;      // Enable Rx1 and shutdown Rx2
			10'h004: Config_data_wr_1byte <= 8'h03;		
		  	10'h00A: Config_data_wr_1byte <= 8'h09;
			default: Config_data_wr_1byte <= 8'hCE;			
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