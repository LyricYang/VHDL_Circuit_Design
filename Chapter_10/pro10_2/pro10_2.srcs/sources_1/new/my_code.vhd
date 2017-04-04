----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/04 21:34:11
-- Design Name: 
-- Module Name: my_code - Behavioral
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

entity my_code is
    generic (n: positive:=2);
    Port ( inp : in bit_vector(n downto 0);
           outp : out bit_vector(n+1 downto 0));
end my_code;

architecture Behavioral of my_code is
    component parity_gen is
        generic(n:positive);
        port(input: in bit_vector(n downto 0);
             output: out bit_vector(n+1 downto 0));
    end component;
begin
    C1:parity_gen generic map(n) port map(inp,outp);

end Behavioral;
