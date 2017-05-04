----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/25 10:06:23
-- Design Name: 
-- Module Name: demo_multiplier - Behavioral
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

entity demo_multiplier is
end demo_multiplier;

architecture Behavioral of demo_multiplier is
    COMPONENT mult_gen_0
      PORT (
        CLK : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        P : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
    END COMPONENT;
    signal A:STD_LOGIC_VECTOR(3 DOWNTO 0):="0010";
    signal B:STD_LOGIC_VECTOR(3 DOWNTO 0):="0011";
    signal P:STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal ClK:STD_LOGIC:='0';
    signal clk_period:time:=20ns;
begin
your_instance_name : mult_gen_0
  PORT MAP (
    CLK => CLK,
    A => A,
    B => B,
    P => P
  );
  clk_gen:process
  begin
    wait for clk_period;
    CLK<='1';
    wait for clk_period;
    CLK<='0';
  end process;
end Behavioral;
