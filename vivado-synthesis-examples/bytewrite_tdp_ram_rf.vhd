-- True-Dual-Port BRAM with Byte-wide Write Enable
--  Read First mode
--
-- bytewrite_tdp_ram_rf.vhd
--
-- READ_FIRST ByteWide WriteEnable Block RAM Template

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bytewrite_tdp_ram_rf is
	generic(
		SIZE       : integer := 1024;
		ADDR_WIDTH : integer := 10;
		COL_WIDTH  : integer := 9;
		NB_COL     : integer := 4
	);

	port(
		clka  : in  std_logic;
		ena   : in  std_logic;
		wea   : in  std_logic_vector(NB_COL - 1 downto 0);
		addra : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);
		dia   : in  std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
		doa   : out std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
		clkb  : in  std_logic;
		enb   : in  std_logic;
		web   : in  std_logic_vector(NB_COL - 1 downto 0);
		addrb : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);
		dib   : in  std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
		dob   : out std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0)
	);

end bytewrite_tdp_ram_rf;

architecture byte_wr_ram_rf of bytewrite_tdp_ram_rf is
	type ram_type is array (0 to SIZE - 1) of std_logic_vector(NB_COL * COL_WIDTH - 1 downto 0);
	shared variable RAM : ram_type := (others => (others => '0'));

begin

	-------	 Port A	-------
	process(clka)
	begin
		if rising_edge(clka) then
			if ena = '1' then
				doa <= RAM(conv_integer(addra));
				for i in 0 to NB_COL - 1 loop
					if wea(i) = '1' then
						RAM(conv_integer(addra))((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH) := dia((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH);
					end if;
				end loop;
			end if;
		end if;
	end process;

	-------	 Port B	-------
	process(clkb)
	begin
		if rising_edge(clkb) then
			if enb = '1' then
				dob <= RAM(conv_integer(addrb));
				for i in 0 to NB_COL - 1 loop
					if web(i) = '1' then
						RAM(conv_integer(addrb))((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH) := dib((i + 1) * COL_WIDTH - 1 downto i * COL_WIDTH);
					end if;
				end loop;
			end if;
		end if;
	end process;
end byte_wr_ram_rf;
