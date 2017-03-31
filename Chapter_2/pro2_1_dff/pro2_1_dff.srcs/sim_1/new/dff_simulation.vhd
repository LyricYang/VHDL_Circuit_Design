----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/03/31 15:47:06
-- Design Name: 
-- Module Name: dff_simulation - Behavioral
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

entity dff_simulation is
end dff_simulation;

architecture Behavioral of dff_simulation is
    component dff
        Port ( d : in STD_LOGIC;
                  clk : in STD_LOGIC;
                  rst: in STD_LOGIC;
                  q : out STD_LOGIC);
     end component;
     signal clk:std_logic:='0';
     signal d:std_logic:='0';
     signal rst:std_logic:='1';
     signal q:std_logic;
     constant clk_period:time:=50ns;
     begin
        instant:dff port map
        (clk=>clk,d=>d,rst=>rst,q=>q);
        
        clk_gen:process
        begin
            wait for clk_period/2;
            clk<='1';
            wait for clk_period/2;
            clk<='0';
        end process;
        
        rst_gen:process
        begin
            wait for clk_period*3;
            rst<='0';
            wait;
        end process;
        
        d_gen:process
        begin
            wait for clk_period*2;
            d<='1';
            wait for clk_period*2;
            d<='0';
        end process;
end Behavioral;
