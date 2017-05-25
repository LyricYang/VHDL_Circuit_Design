-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2.1 (win64) Build 1302555 Wed Aug  5 13:06:02 MDT 2015
-- Date        : Thu Sep 08 10:25:30 2016
-- Host        : user-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/Project_CMOS_FDD/project_CMOS_FDD/project_CMOS_FDD.srcs/sources_1/ip/DDR_FDD_IN/DDR_FDD_IN_stub.vhdl
-- Design      : DDR_FDD_IN
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DDR_FDD_IN is
  Port ( 
    data_in_from_pins : in STD_LOGIC_VECTOR ( 12 downto 0 );
    data_in_to_device : out STD_LOGIC_VECTOR ( 25 downto 0 );
    clk_in : in STD_LOGIC;
    clk_out : out STD_LOGIC;
    io_reset : in STD_LOGIC
  );

end DDR_FDD_IN;

architecture stub of DDR_FDD_IN is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "data_in_from_pins[12:0],data_in_to_device[25:0],clk_in,clk_out,io_reset";
begin
end;
