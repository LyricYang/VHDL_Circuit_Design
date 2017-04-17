----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/17 21:04:31
-- Design Name: 
-- Module Name: Parallel_FIR_simulation - Behavioral
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

entity Parallel_FIR_simulation is
    GENERIC (n:INTEGER :=2; m:INTEGER :=2; k:INTEGER :=2);
end Parallel_FIR_simulation;

architecture Behavioral of Parallel_FIR_simulation is
    component Parallel_FIR
        GENERIC (n:INTEGER; m:INTEGER; k:INTEGER);
        Port ( clk : in STD_LOGIC;
               rst_fir : in STD_LOGIC;
               rst_dff : in STD_LOGIC;
               Din : in vector_array_in(0 to k-1);
               Dout : out vector_array_out(0 to k-1));
    end component;
    signal clk:std_logic:='0';
    signal rst_fir:std_logic:='1';
    signal rst_dff:std_logic:='1';
    signal Din : vector_array_in(0 to k-1):=("01","01");
    signal Dout :vector_array_out(0 to k-1);
    constant clk_period:time :=20ns;
begin
    instant:Parallel_FIR generic map(n,m,k) port map(clk,rst_fir,rst_dff,Din,Dout);
    clk_gen:process
    begin 
       wait for clk_period/2;
       clk<='1';
       wait for clk_period/2;
       clk<='0';
    end process;
    
    rst_gen:process
    begin
       wait for clk_period;
       rst_fir<='0';
       rst_dff<='0';
       wait;
    end process;
    
    x_gen:process
    begin
        wait for clk_period;
        Din<=("01","01");
        wait for clk_period;
        Din<=("11","01");
    end process;
    
end Behavioral;
