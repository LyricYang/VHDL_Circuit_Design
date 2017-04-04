----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 20:35:28
-- Design Name: 
-- Module Name: serial_converter - Behavioral
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

entity serial_converter is
    Port ( d : in STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC;
           load : in STD_LOGIC;
           dout : out STD_LOGIC);
end serial_converter;

architecture Behavioral of serial_converter is
    signal reg:std_logic_vector(7 downto 0);
begin
    process(clk)
    begin
        if(clk'event and clk='1') then
            if(load='1') then reg<=d;
            else reg<=reg(6 downto 0)&'0';
            end if;
        end if;
    end process;
    dout<=reg(7);
end Behavioral;
