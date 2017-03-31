----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/03/31 18:40:27
-- Design Name: 
-- Module Name: dff_nand_simulation - Behavioral
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

entity dff_nand_simulation is
end dff_nand_simulation;

architecture Behavioral of dff_nand_simulation is
    component dff_nand
            Port ( clk : in STD_LOGIC;
              a : in STD_LOGIC;
              b : in STD_LOGIC;
              q : out STD_LOGIC);
    end component;
    signal clk:std_logic:='0';
    signal a:std_logic:='0';
    signal b:std_logic:='0';
    signal q:std_logic;
    constant clk_period:time:=50ns;
    begin
    instant:dff_nand port map
    (clk=>clk,a=>a,b=>b,q=>q);
    
    clk_gen:process
    begin
        wait for clk_period/2;
        clk<='1';
        wait for clk_period/2;
        clk<='0';
    end process;
    
    a_gen:process
    begin
        wait for clk_period;
        a<='1';
        wait for clk_period;
        a<='0';
    end process;

    b_gen:process
    begin
        wait for clk_period*2;
        b<='1';
        wait for clk_period*2;
        b<='0';
    end process;
end Behavioral;
