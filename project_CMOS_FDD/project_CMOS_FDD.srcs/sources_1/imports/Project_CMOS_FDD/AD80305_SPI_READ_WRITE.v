/************************************************************
module name 	: AD80305_SPI_READ_WRITE
project			: AD936x FPGA
version			: 0.1
author			: ShangHai HanRu
called by		: 
calling			:
description		: Configure AD80305 when "Config_en" is a high active pluse, Read or Write operation

revision history:
---------------------------------------------------------------
1. 2013-01-23, initial version
---------------------------------------------------------------
*************************************************************/

module  AD80305_SPI_READ_WRITE
    (
    //* Inputs
    Clk,
    Reset,
    Config_en,			//* High active pluse to start the SPI operation, be sure to hold several clock cycles
    Config_wr_rd,		//* 1'b1: Write, 1'b0: Read
    Config_addr,		//* Address which is writed to AD80305
    Config_data_wr,		//* Data which is writed to AD80305
    Spi_do,				//* AD80305 SPI DO interface
    
    //* Outputs
    Config_data_rd,		//* Data which is readed from AD80305
    Config_done,		//* ACK signal, told the interface module that the "Write" or "Read" operation is done
    Spi_enb,			//* AD80305 SPI ENB interface
    Spi_clk,			//* AD80305 SPI CLK interface
    Spi_di				//* AD80305 SPI DI interface
    );

//*
//* Key Signals Timing
//*
//* Config_en			_________________|------|_____________________________________________   
//* Config_wr_rd		__________|--------------------------|________________________________
//* Config_addr			__________|			 10h028			 |________________________________
//* Config_data_wr      __________|			 8'h39			 |________________________________


//=============================================================================
//* Inputs and Outputs
//=============================================================================
//* Inputs
input           Clk;
input           Reset;
input           Config_en;
input			Config_wr_rd;
input   [9:0]   Config_addr;
input	[7:0]	Config_data_wr;
input			Spi_do;

//* Outputs
output  [7:0]   Config_data_rd;
output          Config_done;
output          Spi_enb;
output          Spi_clk;
output          Spi_di;


//=============================================================================
//* Variable declaration 
//=============================================================================
//* Wires
wire			Config_start;

//* Regs
reg		[1:0]	Config_en_reg;
reg				Config_wr_rd_reg;    
reg		[9:0]	Config_addr_reg;
reg		[7:0]	Config_data_wr_reg;
reg     [1:0]   Cnt_clk;
reg     [4:0]   Cnt_num;
reg             Spi_enb_tmp = 1'b1;
reg             Spi_enb = 1'b1;
reg             Spi_clk_tmp;
reg             Spi_clk;
reg             Spi_di;
reg             Spi_di_tmp1;
reg             Spi_di_tmp2;
reg				Spi_do_reg1;
reg				Spi_do_reg2;
reg		[7:0]   Config_data_rd;
reg		[7:0]   Config_data_rd_tmp;
reg             Config_done_tmp;
reg     [7:0]   Config_done_tmp2;
reg             Config_done;


//=============================================================================
//* Model Body
//============================================================================= 

//* [1]
//* Find the posedge of signal "Config_en" to start the SPI write operation
//* Capture the indication of "Write" or "Read"  
//* Capture the address to be writed to AD80305
//* Capture the data to be writed to AD80305
//*
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_en_reg <= 2'b0;
	else
		Config_en_reg <= { Config_en_reg[0], Config_en };
end

