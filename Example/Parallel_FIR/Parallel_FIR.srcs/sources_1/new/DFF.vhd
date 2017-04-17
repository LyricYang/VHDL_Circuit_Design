----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/17 20:32:12
-- Design Name: 
-- Module Name: DFF - Behavioral
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

entity DFF is
    GENERIC(m: INTEGER:=2);
    Port ( d : in SIGNED(2*m-1 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           q : out SIGNED(2*m-1 downto 0));
end DFF;

architecture Behavioral of DFF is
begin
    process(clk,rst)
    begin
        if (rst='1') then
            q<=(others=>'0');
        elsif (clk'event and clk='1') then
            q<=d;
        end if;
    end process;
end Behavioral;
