----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/03 21:40:18
-- Design Name: 
-- Module Name: ram - Behavioral
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

entity ram is
    GENERIC(bits:integer :=8;
            words:integer:=16);
    Port ( wr_ena : in STD_LOGIC;
           clk : in STD_LOGIC;
           addr : in integer range 0 to words-1;
           data_in : in std_logic_vector(bits-1 downto 0);
           data_out : out std_logic_vector(bits-1 downto 0));
end ram;

architecture Behavioral of ram is
    type vector_array is array(0 to words-1) of std_logic_vector(bits-1 downto 0);
    signal memory:vector_array;
begin
    process(clk,wr_ena)
    begin
        if(wr_ena='1') then
            if(clk'event and clk='1') then 
                memory(addr)<= data_in;
            end if;
        end if;
    end process;
    data_out<=memory(addr);
end Behavioral;
