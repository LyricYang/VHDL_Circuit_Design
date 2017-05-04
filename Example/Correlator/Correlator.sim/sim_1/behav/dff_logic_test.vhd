----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2016/11/30 10:04:34
-- Design Name: 
-- Module Name: dff_logic_test - Behavioral
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

entity dff_logic_test is
end dff_logic_test;

architecture Behavioral of dff_logic_test is
    component dff_logic
        Port ( clk : in STD_LOGIC;
                 d : in STD_LOGIC_VECTOR (11 downto 0);
                 q : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    signal clk:std_logic:='0';
    signal d:STD_LOGIC_VECTOR(11 downto 0):="111111111111";
    signal q:STD_LOGIC_VECTOR(11 downto 0);
    constant clk_period:time:=10 ns;
begin
    instant:dff_logic port map(clk=>clk,d=>d,q=>q);
    clk_gen:process
    begin
        wait for clk_period/2;
        clk<='1';
        wait for clk_period/2;
        clk<='0';
    end process clk_gen;
    
    r1_gen:process
    begin
        wait for clk_period;
        d<="000000000001";
        wait for clk_period;
        d<="111111111111";
    end process r1_gen;
end Behavioral;
