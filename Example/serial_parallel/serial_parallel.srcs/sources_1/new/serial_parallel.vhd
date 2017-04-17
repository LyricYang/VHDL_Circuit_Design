----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/16 20:10:56
-- Design Name: 
-- Module Name: serial_parallel - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity serial_parallel is
    Port ( din : in STD_LOGIC;
           clk : in STD_LOGIC;
           dout : out STD_LOGIC_VECTOR (3 downto 0);
           load : in STD_LOGIC);
end serial_parallel;

architecture Behavioral of serial_parallel is
begin
    process(clk,load)
    variable dtemp:STD_LOGIC_VECTOR(3 downto 0);
    variable count:integer:=0;
    begin
        if (load='1') then
            dtemp:=(others=>'0');
        elsif (clk'event and clk='1') then
            count:=count+1;
            dtemp(0):=din;
            for i in 3 downto 1 loop
                dtemp(i):=dtemp(i-1);
            end loop;
            if(count=4) then
                dout<=dtemp;
                count:=0;
            end if;
        end if;
    end process;
end Behavioral;
