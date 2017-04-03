----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/03 21:27:26
-- Design Name: 
-- Module Name: barrel - Behavioral
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

entity barrel is
    GENERIC(n:integer:=8);
    Port ( inp : in STD_LOGIC_VECTOR(n-1 downto 0);
           shift : in integer range 0 to 1;
           outp : out std_logic_vector(n-1 downto 0));
end barrel;

architecture Behavioral of barrel is
begin
    process(inp,shift)
    begin
        if(shift=0) then
            outp<=inp;
        else
            outp(0)<='0';
            for i in 1 to inp'high loop
                outp(i)<=inp(i-1);
            end loop;
        end if;
    end process;
end Behavioral;
