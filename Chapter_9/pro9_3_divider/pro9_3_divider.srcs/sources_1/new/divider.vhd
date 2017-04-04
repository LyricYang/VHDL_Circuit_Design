----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 20:06:48
-- Design Name: 
-- Module Name: divider - Behavioral
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

entity divider is
    Port ( a : in INTEGER RANGE 0 TO 15;
           b : in INTEGER RANGE 0 TO 15;
           y : out STD_LOGIC_VECTOR (3 downto 0);
           rest : out INTEGER RANGE 0 TO 15;
           err : out STD_LOGIC);
end divider;

architecture Behavioral of divider is
begin
    process(a,b)
        variable temp1:integer range 0 to 15;
        variable temp2:integer range 0 to 15;
    begin
        --------------Error and initialization-------------
        temp1:=a;
        temp2:=b;
        if(b=0) then err<='1';
        else err<='0';
        end if;
        ------------Y(3)------------------------------------
        if(temp1>temp2*8) then
            y(2)<='1';
            temp1:=temp1-temp2*4;
        else y(2)<='0';
        end if;
        -------------------y(1)------------------------------
        if(temp1>=temp2*2) then
            y(1)<='1';
            temp1:=temp1-temp2*2;
        else y(1)<='0';
        end if;
        ---------------------y(0)----------------------------
        if(temp1>=temp2) then 
            y(0)<='1';
            temp1:=temp1-temp2;
        else y(0)<='0';
        end if;
        ---------------------Remainder------------------------
        rest<=temp1;
    end process;
end Behavioral;
