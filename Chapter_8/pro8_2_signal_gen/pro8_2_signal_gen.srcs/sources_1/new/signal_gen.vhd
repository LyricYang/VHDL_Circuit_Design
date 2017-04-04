----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 17:06:17
-- Design Name: 
-- Module Name: signal_gen - Behavioral
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

entity signal_gen is
    Port ( clk : in bit;
           outp : out bit);
end signal_gen;

architecture Behavioral of signal_gen is
    type state is (one,two,three);
    signal pr_state1,nx_state1:state;
    signal pr_state2,nx_state2:state;
    signal out1,out2:bit;
begin
    process(clk)
    begin
        if(clk'event and clk='1') then
            pr_state1<=nx_state1;
        end if;
    end process;
    
    process(clk)
    begin
        if(clk'event and clk='0') then
            pr_state2<=nx_state2;
        end if;
    end process;
    
    process(pr_state1)
    begin
        case pr_state1 is
            when one=>
                out1<='0';
                nx_state1<=two;
            when two=>
                out1<='1';
                nx_state1<=three;
            when three=>
                out1<='1';
                nx_state1<=one;
        end case;
    end process;
    process(pr_state2)
        begin
            case pr_state2 is
                when one=>
                    out2<='0';
                    nx_state2<=two;
                when two=>
                    out2<='1';
                    nx_state2<=three;
                when three=>
                    out2<='1';
                    nx_state2<=one;
            end case;
        end process;
        outp<=out1 and out2;
end Behavioral;
