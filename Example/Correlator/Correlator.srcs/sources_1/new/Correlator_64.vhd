----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2016/11/30 09:35:15
-- Design Name: 
-- Module Name: Correlator_64 - Behavioral
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

entity Correlator_64 is
    Port ( clk :      in STD_LOGIC;--时间信号输入
           rk_in :    in STD_LOGIC_VECTOR (11 downto 0);--接受信号输入
           ce :       in STD_LOGIC;--输入控制信号
           W :        in STD_LOGIC_VECTOR (5 downto 0);--权重序列
           Cora_out : out STD_LOGIC_VECTOR (11 downto 0);--与Golay_a相关后的值
           Corb_out : out STD_LOGIC_VECTOR (11 downto 0));--与Golay_b相关后的值
end Correlator_64;

architecture Behavioral of Correlator_64 is
    component shift_register_32
            Port ( clk :      in STD_LOGIC;
               r1_in :    in STD_LOGIC_VECTOR (11 downto 0);
               r2_in :    in STD_LOGIC_VECTOR (11 downto 0);
               Cora_out : out STD_LOGIC_VECTOR (11 downto 0);
               Corb_out : out STD_LOGIC_VECTOR (11 downto 0);
               W :        in STD_LOGIC;
               ce:       in STD_LOGIC);
   end component;
   
   component shift_register_8
               Port ( clk :      in STD_LOGIC;
                  r1_in :    in STD_LOGIC_VECTOR (11 downto 0);
                  r2_in :    in STD_LOGIC_VECTOR (11 downto 0);
                  Cora_out : out STD_LOGIC_VECTOR (11 downto 0);
                  Corb_out : out STD_LOGIC_VECTOR (11 downto 0);
                  W :        in STD_LOGIC;
                  ce:       in STD_LOGIC);
  end component; 
  
  component shift_register_2
              Port ( clk :      in STD_LOGIC;
                 r1_in :    in STD_LOGIC_VECTOR (11 downto 0);
                 r2_in :    in STD_LOGIC_VECTOR (11 downto 0);
                 Cora_out : out STD_LOGIC_VECTOR (11 downto 0);
                 Corb_out : out STD_LOGIC_VECTOR (11 downto 0);
                 W :        in STD_LOGIC;
                 ce:       in STD_LOGIC);
    end component;
 
  component shift_register_16
              Port ( clk :      in STD_LOGIC;
                 r1_in :    in STD_LOGIC_VECTOR (11 downto 0);
                 r2_in :    in STD_LOGIC_VECTOR (11 downto 0);
                 Cora_out : out STD_LOGIC_VECTOR (11 downto 0);
                 Corb_out : out STD_LOGIC_VECTOR (11 downto 0);
                 W :        in STD_LOGIC;
                 ce:       in STD_LOGIC);
    end component;  

   component shift_register_1
               Port ( clk :      in STD_LOGIC;
                  r1_in :    in STD_LOGIC_VECTOR (11 downto 0);
                  r2_in :    in STD_LOGIC_VECTOR (11 downto 0);
                  Cora_out : out STD_LOGIC_VECTOR (11 downto 0);
                  Corb_out : out STD_LOGIC_VECTOR (11 downto 0);
                  W :        in STD_LOGIC;
                  ce:       in STD_LOGIC);
  end component;  
  
    component shift_register_4
                Port ( clk :      in STD_LOGIC;
                   r1_in :    in STD_LOGIC_VECTOR (11 downto 0);
                   r2_in :    in STD_LOGIC_VECTOR (11 downto 0);
                   Cora_out : out STD_LOGIC_VECTOR (11 downto 0);
                   Corb_out : out STD_LOGIC_VECTOR (11 downto 0);
                   W :        in STD_LOGIC;
                   ce:       in STD_LOGIC);
    end component;
    
    signal a_32:std_logic_vector(11 downto 0);
    signal b_32:std_logic_vector(11 downto 0);
    signal a_8:std_logic_vector(11 downto 0);
    signal b_8:std_logic_vector(11 downto 0);
    signal a_2:std_logic_vector(11 downto 0);
    signal b_2:std_logic_vector(11 downto 0);
    signal a_16:std_logic_vector(11 downto 0);
    signal b_16:std_logic_vector(11 downto 0);
    signal a_1:std_logic_vector(11 downto 0);
    signal b_1:std_logic_vector(11 downto 0);
    --signal a_4:std_logic_vector(11 downto 0);
    --signal b_4:std_logic_vector(11 downto 0);

begin
    butter1:shift_register_32 port map(clk=>clk,r1_in=>rk_in,r2_in=>rk_in,Cora_out=>a_32,Corb_out=>b_32,W=>W(5),ce=>ce);
    butter2:shift_register_8 port map(clk=>clk,r1_in=>a_32,r2_in=>b_32,Cora_out=>a_8,Corb_out=>b_8,W=>W(4),ce=>ce);
    butter3:shift_register_2 port map(clk=>clk,r1_in=>a_8,r2_in=>b_8,Cora_out=>a_2,Corb_out=>b_2,W=>W(3),ce=>ce);
    butter4:shift_register_16 port map(clk=>clk,r1_in=>a_2,r2_in=>b_2,Cora_out=>a_16,Corb_out=>b_16,W=>W(2),ce=>ce);
    butter5:shift_register_1 port map(clk=>clk,r1_in=>a_16,r2_in=>b_16,Cora_out=>a_1,Corb_out=>b_1,W=>W(1),ce=>ce);
    butter6:shift_register_4 port map(clk=>clk,r1_in=>a_1,r2_in=>b_1,Cora_out=>Cora_out,Corb_out=>Corb_out,W=>W(0),ce=>ce);

end Behavioral;
