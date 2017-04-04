----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 16:47:43
-- Design Name: 
-- Module Name: BCDcounter - Behavioral
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

entity BCDcounter is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           count : out STD_LOGIC_VECTOR (3 downto 0));
end BCDcounter;

architecture Behavioral of BCDcounter is
type state is (zero,one,two,three,four,five,six,seven,eight,nine);
signal pr_state,nx_state:state;
begin
    process(rst,clk)
    begin
        if(rst='1') then
            pr_state<=zero;
        elsif (clk'event and clk='1') then
            pr_state<=nx_state;
        end if;
    end process;
    
    process(pr_state)
    begin
        case pr_state is
            when zero=>
                count<="0000";
                nx_state<=one;
            when one=>
                count<="0001";
                nx_state<=two;
            when two=>
                count<="0010";
                nx_state<=three;
            when three=>
                count<="0011";
                nx_state<=four;
            when four=>
                count<="0100";
                nx_state<=five;
            when five=>
                count<="0101";
                nx_state<=six; 
            when six=>
                count<="0110";
                nx_state<=seven;
            when seven=>
                count<="0111";
                nx_state<=eight;
             when eight=>
                count<="1000";
                nx_state<=nine;
             when nine=>
                count<="1001";
                nx_state<=zero;
        end case;
    end process;
end Behavioral;
