----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 22:00:04
-- Design Name: 
-- Module Name: pack - Behavioral
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

package pack is
    function mult (a,b: unsigned) return unsigned;
end pack;

package body pack is
    function mult(a,b:unsigned) return unsigned is
        constant max: integer := a'length+b'length-1;
        variable aa:unsigned(max downto 0) :=(max downto a'length => '0')&a(a'length-1 downto 0);
        variable prod: unsigned(max downto 0) := (others =>'0');
    begin
        for i in 0 to a'length-1 loop
            if(b(i) ='1') then prod := prod+aa;
            end if;
            aa := aa(max-1 downto 0)&'0';
        end loop;
        return prod;
    end mult;
end pack;
