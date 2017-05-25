/************************************************************
module name 	: AD80305_DUMP_READ
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: Dump read all the registers

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_DUMP_READ
    (
    input               Clk,                    //* 30.72MHz
    input               Reset, 
    input               Config_start,           //* A high active signal to start the whole operation
    input               Config_done_1byte,
    input       [7:0]   Config_data_rd_1byte,

    output  reg         Config_en_1byte,
    output  wire        Config_wr_rd_1byte,
    output  reg [9:0]   Config_addr_1byte,
    output  wire[7:0]   Config_data_wr_1byte,
    output  reg         Config_end,             //* A high active signal to end the whole operation
    output  wire[1:0]   Probe_Current_state
    );

//=============================================================================
//* Parameters
//=============================================================================
//* FSM Parameters
parameter   [1:0]   IDLE        = 2'b00;                                                                   
parameter   [1:0]   CONFIG_DATA = 2'b01;
parameter   [1:0]   CONFIG_DONE = 2'b11;


//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire			Config_en_1byte_tmp;
wire			Ram_wr_en;
wire	[9:0]	Ram_wr_addr;
wire	[7:0]	Ram_wr_data;

//* Regs
reg				Config_start_reg1;
reg				Config_start_reg2;
reg		[1:0]	Current_state;
reg		[1:0]	Next_state;
reg		[1:0]	Current_state_reg;
reg		[6:0]	Cnt_128;






//=============================================================================
//* Model Body
//=============================================================================
//* [1]
//* Get a enable signal to start the process of configure
//*
always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
    	Config_start_reg1 <= 1'b0;
    else
    	Config_start_reg1 <= Config_start;
end

always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
    	Config_start_reg2 <= 1'b0;
    else
    	Config_start_reg2 <= Config_start_reg1;
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
            if ( Config_start_reg2 == 1'b1 )  
                Next_state = CONFIG_DATA;
            else
                Next_state = IDLE;                   
				
		CONFIG_DATA:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h3FF ) ) 
				Next_state = CONFIG_DONE;	
			else
				Next_state = CONFIG_DATA; 									
		
		CONFIG_DONE:
			if ( Config_start == 1'b1 )
				Next_state = IDLE; 
			else
				Next_state = CONFIG_DONE; 	
	endcase
end


//* [3]
//* Some control signals
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Cnt_128 <= 7'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_DONE ) )
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
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_DONE ) )
		Config_en_1byte <= 1'b0;	
	else if ( Current_state == CONFIG_DATA ) 
		Config_en_1byte <= Config_en_1byte_tmp;
	else
		Config_en_1byte <= 1'b0;	
end

assign Config_wr_rd_1byte = 1'b0;
		
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == IDLE ) || ( Current_state == CONFIG_DONE ) )
		Config_addr_1byte <= 10'b0;
	else if ( ( Current_state == CONFIG_DATA ) && ( Config_done_1byte == 1'b1 ) )
		Config_addr_1byte <= Config_addr_1byte + 10'b01;
	else
		;
end	

assign Config_data_wr_1byte = 8'b0;

assign Ram_wr_en = Config_done_1byte & ( Current_state == CONFIG_DATA );
assign Ram_wr_addr = Config_addr_1byte;
assign Ram_wr_data = Config_data_rd_1byte;

AD80305_DUMP_RAM	U_AD80305_DUMP_RAM 
	(
	//* Inputs
	.clock			( Clk ),	
	.address		( Ram_wr_addr ),
	.data			( Ram_wr_data ),
	.wren			( Ram_wr_en )

	//* Outputs
//	.q				(  )
	);

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_end <= 1'b0;
	else if ( ( Current_state == CONFIG_DONE ) && ( Current_state_reg != CONFIG_DONE ) )
		Config_end <= 1'b1;
	else
		Config_end <= 1'b0;
end

assign  Probe_Current_state = Current_state;

endmodule