----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/01 16:21:18
-- Design Name: 
-- Module Name: parity_de_simulation - Behavioral
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

entity parity_de_simulation is
end parity_de_simulation;

architecture Behavioral of parity_de_simulation is
    
    component parity_de
        Port ( input:in bit_vector(7 downto 0);
               output:out bit
                 );
     end component;
     signal input:bit_vector(7 downto 0):="00000001";
     signal output:bit;
     constant clk_period:time:=50ns;
begin
        instant:parity_de port map
        (input=>input,output=>output);
        
        clk_gen:process
        begin
            wait for clk_period*2;
            input<=input sla 1;
end process;

end Behavioral;
