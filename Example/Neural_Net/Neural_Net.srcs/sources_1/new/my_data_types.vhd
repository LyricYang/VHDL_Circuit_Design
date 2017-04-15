----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/15 10:15:34
-- Design Name: 
-- Module Name: my_data_types - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
PACKAGE my_data_types IS
    CONSTANT b: INTEGER:=3;
    TYPE vector_array_in IS ARRAY(NATURAL RANGE<>) OF SIGNED(b-1 DOWNTO 0);
    TYPE vector_array_out IS ARRAY(NATURAL RANGE<>) OF SIGNED(2*b-1 DOWNTO 0);
END my_data_types;