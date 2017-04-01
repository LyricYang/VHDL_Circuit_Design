----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/01 18:41:45
-- Design Name: 
-- Module Name: shifter - Behavioral
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

entity shifter is
    Port ( inp : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in integer range 0 to 4;
           outp : out STD_LOGIC_VECTOR (7 downto 0));
end shifter;

architecture Behavioral of shifter is
    subtype vector is std_logic_vector(7 downto 0);
    type matrix is array(4 downto 0) of vector;
    signal row:matrix;
begin
    row(0)<="0000"&inp;
    G1:for i in 1 to 4 generate
        row(i)<=row(i-1)(6 downto 0) & '0';
    end generate;
    outp<=row(sel);
end Behavioral;
