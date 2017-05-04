----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2016/11/30 09:42:51
-- Design Name: 
-- Module Name: shift_register_32 - Behavioral
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

entity shift_register_32 is
    Port ( clk :      in STD_LOGIC;
           r1_in :    in STD_LOGIC_VECTOR (11 downto 0);
           r2_in :    in STD_LOGIC_VECTOR (11 downto 0);
           Cora_out : out STD_LOGIC_VECTOR (11 downto 0);
           Corb_out : out STD_LOGIC_VECTOR (11 downto 0);
           W :        in STD_LOGIC;
           ce :       in STD_LOGIC);
end shift_register_32;

architecture Behavioral of shift_register_32 is
    component dff_logic
        port(clk:in std_logic;
               d:in std_logic_vector(11 downto 0);
               q:out std_logic_vector(11 downto 0)
        );
    end component;
    type matrix_index is array(0 to 32) of std_logic_vector(11 downto 0);
    signal z:matrix_index;
    signal an:std_logic_vector(11 downto 0);
    signal bn:std_logic_vector(11 downto 0);
begin
    z(0)<=r1_in;
    delay_32:for i in 0 to 31 generate
        dffx:dff_logic port map (clk,z(i),z(i+1));    
    end generate;
    cor:process(clk,W)
    begin
        if clk'event and clk='1' then
            if W='1' then 
                an<=z(32)+r2_in;
                bn<=z(32)-r2_in;
             else
                an<=z(32)-r2_in;
                bn<=z(32)+r2_in;
            end if;
        end if;
    end process cor;
    Cora_out<=an;
    Corb_out<=bn;
end Behavioral;
