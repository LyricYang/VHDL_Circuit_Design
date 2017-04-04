----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 20:19:18
-- Design Name: 
-- Module Name: receiver - Behavioral
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

entity receiver is
    Port ( din : in bit;
           clk : in bit;
           rst : in bit;
           data : out bit_vector(6 downto 0);
           err : out bit;
           data_vaild : out bit);
end receiver;

architecture Behavioral of receiver is
begin
    process(rst,clk)
        variable count:integer range 0 to 10;
        variable reg:bit_vector(10 downto 0);
        variable temp:bit;
    begin
        if(rst='1') then 
            count:=0;
            reg:=(reg'range=>'0');
            temp:='0';
            err<='0';
            data_vaild<='0';
        elsif(clk'event and clk='1') then
            if(reg(0)='0' and din='1') then
                reg(0):='1';
            elsif(reg(0)='1') then
                count:=count+1;
                if(count<10) then
                    reg(count):=din;
                elsif(count=10) then
                    temp:=(reg(1) xor reg(2) xor reg(3) xor reg(4) xor reg(5) xor reg(6) xor reg(7) xor reg(8)) or not reg(9);
                    err<=temp;
                    count:=0;
                    reg(0):=din;
                    if(temp='0') then
                        data_vaild<='1';
                        data<=reg(7 downto 1);
                    end if;
                end if;
            end if;
        end if;
    end process;        
end Behavioral;
