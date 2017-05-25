/************************************************************
module name 	: AD80305_CONFIG_PART6_AUXDAC_AUXADC
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: Setup AuxDAC and AUXADC

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_CONFIG_PART6_AUXDAC_AUXADC
    (
    //input signals
    input               Clk,                        //* 30.72MHz
    input               Reset,                      //* Reset
    input               Config_start,               //* A high active signal to start the whole operation
    input               Config_done_1byte,
    input       [3:0]   GPO,

    //output signals
    output  reg         Config_en_1byte,
    output  wire        Config_wr_rd_1byte,
    output  reg [9:0]   Config_addr_1byte,
    output  reg [7:0]   Config_data_wr_1byte,
    output  reg         Config_end                  //* A high active signal to end the whole operation
    );


//=============================================================================
//* Parameters
//=============================================================================
//* FSM Parameters
parameter   [1:0]   IDLE = 2'b00;                                                                   
parameter   [1:0]   CONFIG_AUXDAC = 2'b01;
parameter   [1:0]   CONFIG_AUXADC= 2'b10;
parameter   [1:0]   CONFIG_END = 2'b11;


//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire			Config_en_1byte_tmp;

//* Regs
reg				Config_start_reg1;
reg				Config_start_reg2;
reg		[1:0]	Current_state;
reg		[1:0]	Next_state;
reg		[1:0]	Current_state_reg;
reg		[6:0]	Cnt_128;

/*****************************************************/
/*-------               Main Code            --------*/
/*****************************************************/

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
                Next_state = CONFIG_AUXDAC;
            else
                Next_state = IDLE;                   
				
		CONFIG_AUXDAC:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h033 ) ) 
				Next_state = CONFIG_AUXADC;	
			else
				Next_state = CONFIG_AUXDAC; 		
				
		CONFIG_AUXADC:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h01D ) ) 
				Next_state = CONFIG_END;	
			else
				Next_state = CONFIG_AUXADC; 												
		
		CONFIG_END:
			if ( Config_start == 1'b1 )
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
	else if ( ( Current_state == CONFIG_AUXDAC ) || ( Current_state == CONFIG_AUXADC ) )
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
	else if ( ( Current_state == CONFIG_AUXDAC ) && ( Current_state_reg == IDLE ) )
		Config_addr_1byte <= 10'h018; 
	else if ( ( Current_state == CONFIG_AUXADC ) && ( Current_state_reg == CONFIG_AUXDAC ) )
		Config_addr_1byte <= 10'h00B; 		
	else if ( ( Current_state == CONFIG_AUXDAC ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h018: Config_addr_1byte <= 10'h019;
			10'h019: Config_addr_1byte <= 10'h01A;
			10'h01A: Config_addr_1byte <= 10'h01B;
			10'h01B: Config_addr_1byte <= 10'h023;	
			10'h023: Config_addr_1byte <= 10'h026;
			10'h026: Config_addr_1byte <= 10'h030;
			10'h030: Config_addr_1byte <= 10'h031;
			10'h031: Config_addr_1byte <= 10'h032;	
			10'h032: Config_addr_1byte <= 10'h033;						
			default: Config_addr_1byte <= 10'h018;
		endcase		
	else if ( ( Current_state == CONFIG_AUXADC ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h00B: Config_addr_1byte <= 10'h00C;
			10'h00C: Config_addr_1byte <= 10'h00D;
			10'h00D: Config_addr_1byte <= 10'h00F;
			10'h00F: Config_addr_1byte <= 10'h01C;	
			10'h01C: Config_addr_1byte <= 10'h01D;		
			default: Config_addr_1byte <= 10'h00B;
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
	else if ( Current_state == CONFIG_AUXDAC )
		case ( Config_addr_1byte )
			10'h018: Config_data_wr_1byte <= 8'h00;
			10'h019: Config_data_wr_1byte <= 8'h00;
			10'h01A: Config_data_wr_1byte <= 8'h00;		
		  	10'h01B: Config_data_wr_1byte <= 8'h00;
			10'h023: Config_data_wr_1byte <= 8'hFF;		
			10'h026: Config_data_wr_1byte <= 8'h00;
			10'h030: Config_data_wr_1byte <= 8'h00;
			10'h031: Config_data_wr_1byte <= 8'h00;		
		  	10'h032: Config_data_wr_1byte <= 8'h00;
			10'h033: Config_data_wr_1byte <= 8'h00;					  	
		  	default: Config_data_wr_1byte <= 8'h00;
		endcase
	else if ( Current_state == CONFIG_AUXADC )
		case ( Config_addr_1byte )
			10'h00B: Config_data_wr_1byte <= 8'h00;
			10'h00C: Config_data_wr_1byte <= 8'h00;
			10'h00D: Config_data_wr_1byte <= 8'h03;		
		  	10'h00F: Config_data_wr_1byte <= 8'h04;
			10'h01C: Config_data_wr_1byte <= 8'h10;		
			10'h01D: Config_data_wr_1byte <= 8'h01;				  	
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
