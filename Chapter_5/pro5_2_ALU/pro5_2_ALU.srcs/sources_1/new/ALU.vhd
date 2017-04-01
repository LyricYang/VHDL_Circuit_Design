----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/01 16:52:54
-- Design Name: 
-- Module Name: ALU - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           y : out STD_LOGIC_VECTOR(7 DOWNTO 0));
end ALU;

architecture Behavioral of ALU is
    SIGNAL arith,logic:STD_LOGIC_VECTOR(7 DOWNTO 0);
begin
    ------------------Arirhmetic unit------------------
    WITH sel (2 DOWNTO 0) SELECT
        arith<=a when "000",
               a+1 when "001",
               a-1 when "010",
               b when "011",
               b+1 when "100",
               b-1 when "101",
               a+b when "110",
               a+b+cin when others;
               
    -------------------Logic unit------------------------
    WITH sel (2 DOWNTO 0) SELECT
        logic<=Not a when "000",
               Not b when "001",
               a AND b when "010",
               a OR b when "011",
               a NAND b when "100",
               a NOR b when "101",
               a XOR b when "110",
               NOT(a XOR b) when others;
   
   ---------------------MUX------------------------------
   WITH sel(3) SELECT
        y<= arith WHEN '0',
            logic WHEN OTHERS;
end Behavioral;
