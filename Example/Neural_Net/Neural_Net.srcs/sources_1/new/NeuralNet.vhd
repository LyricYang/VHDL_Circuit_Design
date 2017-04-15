----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2017/04/15 10:19:48
-- Design Name: 
-- Module Name: NeuralNet - Behavioral
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
use work.my_data_types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NeuralNet is
    GENERIC (n:INTEGER := 3;
             m:INTEGER := 3;
             b:INTEGER := 3);
    Port ( x : in VECTOR_ARRAY_IN(1 TO m);
           w : in SIGNED(b-1 DOWNTO 0);
           clk : in STD_LOGIC;
           test : out SIGNED(b-1 DOWNTO 0);
           y : out VECTOR_ARRAY_OUT(1 TO n));
end NeuralNet;

architecture Behavioral of NeuralNet is
begin
    PROCESS(clk,w,x)
        VARIABLE weight : VECTOR_ARRAY_IN(1 TO m*n);
        VARIABLE prod,acc: SIGNED (2*b-1 DOWNTO 0);
        VARIABLE sign : STD_LOGIC;
    BEGIN
    --------------shift register inference-----------------
        IF( clk'EVENT AND clk='1') THEN
            weight := w&weight(1 TO n*m-1);
        END IF;
        test <= weight(n*m);
    ---------------initialization:-------------------------
        acc := (OTHERS => '0');
    ---------------multiply-accumulate---------------------
        L1: FOR i IN 1 TO n LOOP
            L2: FOR j IN 1 TO m LOOP
                    prod := x(j)*weight(m*(i-1)+j);
                    sign := acc(acc'LEFT);
                    acc := acc+prod;
    ---------------overflow check---------------------------
                    IF (sign = prod(prod'LEFT)) AND (acc(acc'LEFT)/=sign) THEN
                        acc := (acc'LEFT => sign,OTHERS => NOT sign);
                    END IF;
                END LOOP L2;
    ------------------output:--------------------------------
                y(i) <= acc;
                acc := (OTHERS => '0');
            END LOOP L1;
        END PROCESS;
end Behavioral;
