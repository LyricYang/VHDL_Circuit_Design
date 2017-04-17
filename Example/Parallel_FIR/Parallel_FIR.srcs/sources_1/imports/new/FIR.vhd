----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/12 20:59:31
-- Design Name: 
-- Module Name: FIR - Behavioral
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
use work.my_data_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FIR is
    GENERIC (n:INTEGER :=4;m:INTEGER :=2);--n为系数个数，m为输入信号和系数的位数
    Port ( x : in SIGNED(m-1 downto 0);
           coef:in vector_array_in(0 to n-1);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           y : out SIGNED(2*m-1 downto 0));
end FIR;

architecture Behavioral of FIR is
    TYPE registers IS ARRAY (n-2 downto 0) OF SIGNED(m-1 downto 0);
    SIGNAL reg: registers;
    --TYPE coefficients IS ARRAY (n-1 downto 0) OF SIGNED(m-1 downto 0);
    --CONSTANT coef:coefficients:=("01","11","01","01");
begin
    process(clk,rst)
        variable acc,prod:signed(2*m-1 downto 0) :=(others => '0');
        variable sign:std_logic;
    begin
    ----------------------reset---------------------------------------
        if(rst='1') then
            for i in n-2 downto 0 loop
                for j in m-1 downto 0 loop
                    reg(i)(j)<='0';
                end loop;
            end loop;
    -------------------------register inference + MAC------------------
        elsif (clk'event and clk='1') then
            acc:=coef(0)*x;
            for i in 1 to n-1 loop
                sign := acc(2*m-1);
                prod := coef(i)*reg(n-1-i);
                acc  := acc+prod;
            --------------overflow check-----------------------------
                if (sign=prod(prod'left))and(acc(acc'left)/=sign) then
                    acc := (acc'left => sign,others => not sign);
                 end if;
             end loop;
            reg <= x&reg(n-2 downto 1);
        end if;
        y <= acc;
    end process;
end Behavioral;
