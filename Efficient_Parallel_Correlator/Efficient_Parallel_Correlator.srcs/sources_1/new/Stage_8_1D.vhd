----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/05/06 14:54:32
-- Design Name: 
-- Module Name: Stage_8_1D - Behavioral
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

entity Stage_8_1D is
    GENERIC(m: INTEGER:=9);
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           W: in STD_LOGIC;
           aN_in:in vector_array(0 to 7);
           bN_in:in vector_array(0 to 7);
           aN_out:out vector_array(0 to 7);
           bN_out:out vector_array(0 to 7));
end Stage_8_1D;

architecture Behavioral of Stage_8_1D is
    --------------单个延时----------------------
    component Basic_Structure_1D
        GENERIC(m: INTEGER);
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               W : in STD_LOGIC;
               aN_in: in SIGNED(m-1 downto 0);
               bN_in: in SIGNED(m-1 downto 0);
               aN_out: out SIGNED(m-1 downto 0);
               bN_out: out SIGNED(m-1 downto 0));
    end component;
    --------------无延时--------------------------
    component Basic_Structure_0
        GENERIC(m: INTEGER);
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               W : in STD_LOGIC;
               aN_in: in SIGNED(m-1 downto 0);
               bN_in: in SIGNED(m-1 downto 0);
               aN_out: out SIGNED(m-1 downto 0);
               bN_out: out SIGNED(m-1 downto 0));
    end component;
    
begin
    Delay_1:Basic_Structure_1D generic map(m) port map(clk,rst,W,aN_in(0),bN_in(7),aN_out(0),bN_out(0));
    Delay_0:for i in 1 to 7 generate
        Dx:Basic_Structure_0 generic map(m) port map(clk,rst,W,aN_in(i),bN_in(i-1),aN_out(i),bN_out(i));
    end generate;
end Behavioral;
