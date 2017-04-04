----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 10:00:05
-- Design Name: 
-- Module Name: freq_divider_simulation - Behavioral
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

entity freq_divider_simulation is
end freq_divider_simulation;

architecture Behavioral of freq_divider_simulation is
    component freq_divider
        Port ( clk : in STD_LOGIC;
                out1 : inout STD_LOGIC;
                out2 : inout STD_LOGIC);
    end component;
    signal clk:std_logic:='0';
    signal out1:std_logic:='Z';
    signal out2 :STD_LOGIC:='Z';
    constant clk_period:time:=50ns;
begin
    instant:freq_divider port map(clk=>clk,out1=>out1,out2=>out2);
    clk_gen:process
    begin
        wait for clk_period/2;
        clk<='1';
        wait for clk_period/2;
        clk<='0';
    end process;
end Behavioral;
