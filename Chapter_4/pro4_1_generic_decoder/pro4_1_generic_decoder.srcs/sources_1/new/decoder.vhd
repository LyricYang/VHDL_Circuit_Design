----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/01 15:45:53
-- Design Name: 
-- Module Name: decoder - Behavioral
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

entity decoder is
    Port ( ena : in STD_LOGIC;
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           x : out STD_LOGIC_VECTOR (7 downto 0));
end decoder;

architecture Behavioral of decoder is
begin
    process(ena,sel)
        variable temp1:STD_LOGIC_VECTOR(x'HIGH DOWNTO 0);
        variable temp2:INTEGER RANGE 0 TO x'HIGH;
    begin
        temp1:=(others =>'1');
        temp2:=0;
        if(ena='1') then
            for i in sel'range loop
                if (sel(i)='1') then
                    temp2:=2*temp2+1;
                else
                    temp2:=2*temp2;
                end if;
            end loop;
            temp1(temp2):='0';
        end if;
        x<=temp1;
    end process;
end Behavioral;
