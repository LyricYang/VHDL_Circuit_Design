/************************************************************
module name 	: AD80305_CONFIG_PART10_RFVCO
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: Setup Synthesizer

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_CONFIG_PART10_RFVCO
    (
    //* Inputs
    Clk,                    		//* 30.72MHz
    Reset,							//* Reset
    Config_strat,					//* A high active signal to start the whole operation
    Config_done_1byte,
    Config_data_rd_1byte,
    RxVCO_divider,
    Freq_rx_integer,
    Freq_rx_fractional,
    TxVCO_divider,
    Freq_tx_integer,
    Freq_tx_fractional,    
    
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
input   [2:0]   RxVCO_divider;
input	[10:0]	Freq_rx_integer;
input	[22:0]	Freq_rx_fractional;
input   [2:0]   TxVCO_divider;
input	[10:0]	Freq_tx_integer;
input	[22:0]	Freq_tx_fractional;

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
parameter   [2:0]   CONFIG_DATA_PART2 = 3'b010;
parameter	[2:0]	RX_RF_PLL_LOCK = 3'b011;
parameter	[2:0]	TX_RF_PLL_LOCK = 3'b100;
parameter   [2:0]   CONFIG_END = 3'b101;


//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire			Config_en_1byte_tmp;

//* Regs
reg				Config_strat_reg1;
reg				Config_strat_reg2;
reg		[2:0]	Current_state;
reg		[2:0]	Next_state;
reg		[2:0]	Current_state_reg;
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
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h005 ) ) 
				Next_state = CONFIG_DATA_PART2;						
			else
				Next_state = CONFIG_DATA_PART1; 					

		CONFIG_DATA_PART2:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_addr_1byte == 10'h005 ) ) 
				Next_state = RX_RF_PLL_LOCK;						
			else
				Next_state = CONFIG_DATA_PART2; 				
				
		RX_RF_PLL_LOCK:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_data_rd_1byte[1] == 1'b1 ) )	
				Next_state = TX_RF_PLL_LOCK;
			else
				Next_state = RX_RF_PLL_LOCK;	
				
		TX_RF_PLL_LOCK:
			if ( ( Config_done_1byte == 1'b1 ) && ( Config_data_rd_1byte[1] == 1'b1 ) )	
				Next_state = CONFIG_END;
			else
				Next_state = TX_RF_PLL_LOCK;													
		
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
	else if ( ( Current_state == CONFIG_DATA_PART1 ) || ( Current_state == CONFIG_DATA_PART2 ) 
			|| ( Current_state == RX_RF_PLL_LOCK ) || ( Current_state == TX_RF_PLL_LOCK ) )
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
	else if ( ( Current_state == CONFIG_DATA_PART1 ) || ( Current_state == CONFIG_DATA_PART2 ) )
		Config_wr_rd_1byte <= Config_en_1byte_tmp;
	else if ( ( Current_state == RX_RF_PLL_LOCK ) || ( Current_state == TX_RF_PLL_LOCK ) )
		Config_wr_rd_1byte <= 1'b0;	
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
		Config_addr_1byte <= 10'h23A; 
	else if ( ( Current_state == CONFIG_DATA_PART2 ) && ( Current_state_reg == CONFIG_DATA_PART1 ) )
		Config_addr_1byte <= 10'h273; 	
	else if ( Current_state == RX_RF_PLL_LOCK )
		Config_addr_1byte <= 10'h247;  
	else if ( Current_state == TX_RF_PLL_LOCK )
		Config_addr_1byte <= 10'h287; 		
	else if ( ( Current_state == CONFIG_DATA_PART1 ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )
			10'h23A: Config_addr_1byte <= 10'h239;	
			10'h239: Config_addr_1byte <= 10'h242;	
			10'h242: Config_addr_1byte <= 10'h238;	
			10'h238: Config_addr_1byte <= 10'h245;	
			10'h245: Config_addr_1byte <= 10'h251;	
			10'h251: Config_addr_1byte <= 10'h250;	
			10'h250: Config_addr_1byte <= 10'h23B;	
			10'h23B: Config_addr_1byte <= 10'h23E;	
			10'h23E: Config_addr_1byte <= 10'h23F;	
			10'h23F: Config_addr_1byte <= 10'h240;	
			10'h240: Config_addr_1byte <= 10'h27A;	
			10'h27A: Config_addr_1byte <= 10'h279;	
			10'h279: Config_addr_1byte <= 10'h282;	
			10'h282: Config_addr_1byte <= 10'h278;	
			10'h278: Config_addr_1byte <= 10'h285;	
			10'h285: Config_addr_1byte <= 10'h291;	
			10'h291: Config_addr_1byte <= 10'h290;	
			10'h290: Config_addr_1byte <= 10'h27B;	
			10'h27B: Config_addr_1byte <= 10'h27E;	
			10'h27E: Config_addr_1byte <= 10'h27F;	
			10'h27F: Config_addr_1byte <= 10'h280;	
			10'h280: Config_addr_1byte <= 10'h233;	
			10'h233: Config_addr_1byte <= 10'h234;	
			10'h234: Config_addr_1byte <= 10'h235;	
			10'h235: Config_addr_1byte <= 10'h232;	
			10'h232: Config_addr_1byte <= 10'h231;	
			10'h231: Config_addr_1byte <= 10'h005;
			default: Config_addr_1byte <= 10'h23A;
		endcase			
	else if ( ( Current_state == CONFIG_DATA_PART2 ) && ( Config_done_1byte == 1'b1 ) )
		case ( Config_addr_1byte )				
			10'h273: Config_addr_1byte <= 10'h274;	
			10'h274: Config_addr_1byte <= 10'h275;	
			10'h275: Config_addr_1byte <= 10'h272;	
			10'h272: Config_addr_1byte <= 10'h271;	
			10'h271: Config_addr_1byte <= 10'h005;											
			default: Config_addr_1byte <= 10'h273;
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
			10'h23A: Config_data_wr_1byte <= 8'h4A;			// Set VCO Output level[3:0]                                     
			10'h239: Config_data_wr_1byte <= 8'hC1;	        // Set Init ALC Value[3:0] and VCO Varactor[3:0]                 
			10'h242: Config_data_wr_1byte <= 8'h0E;         // Set VCO Bias Tcf[1:0] and VCO Bias Ref[2:0]                   
			10'h238: Config_data_wr_1byte <= 8'h78;		    // Set VCO Cal Offset[3:0]                                       
			10'h245: Config_data_wr_1byte <= 8'h00;         // Set VCO Cal Ref Tcf[2:0]                                      
			10'h251: Config_data_wr_1byte <= 8'h0B;	        // Set VCO Varactor Reference[3:0]                               
			10'h250: Config_data_wr_1byte <= 8'h70;         // Set VCO Varactor Ref Tcf[2:0] and VCO Varactor Offset[3:0]    
			10'h23B: Config_data_wr_1byte <= 8'h91;		    // Set Synth Loop Filter charge pump current (Icp)               
			10'h23E: Config_data_wr_1byte <= 8'hF4;         // Set Synth Loop Filter C2 and C1                               
			10'h23F: Config_data_wr_1byte <= 8'hDF;	        // Set Synth Loop Filter  R1 and C3                              
			10'h240: Config_data_wr_1byte <= 8'h0A;         // Set Synth Loop Filter R3                                      
			10'h27A: Config_data_wr_1byte <= 8'h4A;			// Set VCO Output level[3:0]                                       	
			10'h279: Config_data_wr_1byte <= 8'hC1;         // Set Init ALC Value[3:0] and VCO Varactor[3:0]                   
			10'h282: Config_data_wr_1byte <= 8'h0E;	        // Set VCO Bias Tcf[1:0] and VCO Bias Ref[2:0]                     
			10'h278: Config_data_wr_1byte <= 8'h78;         // Set VCO Cal Offset[3:0]                                         
			10'h285: Config_data_wr_1byte <= 8'h00;	        // Set VCO Cal Ref Tcf[2:0]                                        
			10'h291: Config_data_wr_1byte <= 8'h0B;         // Set VCO Varactor Reference[3:0]                                 
			10'h290: Config_data_wr_1byte <= 8'h70;	        // Set VCO Varactor Ref Tcf[2:0] and VCO Varactor Offset[3:0]      
			10'h27B: Config_data_wr_1byte <= 8'h95;         // Set Synth Loop Filter charge pump current (Icp)                 
			10'h27E: Config_data_wr_1byte <= 8'hF4;		    // Set Synth Loop Filter C2 and C1                                 
			10'h27F: Config_data_wr_1byte <= 8'hDF;         // Set Synth Loop Filter  R1 and C3                                
			10'h280: Config_data_wr_1byte <= 8'h0A;	        // Set Synth Loop Filter R3                                        
			10'h233: Config_data_wr_1byte <= Freq_rx_fractional[7:0];				// Write Rx Synth Fractional Freq Word[7:0]                     
			10'h234: Config_data_wr_1byte <= Freq_rx_fractional[15:8];				// Write Rx Synth Fractional Freq Word[15:8]                    									  	
			10'h235: Config_data_wr_1byte <= { 1'b0, Freq_rx_fractional[22:16] };	// Write Rx Synth Fractional Freq Word[22:16]                   
			10'h232: Config_data_wr_1byte <= { 5'b0, Freq_rx_integer[10:8] };		// Write Rx Synth Integer Freq Word[10:8]                       
			10'h231: Config_data_wr_1byte <= Freq_rx_integer[7:0];       			// Write Rx Synth Integer Freq Word[7:0]                        
			10'h005: Config_data_wr_1byte <= {TxVCO_divider,1'b0,RxVCO_divider};    // Set LO divider setting
		  	default: Config_data_wr_1byte <= 8'h4A;
		endcase                                                  
	else if ( Current_state == CONFIG_DATA_PART2 )               
		case ( Config_addr_1byte )                               
            10'h273: Config_data_wr_1byte <= Freq_tx_fractional[7:0];				// Write Tx Synth Fractional Freq Word[7:0]     	         
            10'h274: Config_data_wr_1byte <= Freq_tx_fractional[15:8];				// Write Tx Synth Fractional Freq Word[15:8]         
            10'h275: Config_data_wr_1byte <= { 1'b0, Freq_tx_fractional[22:16] };	// Write Tx Synth Fractional Freq Word[22:16]   
            10'h272: Config_data_wr_1byte <= { 5'b0, Freq_tx_integer[10:8] };		// Write Tx Synth Integer Freq Word[10:8]       
            10'h271: Config_data_wr_1byte <= Freq_tx_integer[7:0];       			// Write Tx Synth Integer Freq Word[7:0]        
            10'h005: Config_data_wr_1byte <= {TxVCO_divider,1'b0,RxVCO_divider};    // Set LO divider setting
            default: Config_data_wr_1byte <= 8'hF2;
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