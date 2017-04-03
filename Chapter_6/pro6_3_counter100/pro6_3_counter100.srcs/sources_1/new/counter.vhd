----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/03 21:11:24
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is
    Port ( clk : in STD_LOGIC;
            reset : in STD_LOGIC;
           digit1 : out STD_LOGIC_VECTOR (6 downto 0);
           digit2 : out STD_LOGIC_VECTOR (6 downto 0));
end counter;

architecture Behavioral of counter is
begin
    process(clk,reset)
        variable temp1:integer range 0 to 10;
        variable temp2:integer range 0 to 10;
    begin 
        if(reset='1') then 
            temp1:=0;
            temp2:=0;
        elsif (clk'event and clk ='1') then 
            temp1:=temp1+1;
            if(temp1=10) then 
                temp1:=0;
                temp2:=temp2+1;
                if(temp2=10) then 
                    temp2:=0;
                end if;
            end if;
        end if;
        
        case temp1 is
            when 0=>digit1<="1111110";
            when 1=>digit1<="0110000";
            when 2=>digit1<="1101101";
            when 3=>digit1<="1111001";
            when 4=>digit1<="0110011";
            when 5=>digit1<="1011011";
            when 6=>digit1<="1011111";
            when 7=>digit1<="1110000";
            when 8=>digit1<="1111111";
            when 9=>digit1<="1111011";
            when others=>null;
        end case;
        case temp2 is
            when 0=>digit2<="1111110";
            when 1=>digit2<="0110000";
            when 2=>digit2<="1101101";
            when 3=>digit2<="1111001";
            when 4=>digit2<="0110011";
            when 5=>digit2<="1011011";
            when 6=>digit2<="1011111";
            when 7=>digit2<="1110000";
            when 8=>digit2<="1111111";
            when 9=>digit2<="1111011";
            when others=>null;
        end case;    
    end process;
end Behavioral;
