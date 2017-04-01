----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/01 17:04:33
-- Design Name: 
-- Module Name: ALU_simulation - Behavioral
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

entity ALU_simulation is
end ALU_simulation;

architecture Behavioral of ALU_simulation is
    component ALU
            Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
              b : in STD_LOGIC_VECTOR (7 downto 0);
              sel : in STD_LOGIC_VECTOR (3 downto 0);
              cin : in STD_LOGIC;
              y : out STD_LOGIC_VECTOR(7 DOWNTO 0));
    end component;
    signal a: STD_LOGIC_VECTOR (7 downto 0):="11111010";
    signal b: STD_LOGIC_VECTOR (7 downto 0):="00000000";    
    signal cin:STD_LOGIC:='0';
    signal sel:STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
    signal y:STD_LOGIC_VECTOR(7 DOWNTO 0);
    constant clk_period:time:=50ns;
begin
    instant:ALU port map(a=>a,b=>b,sel=>sel,cin=>cin,y=>y);
    
    a_gen:process
    begin
        wait for clk_period*2;
        a<="11111100";
        wait for clk_period*2;
        a<="11111110";
        wait for clk_period*2;
        a<="00000000";
        wait for clk_period*2;
        a<="00000010";
        wait for clk_period*2;
        a<="00000100";
        wait for clk_period*2;
        a<="00000110";
        wait for clk_period*2;
        a<="00001000";
        wait for clk_period*2;
        a<="00001010";
        wait;
    end process;
    
    b_gen:process
    begin
        wait for clk_period*2;
        b<="00000001";
        wait for clk_period*2;
        b<="00000010";
        wait for clk_period*2;
        b<="00000011";
        wait for clk_period*2;
        b<="00000100";
        wait for clk_period*2;
        b<="00000101";
        wait for clk_period*3;
        b<="00000110";
        wait for clk_period;
        b<="00000111";
        wait for clk_period*2;
        b<="00001000";
        wait;
     end process;
        
     cin_gen:process
     begin
        wait for clk_period*13;
        cin<='1';
        wait;
    end process;
    
    sel_gen:process
    begin
        wait for clk_period*3;
        sel<="0010";
        wait for clk_period*3;
        sel<="0100";
        wait for clk_period*3;
        sel<="0110";
        wait for clk_period*3;
        sel<="0111";
        wait for clk_period*3;
        sel<="1000";
        wait for clk_period*2;
        sel<="1010";
        wait;
    end process;
end Behavioral;
