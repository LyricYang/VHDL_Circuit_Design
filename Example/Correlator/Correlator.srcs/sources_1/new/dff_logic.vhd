----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2016/11/30 09:57:06
-- Design Name: 
-- Module Name: dff_logic - Behavioral
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
use IEEE.STD_LOGIC_Arith.ALL;
USE ieee.std_logic_signed.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dff_logic is
    Port ( clk : in STD_LOGIC;
             d : in STD_LOGIC_VECTOR (11 downto 0);--ÑÓÊ±Æ÷ÊäÈë¶Ë
             q : out STD_LOGIC_VECTOR (11 downto 0));--ÑÓÊ±Æ÷Êä³ö¶Ë
end dff_logic;

architecture Behavioral of dff_logic is
SIGNAL q_in:SIGNED (11 downto 0);
begin
    Delay: process (clk)    
    begin
        if (clk'event and clk='1' ) then  
            q_in<=signed(d);   
        end if;    
    end process Delay;
    q<=std_logic_vector(q_in);
end Behavioral;
