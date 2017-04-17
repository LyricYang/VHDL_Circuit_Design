----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/17 16:37:43
-- Design Name: 
-- Module Name: Parallel_FIR - Behavioral
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

entity Parallel_FIR is
    --n为系数个数，m为输入信号位数,k为并行数
    GENERIC (n:INTEGER :=2; m:INTEGER :=2; k:INTEGER :=2);
    Port ( clk : in STD_LOGIC;
           rst_fir : in STD_LOGIC;
           rst_dff : in STD_LOGIC;
           Din : in vector_array_in(0 to k-1);
           Dout : out vector_array_out(0 to k-1));
end Parallel_FIR;

architecture Behavioral of Parallel_FIR is
  -----------------FIR--------------------------
    component FIR
        GENERIC (n:INTEGER;m:INTEGER);--n为系数个数，m为输入信号和系数的位数
        Port ( x : in SIGNED(m-1 downto 0);
               coef:in vector_array_in(0 to n-1);
               clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               y : out SIGNED(2*m-1 downto 0));
    end component;
    -----------------DEF-------------------------
    component DFF
        GENERIC (m:INTEGER);--m为输入信号的位数
        Port ( d : in SIGNED(2*m-1 downto 0);
               clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               q : out SIGNED(2*m-1 downto 0));
    end component;
    -------------------signal--------------------
    signal coef0: vector_array_in(0 to n-1):=("01","01");
    signal coef1: vector_array_in(0 to n-1):=("11","01");
    signal y0: vector_array_out(0 to m-1);
    signal y1: vector_array_out(0 to m-1);
    signal y_dff : signed(2*m-1 downto 0);
begin
    DIN0_H0: FIR generic map(n,m) port map(Din(0),coef0,clk,rst_fir,y0(0));
    DIN0_H1: FIR generic map(n,m) port map(Din(0),coef1,clk,rst_fir,y0(1));
    DIN1_H0: FIR generic map(n,m) port map(Din(1),coef0,clk,rst_fir,y1(0));
    DIN1_H1: FIR generic map(n,m) port map(Din(1),coef1,clk,rst_fir,y1(1));
    INSTANT_DFF: DFF generic map(m) port map(y1(1),clk,rst_dff,y_dff);
    Dout(0)<=y0(0)+y_dff;
    Dout(1)<=y0(1)+y1(0);
end Behavioral;
