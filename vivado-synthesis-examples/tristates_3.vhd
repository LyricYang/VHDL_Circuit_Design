-- Tristate Description Using Combinatorial Process
-- Implemented with an OBUF (internal buffer)
--
-- File: tristates_3.vhd
--
library ieee;
use ieee.std_logic_1164.all;

entity tristates_3 is
	generic(
		WIDTH : integer := 8
	);
	port(
		T : in  std_logic;
		I : in  std_logic_vector(WIDTH - 1 downto 0);
		O : out std_logic_vector(WIDTH - 1 downto 0)
	);

end tristates_3;

architecture archi of tristates_3 is
	signal S : std_logic_vector(WIDTH - 1 downto 0);

begin
	process(I, T)
	begin
		if (T = '1') then
			S <= I;
		else
			S <= (others => 'Z');
		end if;
	end process;

	O <= not (S);

end archi;
