----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/01 15:58:41
-- Design Name: 
-- Module Name: decoder_simulation - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder_simulation is
end decoder_simulation;

architecture Behavioral of decoder_simulation is
    component decoder
        Port ( ena : in STD_LOGIC;
               sel : in STD_LOGIC_VECTOR (2 downto 0);
               x : out STD_LOGIC_VECTOR (7 downto 0));
     end component;
     signal ena:std_logic:='0';
     signal sel:std_logic_vector(2 downto 0):="000";
     signal x:STD_LOGIC_VECTOR (7 downto 0);
     constant clk_period:time:=50ns;
     begin
        instant:decoder port map
        (ena=>ena,sel=>sel,x=>x);
        
        ena_gen:process
        begin
            wait for clk_period*2;
            ena<='1';
            wait;
        end process;
        
        sel_gen:process
        begin
            wait for clk_period;
            sel<=sel+1;
        end process;
end Behavioral;