assign Config_start = ( ( Config_en_reg[0] == 1'b1 ) && ( Config_en_reg[1] == 1'b0 ) ) ? 1'b1 : 1'b0;	

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_wr_rd_reg <= 1'b0;
	else if ( Config_en == 1'b1 )
		Config_wr_rd_reg <= Config_wr_rd;
	else
		;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_addr_reg <= 10'b0;
	else if ( Config_en == 1'b1 )
		Config_addr_reg <= Config_addr;
	else
		;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_data_wr_reg <= 8'b0;
	else if ( Config_en == 1'b1 )
		Config_data_wr_reg <= Config_data_wr;
	else
		;
end


//* [2]
//* AD80305 SPI operation
//* Be sure that AD80305 use the falling egde of SPI_CLK to sample the SPI_DI
//*
//* The speed of SPI is Clk/4
always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Cnt_clk <= 2'b0;
    else
        if ( Config_start == 1'b1 )
            Cnt_clk <= 2'b0;
        else
            Cnt_clk <= Cnt_clk + 2'b01;
end

//* How many bits will be configured to AD80305
always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Cnt_num <= 5'b0;
    else
        if ( Config_start == 1'b1 )
            Cnt_num <= 5'b0;
        else if ( ( Cnt_clk == 2'd3 ) && ( Cnt_num <= 5'd24 ) )
            Cnt_num <= Cnt_num + 5'b01;
        else
            ;
end
    	
//* SPI ENB
always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Spi_enb_tmp <= 1'b1;
    else
        if ( Config_start == 1'b1 )
            Spi_enb_tmp <= 1'b0;
        else if ( ( Cnt_num == 5'd24 ) && ( Cnt_clk == 2'b01 ) )
            Spi_enb_tmp <= 1'b1;
        else
            ;
end

always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Spi_enb <= 1'b1;
    else
        Spi_enb <= Spi_enb_tmp;
end        

//* SPI CLK
always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Spi_clk_tmp <= 1'b0;
    else
        if ( Config_start == 1'b1 )
            Spi_clk_tmp <= 1'b0; 
        else if ( Cnt_clk == 2'b01 )
            Spi_clk_tmp <= 1'b1;
        else if ( Cnt_clk == 2'b11 )
            Spi_clk_tmp <= 1'b0;
        else
            ;
end

always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Spi_clk <= 1'b0;
    else
        Spi_clk <= Spi_clk_tmp & ( ~Spi_enb_tmp );
end

//* SPI DI
always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Spi_di_tmp1 <= 1'b0;
    else if ( ( Spi_enb_tmp == 1'b0 ) && ( Config_wr_rd_reg == 1'b1 ) )
        case ( Cnt_num )
            5'd0 : Spi_di_tmp1 <= 1'b1;          		//* 1'b1: Write   
            5'd1 : Spi_di_tmp1 <= 1'b0;					//* NB2 
            5'd2 : Spi_di_tmp1 <= 1'b0;					//* NB1 
            5'd3 : Spi_di_tmp1 <= 1'b0; 				//* NB0                      
            5'd4 : Spi_di_tmp1 <= 1'b0;					//* D11 
            5'd5 : Spi_di_tmp1 <= 1'b0;					//* D10
            5'd6 : Spi_di_tmp1 <= Config_addr_reg[9];		//* Address[9:0]
            5'd7 : Spi_di_tmp1 <= Config_addr_reg[8];
            5'd8 : Spi_di_tmp1 <= Config_addr_reg[7];     
            5'd9 : Spi_di_tmp1 <= Config_addr_reg[6];
            5'd10: Spi_di_tmp1 <= Config_addr_reg[5];
            5'd11: Spi_di_tmp1 <= Config_addr_reg[4];                       
            5'd12: Spi_di_tmp1 <= Config_addr_reg[3];   
            5'd13: Spi_di_tmp1 <= Config_addr_reg[2];
            5'd14: Spi_di_tmp1 <= Config_addr_reg[1];
            5'd15: Spi_di_tmp1 <= Config_addr_reg[0];
            5'd16: Spi_di_tmp1 <= Config_data_wr_reg[7];		
            5'd17: Spi_di_tmp1 <= Config_data_wr_reg[6];
            5'd18: Spi_di_tmp1 <= Config_data_wr_reg[5];
            5'd19: Spi_di_tmp1 <= Config_data_wr_reg[4];         
            5'd20: Spi_di_tmp1 <= Config_data_wr_reg[3];
            5'd21: Spi_di_tmp1 <= Config_data_wr_reg[2];
            5'd22: Spi_di_tmp1 <= Config_data_wr_reg[1];
            5'd23: Spi_di_tmp1 <= Config_data_wr_reg[0];
            default: Spi_di_tmp1 <= 1'b0;
        endcase
    else if ( ( Spi_enb_tmp == 1'b0 ) && ( Config_wr_rd_reg == 1'b0 ) )
        case ( Cnt_num )
            5'd0 : Spi_di_tmp1 <= 1'b0;          		//* 1'b1: Read   
            5'd1 : Spi_di_tmp1 <= 1'b0;					//* NB2 
            5'd2 : Spi_di_tmp1 <= 1'b0;					//* NB1 
            5'd3 : Spi_di_tmp1 <= 1'b0; 				//* NB0                      
            5'd4 : Spi_di_tmp1 <= 1'b0;					//* D11 
            5'd5 : Spi_di_tmp1 <= 1'b0;					//* D10
            5'd6 : Spi_di_tmp1 <= Config_addr_reg[9];		//* Address[9:0]
            5'd7 : Spi_di_tmp1 <= Config_addr_reg[8];
            5'd8 : Spi_di_tmp1 <= Config_addr_reg[7];     
            5'd9 : Spi_di_tmp1 <= Config_addr_reg[6];
            5'd10: Spi_di_tmp1 <= Config_addr_reg[5];
            5'd11: Spi_di_tmp1 <= Config_addr_reg[4];                       
            5'd12: Spi_di_tmp1 <= Config_addr_reg[3];   
            5'd13: Spi_di_tmp1 <= Config_addr_reg[2];
            5'd14: Spi_di_tmp1 <= Config_addr_reg[1];
            5'd15: Spi_di_tmp1 <= Config_addr_reg[0];
            5'd16: Spi_di_tmp1 <= 1'b0;		
            5'd17: Spi_di_tmp1 <= 1'b0;
            5'd18: Spi_di_tmp1 <= 1'b0;
            5'd19: Spi_di_tmp1 <= 1'b0;         
            5'd20: Spi_di_tmp1 <= 1'b0;
            5'd21: Spi_di_tmp1 <= 1'b0;
            5'd22: Spi_di_tmp1 <= 1'b0;
            5'd23: Spi_di_tmp1 <= 1'b0;
            default: Spi_di_tmp1 <= 1'b0;
        endcase        
    else
        Spi_di_tmp1 <= 1'b0;        
end  

always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Spi_di_tmp2 <= 1'b0;
    else
    	Spi_di_tmp2 <= Spi_di_tmp1;
end

always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Spi_di <= 1'b0;
    else
    	Spi_di <= Spi_di_tmp2;
end
    	                                          
//* SPI DO
//* Get the data which is readed from AD80305	
always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_data_rd_tmp <= 8'b0;
	else if ( ( Cnt_num >= 5'd17 ) && ( Cnt_num <= 5'd24 ) && ( Spi_enb_tmp == 1'b0 ) && ( Cnt_clk == 2'b00 ) )
		Config_data_rd_tmp <= { Config_data_rd_tmp[6:0], Spi_do };
	else
		;
end

always @ ( posedge Clk or posedge Reset )
begin
	if ( Reset == 1'b1 )
		Config_data_rd <= 8'b0;
	else if ( ( Cnt_num == 5'd24 ) && ( Spi_enb_tmp == 1'b0 ) && ( Cnt_clk == 2'b01 ) )
		Config_data_rd <= Config_data_rd_tmp;
	else
		;
end			
		

//* [3]
//* SPI write operation is done, a high active pluse 
//* Delay 8 Clk cycle after SPI_ENB rising edge 
//*
always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Config_done_tmp <= 1'b0;
    else
        if ( ( Spi_enb_tmp == 1'b0 ) && ( Cnt_num == 5'd24 ) && ( Cnt_clk == 2'b01 ) )
            Config_done_tmp <= 1'b1;
        else
            Config_done_tmp <= 1'b0;
end

always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Config_done_tmp2 <= 1'b0;
    else
        Config_done_tmp2[7:0] <= { Config_done_tmp2[6:0], Config_done_tmp };
end

always @ ( posedge Clk or posedge Reset )
begin
    if ( Reset == 1'b1 )
        Config_done <= 1'b0;
    else
        Config_done <= Config_done_tmp2[7];
end                                    


endmodule    