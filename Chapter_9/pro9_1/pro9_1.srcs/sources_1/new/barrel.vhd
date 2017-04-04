----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 19:42:24
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
    Port ( inp : in STD_LOGIC_VECTOR (7 downto 0);
           shift : in STD_LOGIC_VECTOR (2 downto 0);
           outp : out STD_LOGIC_VECTOR (7 downto 0));
end barrel;

architecture Behavioral of barrel is
begin
    process(inp,shift)
        variable temp1:std_logic_vector(7 downto 0);
        variable temp2:std_logic_vector(7 downto 0);
    begin 
        -----------------1st shift---------------------
        if(shift(0)='0') then 
            temp1:=inp;
        else
            temp1(0):='0';
            for i in 1 to inp'high loop
                temp1(i):=inp(i-1);
            end loop;
        end if;
        -----------------2nd shift---------------------
        if(shift(1)='0') then 
            temp2:=temp1;
        else
            temp2(0):='0';
            temp2(1):='0';
            for i in 2 to inp'high loop
                temp2(i):=temp1(i-2);
            end loop;
        end if;
        -----------------2nd shift---------------------
        if(shift(2)='0') then 
            outp<=temp2;
        else
            for i in 0 to 3 loop
                outp(i)<='0';
            end loop;
            for i in 4 to inp'high loop
                outp(i)<=temp2(i-4);
            end loop;
        end if;
    end process;
end Behavioral;
