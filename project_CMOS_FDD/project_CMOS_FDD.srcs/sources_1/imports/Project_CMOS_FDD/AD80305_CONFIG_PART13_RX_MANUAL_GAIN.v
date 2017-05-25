/************************************************************
module name 	: AD80305_CONFIG_PART13_RX_MANUAL_GAIN
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: Setup Rx Manual Gain Registers,This program is compatiable to all ADI AD936x chips

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_CONFIG_PART13_RX_MANUAL_GAIN
    (
    //* Inputs
    Clk,                    		//* 30.72MHz
    Reset,							//* Reset
    Config_strat,					//* A high active signal to start the whole operation
    Config_done_1byte,
    Rx_gain_initial,
    
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
input	[6:0]	Rx_gain_initial;

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
parameter   [1:0]   CONFIG_DATA = 2'b01;
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
                Next_state = CONFIG_DATA;
            else
                Next_state = IDLE;                   
				
		CONFIG_DATA:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h081 ) ) 
				Next_state = CONFIG_END;	
			else
				Next_state = CONFIG_DATA; 									
		
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
	else if ( Current_state == CONFIG_DATA ) 
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
	else if ( ( Current_state == CONFIG_DATA ) && ( Current_state_reg == IDLE ) )
		Config_addr_1byte <= 10'h0FA; 
	else if ( ( Current_state == CONFIG_DATA ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h0FA: Config_addr_1byte <= 10'h0FB;			
			10'h0FB: Config_addr_1byte <= 10'h0FC;
			10'h0FC: Config_addr_1byte <= 10'h0FD;
			10'h0FD: Config_addr_1byte <= 10'h0FE;		
			10'h0FE: Config_addr_1byte <= 10'h100;
			10'h100: Config_addr_1byte <= 10'h104;
			10'h104: Config_addr_1byte <= 10'h105;
			10'h105: Config_addr_1byte <= 10'h107;	
			10'h107: Config_addr_1byte <= 10'h108;
			10'h108: Config_addr_1byte <= 10'h109;	
			10'h109: Config_addr_1byte <= 10'h10A;
			10'h10A: Config_addr_1byte <= 10'h10B;		
			10'h10B: Config_addr_1byte <= 10'h10C;
			10'h10C: Config_addr_1byte <= 10'h10D;
			10'h10D: Config_addr_1byte <= 10'h10E;
			10'h10E: Config_addr_1byte <= 10'h114;	
			10'h114: Config_addr_1byte <= 10'h11A;
			10'h11A: Config_addr_1byte <= 10'h081;						
			default: Config_addr_1byte <= 10'h0FA;
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
	else if ( Current_state == CONFIG_DATA )
		case ( Config_addr_1byte )
			10'h0FA: Config_data_wr_1byte <= 8'hE0;			// Gain Control Mode Select                          
			10'h0FB: Config_data_wr_1byte <= 8'h08;         // Table, Digital Gain, Man Gain Ctrl                
			10'h0FC: Config_data_wr_1byte <= 8'h23;		    // Incr Step Size, ADC Overrange Size                
		  	10'h0FD: Config_data_wr_1byte <= 8'h4C;         // Max Full/LMT Gain Table Index                     
			10'h0FE: Config_data_wr_1byte <= 8'h44;		    // Decr Step Size, Peak Overload Time                
			10'h100: Config_data_wr_1byte <= 8'h6F;         // Max Digital Gain                                  
			10'h104: Config_data_wr_1byte <= 8'h2F;         // ADC Small Overload Threshold                      
			10'h105: Config_data_wr_1byte <= 8'h3A;		    // ADC Large Overload Threshold                      
		  	10'h107: Config_data_wr_1byte <= 8'h31;         // Large LMT Overload Threshold                      
			10'h108: Config_data_wr_1byte <= 8'h39;	        // Small LMT Overload Threshold                      
			10'h109: Config_data_wr_1byte <= { 1'b0, Rx_gain_initial };		//* Rx1 Full/LMT Gain Index	*//                           	
		  	10'h10A: Config_data_wr_1byte <= 8'h58;         // Rx1 LPF Gain Index                                
			10'h10B: Config_data_wr_1byte <= 8'h00;		    // Rx1 Digital Gain Index                            
			10'h10C: Config_data_wr_1byte <= { 1'b0, Rx_gain_initial };			//* Rx2 Full/LMT Gain Index *//                           
			10'h10D: Config_data_wr_1byte <= 8'h18;         // Rx2 LPF Gain Index                                
			10'h10E: Config_data_wr_1byte <= 8'h00;		    // Rx2 Digital Gain Index                            
		  	10'h114: Config_data_wr_1byte <= 8'h30;         // Low Power Threshold                               
			10'h11A: Config_data_wr_1byte <= 8'h27;	        // Initial LMT Gain Limit                            
			10'h081: Config_data_wr_1byte <= 8'h00;			// Tx Symbol Gain Control                            		  	
		  	default: Config_data_wr_1byte <= 8'hE0;
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