----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/05/06 21:28:19
-- Design Name: 
-- Module Name: Golay_128_sim - Behavioral
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
use work.my_data_type.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Golay_128_sim is
    GENERIC(m: INTEGER:=9);
end Golay_128_sim;

architecture Behavioral of Golay_128_sim is
    component Golay_128
        GENERIC(m: INTEGER);
           Port ( clk : in STD_LOGIC;
                  rst : in STD_LOGIC;
                  W: in STD_LOGIC_VECTOR(6 DOWNTO 0);
                  rk:in vector_array(0 to 7);
                  aN_out:out vector_array(0 to 7);
                  bN_out:out vector_array(0 to 7));
    end component; 
    signal clk:std_logic:='0';
    signal rst:std_logic:='1';
    signal W:std_logic_vector(6 downto 0):="0000100";
    signal rk:vector_array(0 to 7):=("000000000","000000000","000000000","000000000","000000000","000000000","000000000","000000000");
    signal Cora:vector_array(0 to 7);
    signal Corb:vector_array(0 to 7);
    constant clk_period:time:=10 ns;
begin
    instant:Golay_128 generic map(m) port map(clk,rst,W,rk,Cora,Corb); 
    
    clk_gen:process
    begin
        wait for clk_period/2;
        clk<='1';
        wait for clk_period/2;
        clk<='0';
    end process clk_gen;
    
    rst_gen:process
    begin
        wait for clk_period/2;
        rst<='0';
    end process rst_gen;
    
    rk_gen:process
    begin
        wait for clk_period;
        rk<=("000000001","000000001","111111111","111111111","111111111","111111111","111111111","111111111");
        wait for clk_period;
        rk<=("111111111","000000001","111111111","000000001","000000001","111111111","111111111","000000001");
        wait for clk_period;
        rk<=("000000001","000000001","111111111","111111111","000000001","000000001","000000001","000000001");
        wait for clk_period;
        rk<=("111111111","000000001","111111111","000000001","111111111","000000001","000000001","111111111");
        wait for clk_period;
        rk<=("111111111","111111111","000000001","000000001","000000001","000000001","000000001","000000001");
        wait for clk_period;
        rk<=("000000001","111111111","000000001","111111111","111111111","000000001","000000001","111111111");
        wait for clk_period;
        rk<=("000000001","000000001","111111111","111111111","000000001","000000001","000000001","000000001");
        wait for clk_period;
        rk<=("111111111","000000001","111111111","000000001","111111111","000000001","000000001","111111111");
        wait for clk_period;
        rk<=("000000001","000000001","111111111","111111111","111111111","111111111","111111111","111111111");
        wait for clk_period;
        rk<=("111111111","000000001","111111111","000000001","000000001","111111111","111111111","000000001");
        wait for clk_period;
        rk<=("000000001","000000001","111111111","111111111","000000001","000000001","000000001","000000001");
        wait for clk_period;
        rk<=("111111111","000000001","111111111","000000001","111111111","000000001","000000001","111111111");
        wait for clk_period;
        rk<=("000000001","000000001","111111111","111111111","111111111","111111111","111111111","111111111");
        wait for clk_period;
        rk<=("111111111","000000001","111111111","000000001","000000001","111111111","111111111","000000001");
        wait for clk_period;
        rk<=("111111111","111111111","000000001","000000001","111111111","111111111","111111111","111111111");
        wait for clk_period;
        rk<=("000000001","111111111","000000001","111111111","000000001","111111111","111111111","000000001");
    end process;
end Behavioral;
