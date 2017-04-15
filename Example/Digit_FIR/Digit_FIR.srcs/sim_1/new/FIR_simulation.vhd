----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/12 21:18:26
-- Design Name: 
-- Module Name: FIR_simulation - Behavioral
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

entity FIR_simulation is
GENERIC (n:INTEGER:=4;m:INTEGER:=2);
end FIR_simulation;

architecture Behavioral of FIR_simulation is
    component FIR
        GENERIC (n:INTEGER;m:INTEGER);
        Port ( x : in SIGNED(m-1 downto 0);
              clk : in STD_LOGIC;
              rst : in STD_LOGIC;
              y : out SIGNED(2*m-1 downto 0));
    end component;
    signal x:SIGNED(m-1 downto 0):="01";
    signal clk:std_logic:='0';
    signal rst:std_logic:='1';
    signal y:SIGNED(2*m-1 downto 0);
    constant clk_period:time :=20ns;
begin
    instant:FIR generic map(n,m) port map(x,clk,rst,y);
    
    clk_gen:process
    begin 
        wait for clk_period/2;
        clk<='1';
        wait for clk_period/2;
        clk<='0';
    end process;
    
    rst_gen:process
    begin
        wait for clk_period;
        rst<='0';
        wait;
    end process;
    
    x_gen:process
    begin
        wait for clk_period;
        x<="01";
        wait for clk_period;
        x<="11";
        wait for clk_period;
        x<="01";
        wait for clk_period;
        x<="01";
    end process;
    


end Behavioral;
