----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/05/06 20:46:04
-- Design Name: 
-- Module Name: Golay_128 - Behavioral
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

---------------802.11ad Golay高速并行相关器-----------------------
entity Golay_128 is
     GENERIC(m: INTEGER:=9);
       Port ( clk : in STD_LOGIC;
              rst : in STD_LOGIC;
              W: in STD_LOGIC_VECTOR(6 DOWNTO 0);
              rk:in vector_array(0 to 7);
              aN_out:out vector_array(0 to 7);
              bN_out:out vector_array(0 to 7));
end Golay_128;

architecture Behavioral of Golay_128 is
    component Stage_8_1D
        GENERIC(m: INTEGER);
        Port ( clk : in STD_LOGIC;
              rst : in STD_LOGIC;
              W: in STD_LOGIC;
              aN_in:in vector_array(0 to 7);
              bN_in:in vector_array(0 to 7);
              aN_out:out vector_array(0 to 7);
              bN_out:out vector_array(0 to 7));
    end component; 
    
    component Stage_8_2D
        GENERIC(m: INTEGER);
        Port ( clk : in STD_LOGIC;
              rst : in STD_LOGIC;
              W: in STD_LOGIC;
              aN_in:in vector_array(0 to 7);
              bN_in:in vector_array(0 to 7);
              aN_out:out vector_array(0 to 7);
              bN_out:out vector_array(0 to 7));
    end component;
    
    component Stage_8_4D
        GENERIC(m: INTEGER);
        Port ( clk : in STD_LOGIC;
              rst : in STD_LOGIC;
              W: in STD_LOGIC;
              aN_in:in vector_array(0 to 7);
              bN_in:in vector_array(0 to 7);
              aN_out:out vector_array(0 to 7);
              bN_out:out vector_array(0 to 7));
    end component;
    
    component Stage_8_8D
        GENERIC(m: INTEGER);
        Port ( clk : in STD_LOGIC;
              rst : in STD_LOGIC;
              W: in STD_LOGIC;
              aN_in:in vector_array(0 to 7);
              bN_in:in vector_array(0 to 7);
              aN_out:out vector_array(0 to 7);
              bN_out:out vector_array(0 to 7));
    end component;
    
    component Stage_8_16D
        GENERIC(m: INTEGER);
        Port ( clk : in STD_LOGIC;
              rst : in STD_LOGIC;
              W: in STD_LOGIC;
              aN_in:in vector_array(0 to 7);
              bN_in:in vector_array(0 to 7);
              aN_out:out vector_array(0 to 7);
              bN_out:out vector_array(0 to 7));
    end component;
    
    component Stage_8_32D
        GENERIC(m: INTEGER);
        Port ( clk : in STD_LOGIC;
              rst : in STD_LOGIC;
              W: in STD_LOGIC;
              aN_in:in vector_array(0 to 7);
              bN_in:in vector_array(0 to 7);
              aN_out:out vector_array(0 to 7);
              bN_out:out vector_array(0 to 7));
    end component;
    
    component Stage_8_64D
        GENERIC(m: INTEGER);
        Port ( clk : in STD_LOGIC;
              rst : in STD_LOGIC;
              W: in STD_LOGIC;
              aN_in:in vector_array(0 to 7);
              bN_in:in vector_array(0 to 7);
              aN_out:out vector_array(0 to 7);
              bN_out:out vector_array(0 to 7));
    end component;
    signal aN_out_1:vector_array(0 to 7);
    signal bN_out_1:vector_array(0 to 7);
    signal aN_out_2:vector_array(0 to 7);
    signal bN_out_2:vector_array(0 to 7);
    signal aN_out_4:vector_array(0 to 7);
    signal bN_out_4:vector_array(0 to 7);
    signal aN_out_8:vector_array(0 to 7);                                        
    signal bN_out_8:vector_array(0 to 7);
    signal aN_out_16:vector_array(0 to 7);
    signal bN_out_16:vector_array(0 to 7);
    signal aN_out_32:vector_array(0 to 7);
    signal bN_out_32:vector_array(0 to 7);
begin
    stage0:Stage_8_1D generic map(m) port map(clk,rst,W(6),rk,rk,aN_out_1,bN_out_1);
    stage1:Stage_8_8D generic map(m) port map(clk,rst,W(5),aN_out_1,bN_out_1,aN_out_8,bN_out_8);
    stage2:Stage_8_2D generic map(m) port map(clk,rst,W(4),aN_out_8,bN_out_8,aN_out_2,bN_out_2);
    stage3:Stage_8_4D generic map(m) port map(clk,rst,W(3),aN_out_2,bN_out_2,aN_out_4,bN_out_4);
    stage4:Stage_8_16D generic map(m) port map(clk,rst,W(2),aN_out_4,bN_out_4,aN_out_16,bN_out_16);
    stage5:Stage_8_32D generic map(m) port map(clk,rst,W(1),aN_out_16,bN_out_16,aN_out_32,bN_out_32);
    stage6:Stage_8_64D generic map(m) port map(clk,rst,W(0),aN_out_32,bN_out_32,aN_out,bN_out);
end Behavioral;
