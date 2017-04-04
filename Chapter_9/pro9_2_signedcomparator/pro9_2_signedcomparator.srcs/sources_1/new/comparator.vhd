----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 19:57:51
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
    generic(n:integer :=7);
    Port ( a : in signed(n downto 0);
           b : in signed(n downto 0);
           x1 : out STD_LOGIC;
           x2 : out STD_LOGIC;
           x3 : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is
begin
    x1<='1' when a>b else '0';
    x2<='1' when a=b else '0';
    x3<='1' when a<b else '0';
end Behavioral;
