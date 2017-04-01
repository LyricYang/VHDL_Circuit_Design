----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/01 18:59:39
-- Design Name: 
-- Module Name: shifter_simulation - Behavioral
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

entity shifter_simulation is
end shifter_simulation;

architecture Behavioral of shifter_simulation is
    component shifter
        Port ( inp : in STD_LOGIC_VECTOR (3 downto 0);
               sel : in integer range 0 to 4;
               outp : out STD_LOGIC_VECTOR (7 downto 0));
    end component;
    signal inp:std_logic_vector(3 downto 0):="0011";
    signal sel:integer:=0;
    signal outp:std_logic_vector(7 downto 0);
    constant clk_period:time:=50ns;
begin
    instant:shifter port map(inp=>inp,sel=>sel,outp=>outp);
    sel_gen:process
    begin
        wait for clk_period*3;
        sel<=sel+1;
        if(sel=4) then
            sel<=0;
        end if;
    end process;
end Behavioral;
