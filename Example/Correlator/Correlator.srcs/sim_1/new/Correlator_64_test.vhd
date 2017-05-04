----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2016/11/30 15:37:42
-- Design Name: 
-- Module Name: Correlator_64_test - Behavioral
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
use IEEE.STD_LOGIC_Arith.ALL;
USE ieee.std_logic_signed.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Correlator_64_test is
end Correlator_64_test;

architecture Behavioral of Correlator_64_test is
    component Correlator_64
        Port ( clk :      in STD_LOGIC;--时间信号输入
               rk_in :    in STD_LOGIC_VECTOR (11 downto 0);--接受信号输入
               ce :       in STD_LOGIC;--输入控制信号
               W :        in STD_LOGIC_VECTOR (5 downto 0);--权重序列
               Cora_out : out STD_LOGIC_VECTOR (11 downto 0);--与Golay_a相关后的值
               Corb_out : out STD_LOGIC_VECTOR (11 downto 0));--与Golay_b相关后的值
    end component;
    signal clk:std_logic:='0';
    signal rk_in:STD_LOGIC_VECTOR(11 downto 0):="000000000001";
    signal Cora_out:STD_LOGIC_VECTOR(11 downto 0);
    signal Corb_out:STD_LOGIC_VECTOR(11 downto 0);
    signal W:std_logic_vector(5 downto 0):="111111";
    signal ce:std_logic:='1';
    constant clk_period:time:=10 ns;
begin
    instant:Correlator_64 port map(clk=>clk,rk_in=>rk_in,Cora_out=>Cora_out,Corb_out=>Corb_out,W=>W,ce=>ce);
    clk_gen:process
    begin
        wait for clk_period/2;
        clk<='1';
        wait for clk_period/2;
        clk<='0';
    end process clk_gen;
    
    rk_gen:process
        begin
            rk_in<="000000000001";
            wait for 50ns;
            rk_in<="111111111111";
            wait for 10ns;
            rk_in<="000000000001";
            wait for 10ns;
            rk_in<="111111111111";
            wait for 10ns;
            rk_in<="000000000001"; 
            wait for 20ns; 
            rk_in<="111111111111";
            wait for 20ns;
            rk_in<="000000000001";
            wait for 10ns;
            rk_in<="111111111111";
            wait for 20ns;
            rk_in<="000000000001"; 
            wait for 20ns;
            rk_in<="111111111111";
            wait for 20ns;
            rk_in<="000000000001"; 
            wait for 30ns;
            rk_in<="111111111111";
            wait for 20ns;
            rk_in<="000000000001"; 
            wait for 10ns;
            rk_in<="111111111111";
            wait for 10ns;
            rk_in<="000000000001"; 
            wait for 10ns;
            rk_in<="111111111111";
            wait for 10ns;
            rk_in<="000000000001"; 
            wait for 90ns;
            rk_in<="111111111111";
            wait for 10ns;
            rk_in<="000000000001"; 
            wait for 10ns;
            rk_in<="111111111111";
            wait for 30ns;
            rk_in<="000000000001"; 
            wait for 20ns;
            rk_in<="111111111111";
            wait for 10ns;
            rk_in<="000000000001"; 
            wait for 20ns;
            rk_in<="111111111111";
            wait for 10ns;
            rk_in<="000000000001"; 
            wait for 10ns;
            rk_in<="111111111111";
            wait for 20ns;
            rk_in<="000000000001"; 
            wait for 30ns;
            rk_in<="111111111111";
            wait for 30ns;
            rk_in<="000000000001"; 
            wait for 10ns;
            rk_in<="111111111111";
            wait for 10ns;
            rk_in<="000000000001"; 
            wait for 10ns;
            rk_in<="111111111111";
            wait for 40ns;
    end process rk_gen;
    


end Behavioral;
