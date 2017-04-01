----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/01 15:03:23
-- Design Name: 
-- Module Name: adder2_simulation - Behavioral
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

entity adder2_simulation is
end adder2_simulation;

architecture Behavioral of adder2_simulation is
    component adder2
    Port ( a : in signed (3 downto 0);
           b : in signed (3 downto 0);
           sum : out integer range -16 to 15);
    end component;
    signal a :signed (3 downto 0):="0000";
    signal b :signed (3 downto 0):="0000";
    signal sum :integer range -16 to 15;
    constant clk_period:time:=50ns;
begin
    instant:adder2 port map
    (a=>a,b=>b,sum=>sum);
    
    a_gen:process
        begin
            wait for clk_period*2;
            a<=a+1;
    end process;
    
    b_gen:process
        begin
            wait for clk_period*2;
            b<=b+1;
    end process;
end Behavioral;
