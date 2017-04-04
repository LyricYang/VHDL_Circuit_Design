----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 09:49:15
-- Design Name: 
-- Module Name: freq_divider - Behavioral
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

entity freq_divider is
    Port ( clk : in STD_LOGIC;
           out1 : inout STD_LOGIC;
           out2 : inout STD_LOGIC);
end freq_divider;

architecture Behavioral of freq_divider is
    signal count1:integer range 0 to 7;
begin
    process(clk)
    variable count2:integer range 0 to 7;
    begin
        if(clk'event and clk='1') then
            count1 <= count1+1;
            count2 := count2+1;
            if(count1=5) then
                out1<=not out1;
                count1<=0;
            end if;
            if(count2=5) then
                out2<=not out2;
                count2:=0;
            end if;
        end if;
    end process;
end Behavioral;
