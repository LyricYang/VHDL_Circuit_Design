----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/01 16:18:18
-- Design Name: 
-- Module Name: parity_de - Behavioral
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

entity parity_de is
    GENERIC (n:INTEGER :=7);
    Port ( input:in bit_vector(n downto 0);
           output:out bit
             );
end parity_de;

architecture Behavioral of parity_de is
begin
    process(input)
        variable temp:bit;
    begin
        temp:='0';
        for i in input'range loop
            temp:=temp xor input(i);
        end loop;
        output <= temp;
    end process;
end Behavioral;
