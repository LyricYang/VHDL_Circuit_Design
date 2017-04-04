----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 22:21:08
-- Design Name: 
-- Module Name: min_max - Behavioral
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

entity min_max is
    generic(limit:integer :=255);
    Port ( ena : in bit;
           inp1 : in integer range 0 to limit;
           inp2 : in integer range 0 to limit;
           min_out : out integer range 0 to limit;
           max_out : out integer range 0 to limit);
end min_max;

architecture Behavioral of min_max is
    procedure sort(signal in1,in2:in integer range 0 to limit;
                signal min,max: out integer range 0 to limit) is
    begin
        if(in1 > in2) then
            max<=in1;
            min<=in2;
        else
            max<=in2;
            min<=in1;
        end if;
    end sort;
begin
    process(ena)
    begin
        if(ena='1') then sort(inp1,inp2,min_out,max_out);
        end if;
    end process;
end Behavioral;
