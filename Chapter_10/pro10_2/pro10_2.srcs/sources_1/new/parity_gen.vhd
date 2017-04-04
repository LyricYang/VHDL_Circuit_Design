----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 21:29:02
-- Design Name: 
-- Module Name: parity_gen - Behavioral
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

entity parity_gen is
    generic (n: integer :=7);
    Port ( input : in bit_vector(n downto 0);
           output : out bit_vector(n+1 downto 0));
end parity_gen;

architecture Behavioral of parity_gen is
begin
    process(input)
        variable temp1:bit;
        variable temp2:bit_vector(output'range);
    begin
        temp1:='0';
        for i in input'range loop
            temp1:= temp1 xor input(i);
            temp2(i):=input(i);
        end loop;
        temp2(output'high):=temp1;
        output<=temp2;
    end process;
end Behavioral;
