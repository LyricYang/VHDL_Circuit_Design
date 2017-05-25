`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/02/26 15:08:54
// Design Name: 
// Module Name: Test4SPI
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Test4In(

    );
    /* Inputs */
    // SPI_INTF
    reg         Clk;
    reg         Reset;
    reg         Config_en;             //* High active pluse to start the SPI operation, be sure to hold several clock cycles
    reg         Config_wr_rd;          //* 1'b1: Write, 1'b0: Read
    reg [9:0]   Config_addr;           //* Address which is writed to AD80305
    reg [7:0]   Config_data_wr;        //* Data which is writed to AD80305
    reg         Spi_do;                //* AD80305 SPI DO interface
    
    //CONFIG_PART1
    // reg Clk;
    // reg Reset;
    reg         Config_start;          //* A high active signal to start the whole operation
    wire         Config_done_1byte;     //* A high active signal to indicate 1-byte-configuration data has been send to AD80305 through SPI interface
    
    /* Outputs */
    // SPI_INTF
    wire    [7:0]   Config_data_rd;	   //* Data which is readed from AD80305
    wire            Spi_enb;          //* AD80305 SPI ENB interface
    wire            Spi_clk;          //* AD80305 SPI CLK interface
    wire            Spi_di;           //* AD80305 SPI DI interface
    
    // CONFIG_PART1
    wire            Config_en_1byte;
    wire            Config_wr_rd_1byte;
    wire    [9:0]   Config_addr_1byte;
    wire    [7:0]   Config_data_wr_1byte;    
    wire            Config_end;       //* A high active signal to end the whole operation
    
    /* Others */
    //=============================================================================
    //* Parameters
    //=============================================================================
    //* FSM Parameters
    parameter   [5:0]   IDLE = 6'd0;                                                                   
    parameter   [5:0]   CONFIG_PART1 = 6'd1;
    parameter   [5:0]   CONFIG_END = 6'd63; 
    
     
    //=============================================================================
    //* Variable declaration 
    //=============================================================================
    //* Wires
    wire        En_agc_ad80305;
    
    //* Regs
    reg             Start_config_whole;  
    reg     [5:0]   Current_state;
    reg     [5:0]   Current_state_reg;
    reg     [5:0]   Next_state;
    
    reg     [7:0]   Rd_data_1byte;			//* Read back one data from AD80305 when you set from outside 
    reg             Config_initial_done;    //* The whole initial configure operation is done
    reg             Enable_ad80305;
    reg             Txnrx_ad80305;

//* [1]    
    // Initail for Clk & Reset
    initial begin
    // Initialize Inputs
    Clk = 0;
    Reset = 0;  
    Start_config_whole = 0;
    
    // Wait 100 ns for global reset to finish
    #100;
                          
    Reset = 1;
    #10 Reset = 0;
    Start_config_whole = 1;
    #10 Start_config_whole = 0;                     
end
               
always begin
    #1 Clk = 0;
    #1 Clk = 1;
end

//* [2]
//* FSM which control and write data to AD80305
//* Initial configuration
//*		  ___________________________
//*		  |							|
//*		  |							|
//* 	IDLE --> CONFIG_PART1 --> CONFIG_DONE 
//*
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
            if ( Start_config_whole == 1'b1 )  
                Next_state = CONFIG_PART1;
            else
                Next_state = IDLE;
                
        CONFIG_PART1:
        	if ( Config_end == 1'b1 )  
        		Next_state = CONFIG_END; 
        	else
        		Next_state = CONFIG_PART1;     
        		
        CONFIG_END:
        	if ( Reset == 1'b1 )
                Next_state = IDLE;
            else
                Next_state = CONFIG_END;
    endcase                
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_start <= 1'b0;
	else if ( ( Current_state == CONFIG_PART1 ) && ( Current_state_reg == IDLE ) )
		Config_start <= 1'b1;
	else
		Config_start <= 1'b0;
end	

AD80305_CONFIG_PART1	U_AD80305_CONFIG_PART1
    (
    //* Inputs
    .Clk					( Clk ),                    		
    .Reset					( Reset ),							
    .Config_strat			( Config_start ),					
    .Config_done_1byte		( Config_done_1byte ),
    
    //* Outputs
    .Config_en_1byte		( Config_en_1byte ),
    .Config_wr_rd_1byte		( Config_wr_rd_1byte ),
    .Config_addr_1byte		( Config_addr_1byte ),
    .Config_data_wr_1byte	( Config_data_wr_1byte ),    
    .Config_end				( Config_end )					
    );
    
//* [3]
//* Module "AD80305_SPI_READ_WRITE" Interface signals
//* 1: Initial configuration
//* 2: Configuration parameters from outside
//* 
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_en <= 1'b0;
	else
		case ( Current_state )
			IDLE: 							  Config_en <= 1'b0;
			CONFIG_PART1: 					  Config_en <= Config_en_1byte;                                   
			CONFIG_END: 					  Config_en <= 1'b0;
			default:                          Config_en <= 1'b0;   
		endcase					
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_wr_rd <= 1'b0;
	else 
		case ( Current_state )
			IDLE: 							  Config_wr_rd <= 1'b0;
			CONFIG_PART1: 					  Config_wr_rd <= Config_wr_rd_1byte;                 		                        
			CONFIG_END: 					  Config_wr_rd <= 1'b0;
			default:                          Config_wr_rd <= 1'b0;   
		endcase
end		                
			
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_addr <= 10'b0;
	else 
		case ( Current_state )
			IDLE: 							  Config_addr <= 10'b0;
			CONFIG_PART1: 					  Config_addr <= Config_addr_1byte;                 
			CONFIG_END: 					  Config_addr <= 10'b0;
			default:                          Config_addr <= 10'b0;   
		endcase
end	

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_data_wr <= 1'b0;
	else 
		case ( Current_state )
			IDLE: 							  Config_data_wr <= 8'b0;    			
			CONFIG_PART1: 					  Config_data_wr <= Config_data_wr_1byte;                 
			CONFIG_END: 					  Config_data_wr <= 8'b0;
			default:                          Config_data_wr <= 8'b0;   
		endcase
end			
		
//* [4]
//* Wirte or Read operation of SPI Interface
//*
AD80305_SPI_READ_WRITE		U1_AD80305_SPI_READ_WRITE
    (
    //* Inputs
    .Clk				( Clk ),
    .Reset				( Reset ),
    .Config_en			( Config_en ),			
    .Config_wr_rd		( Config_wr_rd ),		
    .Config_addr		( Config_addr ),		
    .Config_data_wr		( Config_data_wr ),		
    .Spi_do				( Spi_do ),
    
    //* Outputs
    .Config_data_rd		( Config_data_rd ),		
    .Config_done		( Config_done_1byte ),
    .Spi_enb			( Spi_enb ),
    .Spi_clk			( Spi_clk ),
    .Spi_di 			( Spi_di )
    );  

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Rd_data_1byte <= 8'b0;
	else if ( Current_state == IDLE ) 
		Rd_data_1byte <= Config_data_rd;
	else
		Rd_data_1byte <= 8'b0;
end	

//* [5]
//* The initial operation is right or not
//*

//* [6]
//* All the initial registers have been transmitted to AD80305 with the right way
//* The initial operation is done
//*
always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Config_initial_done <= 1'b0;
	else if ( Start_config_whole == 1'b1 ) 
		Config_initial_done <= 1'b0;        
    else if ( Current_state == CONFIG_END ) 
        Config_initial_done <= 1'b1;
    else
        ;
end  

//* [7]
//* ENSM Control
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Enable_ad80305 <= 1'b0;
	else if ( Start_config_whole == 1'b1 )
		Enable_ad80305 <= 1'b0;
	else if ( Current_state == CONFIG_END )
		Enable_ad80305 <= 1'b1;
	else
		;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Txnrx_ad80305 <= 1'b0;
	else if ( Start_config_whole == 1'b1 )
		Txnrx_ad80305 <= 1'b0;
	else if ( Current_state == CONFIG_END )
		Txnrx_ad80305 <= 1'b1;
	else
		;
end

assign En_agc_ad80305 = 1'b0;

endmodule
