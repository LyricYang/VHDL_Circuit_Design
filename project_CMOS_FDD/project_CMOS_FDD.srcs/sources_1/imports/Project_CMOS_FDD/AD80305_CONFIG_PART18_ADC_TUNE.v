/************************************************************
module name 	: AD80305_CONFIG_PART18_ADC_TUNE
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: ADC Setup:  Tune ADC Performance based on RX analog filter tune
                : corner.  Real Bandwidth: 8.606890 MHz, ADC Clock Frequency:
                : 491.520000 MHz.  The values in registers 0x200 - 0x227 need to be
                : calculated using the equations in the Calibration Guide.
                : This program is compatiable to all ADI AD936x chips

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_CONFIG_PART18_ADC_TUNE
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
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h227 ) ) 
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
		Config_addr_1byte <= 10'h200; 		
	else if ( ( Current_state == CONFIG_DATA_PART1 ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h1EB: Config_addr_1byte <= 10'h1EC;
			10'h1EC: Config_addr_1byte <= 10'h1E6;
			default: Config_addr_1byte <= 10'h1EB;
		endcase
	else if ( ( Current_state == CONFIG_DATA_PART2 ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )		     
			10'h200: Config_addr_1byte <= 10'h201;
			10'h201: Config_addr_1byte <= 10'h202;
			10'h202: Config_addr_1byte <= 10'h203;
			10'h203: Config_addr_1byte <= 10'h204;		
			10'h204: Config_addr_1byte <= 10'h205;
			10'h205: Config_addr_1byte <= 10'h206;
			10'h206: Config_addr_1byte <= 10'h207;
			10'h207: Config_addr_1byte <= 10'h208;	
			10'h208: Config_addr_1byte <= 10'h209;
			10'h209: Config_addr_1byte <= 10'h20A;
			10'h20A: Config_addr_1byte <= 10'h20B;
			10'h20B: Config_addr_1byte <= 10'h20C;	
			10'h20C: Config_addr_1byte <= 10'h20D;
			10'h20D: Config_addr_1byte <= 10'h20E;
			10'h20E: Config_addr_1byte <= 10'h20F;
			10'h20F: Config_addr_1byte <= 10'h210;	
			10'h210: Config_addr_1byte <= 10'h211;
			10'h211: Config_addr_1byte <= 10'h212;
			10'h212: Config_addr_1byte <= 10'h213;
			10'h213: Config_addr_1byte <= 10'h214;	
			10'h214: Config_addr_1byte <= 10'h215;
			10'h215: Config_addr_1byte <= 10'h216;
			10'h216: Config_addr_1byte <= 10'h217;
			10'h217: Config_addr_1byte <= 10'h218;		
			10'h218: Config_addr_1byte <= 10'h219;
			10'h219: Config_addr_1byte <= 10'h21A;
			10'h21A: Config_addr_1byte <= 10'h21B;
			10'h21B: Config_addr_1byte <= 10'h21C;	
			10'h21C: Config_addr_1byte <= 10'h21D;
			10'h21D: Config_addr_1byte <= 10'h21E;
			10'h21E: Config_addr_1byte <= 10'h21F;
			10'h21F: Config_addr_1byte <= 10'h220;	
			10'h220: Config_addr_1byte <= 10'h221;
			10'h221: Config_addr_1byte <= 10'h222;
			10'h222: Config_addr_1byte <= 10'h223;
			10'h223: Config_addr_1byte <= 10'h224;	
			10'h224: Config_addr_1byte <= 10'h225;
			10'h225: Config_addr_1byte <= 10'h226;
			10'h226: Config_addr_1byte <= 10'h227;					
			default: Config_addr_1byte <= 10'h200; 
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
			10'h1EB: Config_data_wr_1byte <= 8'h00;			// Read RxBBF C3 MSB after calibration    
			10'h1EC: Config_data_wr_1byte <= 8'h00;         // Read RxBBF C3 LSB after calibration    
			10'h1E6: Config_data_wr_1byte <= 8'h00;			// Read RxBBF R3 after calibration        
			default: Config_data_wr_1byte <= 8'h00;			
		endcase		
	else if ( Current_state == CONFIG_DATA_PART2 )
		case ( Config_addr_1byte )
			10'h200: Config_data_wr_1byte <= 8'h00;
			10'h201: Config_data_wr_1byte <= 8'h00;
			10'h202: Config_data_wr_1byte <= 8'h00;
			10'h203: Config_data_wr_1byte <= 8'h24;		
			10'h204: Config_data_wr_1byte <= 8'h24;
			10'h205: Config_data_wr_1byte <= 8'h00;
			10'h206: Config_data_wr_1byte <= 8'h00;
			10'h207: Config_data_wr_1byte <= 8'h7B;	
			10'h208: Config_data_wr_1byte <= 8'h2A;
			10'h209: Config_data_wr_1byte <= 8'h3B;
			10'h20A: Config_data_wr_1byte <= 8'h4A;
			10'h20B: Config_data_wr_1byte <= 8'h1A;	
			10'h20C: Config_data_wr_1byte <= 8'h4D;
			10'h20D: Config_data_wr_1byte <= 8'h18;
			10'h20E: Config_data_wr_1byte <= 8'h00;
			10'h20F: Config_data_wr_1byte <= 8'h7E;	
			10'h210: Config_data_wr_1byte <= 8'h7D;
			10'h211: Config_data_wr_1byte <= 8'h7E;
			10'h212: Config_data_wr_1byte <= 8'h48;
			10'h213: Config_data_wr_1byte <= 8'h47;	
			10'h214: Config_data_wr_1byte <= 8'h48;
			10'h215: Config_data_wr_1byte <= 8'h4B;
			10'h216: Config_data_wr_1byte <= 8'h4A;
			10'h217: Config_data_wr_1byte <= 8'h4B;		
			10'h218: Config_data_wr_1byte <= 8'h2E;
			10'h219: Config_data_wr_1byte <= 8'hB0;
			10'h21A: Config_data_wr_1byte <= 8'h31;
			10'h21B: Config_data_wr_1byte <= 8'h1C;	
			10'h21C: Config_data_wr_1byte <= 8'hB0;
			10'h21D: Config_data_wr_1byte <= 8'h31;
			10'h21E: Config_data_wr_1byte <= 8'h1C;
			10'h21F: Config_data_wr_1byte <= 8'hB0;	
			10'h220: Config_data_wr_1byte <= 8'h31;
			10'h221: Config_data_wr_1byte <= 8'h37;
			10'h222: Config_data_wr_1byte <= 8'h38;
			10'h223: Config_data_wr_1byte <= 8'h40;	
			10'h224: Config_data_wr_1byte <= 8'h40;
			10'h225: Config_data_wr_1byte <= 8'h2C;
			10'h226: Config_data_wr_1byte <= 8'h00;	
			10'h227: Config_data_wr_1byte <= 8'h00;	
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