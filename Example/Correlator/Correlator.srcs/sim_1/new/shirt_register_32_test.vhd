----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2016/11/30 14:06:40
-- Design Name: 
-- Module Name: shirt_register_32_test - Behavioral
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

entity shirt_register_32_test is
end shirt_register_32_test;

architecture Behavioral of shirt_register_32_test is
    component shift_register_32
            Port ( clk :      in STD_LOGIC;
                   r1_in :    in STD_LOGIC_VECTOR (11 downto 0);
                   r2_in :    in STD_LOGIC_VECTOR (11 downto 0);
                   Cora_out : out STD_LOGIC_VECTOR (11 downto 0);
                   Corb_out : out STD_LOGIC_VECTOR (11 downto 0);
                   W :        in STD_LOGIC;
                   ce :       in STD_LOGIC);
    end component;
    signal clk:std_logic:='0';
    signal r1_in:STD_LOGIC_VECTOR(11 downto 0):="111111111111";
    signal r2_in:STD_LOGIC_VECTOR(11 downto 0):="111111111111";
    signal Cora_out:STD_LOGIC_VECTOR(11 downto 0);
    signal Corb_out:STD_LOGIC_VECTOR(11 downto 0);
    signal W:std_logic:='0';
    signal ce:std_logic:='1';
    constant clk_period:time:=10 ns;
begin
    instant:shift_register_32 port map(clk=>clk,r1_in=>r1_in,r2_in=>r2_in,Cora_out=>Cora_out,Corb_out=>Corb_out,W=>W,ce=>ce);
    clk_gen:process
    begin
        wait for clk_period/2;
        clk<='1';
        wait for clk_period/2;
        clk<='0';
    end process clk_gen;
    
    r1_gen:process
        begin
            wait for clk_period;
            r1_in<="000000000001";
            wait for clk_period;
            r1_in<="111111111111";
    end process r1_gen;
    
     r2_gen:process
        begin
            wait for clk_period;
            r2_in<="000000000001";
            wait for clk_period;
            r2_in<="111111111111";
     end process r2_gen;
end Behavioral;
