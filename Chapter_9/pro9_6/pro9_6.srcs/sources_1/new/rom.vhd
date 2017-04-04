----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 20:42:50
-- Design Name: 
-- Module Name: rom - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom is
    generic(bits: integer :=8;
            words: integer :=8);
    Port ( addr : in integer range 0 to words-1;
           data : out STD_LOGIC_vector(bits-1 downto 0));
end rom;

architecture Behavioral of rom is
    type vector_array is array (0 to words-1) of std_logic_vector(bits-1 downto 0);
    constant memory:vector_array:=("00000000","00000010","00000100","00001000",
                                   "00010000","00100000","01000000","10000000");
    begin
        data<=memory(addr);
end Behavioral;
