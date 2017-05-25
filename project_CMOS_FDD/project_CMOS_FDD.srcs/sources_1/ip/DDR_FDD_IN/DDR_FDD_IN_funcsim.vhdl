-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2.1 (win64) Build 1302555 Wed Aug  5 13:06:02 MDT 2015
-- Date        : Thu Sep 08 10:25:30 2016
-- Host        : user-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               e:/Project_CMOS_FDD/project_CMOS_FDD/project_CMOS_FDD.srcs/sources_1/ip/DDR_FDD_IN/DDR_FDD_IN_funcsim.vhdl
-- Design      : DDR_FDD_IN
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DDR_FDD_IN_DDR_FDD_IN_selectio_wiz is
  port (
    data_in_from_pins : in STD_LOGIC_VECTOR ( 12 downto 0 );
    data_in_to_device : out STD_LOGIC_VECTOR ( 25 downto 0 );
    clk_in : in STD_LOGIC;
    clk_out : out STD_LOGIC;
    io_reset : in STD_LOGIC
  );
  attribute DEV_W : integer;
  attribute DEV_W of DDR_FDD_IN_DDR_FDD_IN_selectio_wiz : entity is 26;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of DDR_FDD_IN_DDR_FDD_IN_selectio_wiz : entity is "DDR_FDD_IN_selectio_wiz";
  attribute SYS_W : integer;
  attribute SYS_W of DDR_FDD_IN_DDR_FDD_IN_selectio_wiz : entity is 13;
end DDR_FDD_IN_DDR_FDD_IN_selectio_wiz;

architecture STRUCTURE of DDR_FDD_IN_DDR_FDD_IN_selectio_wiz is
  signal clk_in_int : STD_LOGIC;
  signal \^clk_out\ : STD_LOGIC;
  signal data_in_from_pins_int : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal NLW_clkout_buf_inst_CE_UNCONNECTED : STD_LOGIC;
  signal NLW_clkout_buf_inst_CLR_UNCONNECTED : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkout_buf_inst : label is "PRIMITIVE";
  attribute BOX_TYPE of ibuf_clk_inst : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of ibuf_clk_inst : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of ibuf_clk_inst : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of ibuf_clk_inst : label is "AUTO";
  attribute BOX_TYPE of \pins[0].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[0].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[0].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[0].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[0].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ : string;
  attribute \__SRVAL\ of \pins[0].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[10].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[10].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[10].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[10].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[10].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[10].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[11].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[11].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[11].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[11].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[11].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[11].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[12].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[12].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[12].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[12].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[12].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[12].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[1].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[1].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[1].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[1].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[1].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[1].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[2].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[2].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[2].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[2].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[2].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[2].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[3].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[3].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[3].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[3].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[3].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[3].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[4].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[4].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[4].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[4].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[4].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[4].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[5].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[5].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[5].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[5].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[5].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[5].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[6].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[6].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[6].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[6].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[6].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[6].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[7].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[7].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[7].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[7].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[7].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[7].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[8].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[8].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[8].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[8].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[8].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[8].iddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[9].ibuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[9].ibuf_inst\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \pins[9].ibuf_inst\ : label is "0";
  attribute IFD_DELAY_VALUE of \pins[9].ibuf_inst\ : label is "AUTO";
  attribute BOX_TYPE of \pins[9].iddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[9].iddr_inst\ : label is "FALSE";
begin
  clk_out <= \^clk_out\;
clkout_buf_inst: unisim.vcomponents.BUFR
    generic map(
      BUFR_DIVIDE => "BYPASS",
      SIM_DEVICE => "7SERIES"
    )
        port map (
      CE => NLW_clkout_buf_inst_CE_UNCONNECTED,
      CLR => NLW_clkout_buf_inst_CLR_UNCONNECTED,
      I => clk_in_int,
      O => \^clk_out\
    );
ibuf_clk_inst: unisim.vcomponents.IBUF
     port map (
      I => clk_in,
      O => clk_in_int
    );
\pins[0].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(0),
      O => data_in_from_pins_int(0)
    );
\pins[0].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_int(0),
      Q1 => data_in_to_device(0),
      Q2 => data_in_to_device(13),
      R => io_reset,
      S => '0'
    );
\pins[10].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(10),
      O => data_in_from_pins_int(10)
    );
\pins[10].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_int(10),
      Q1 => data_in_to_device(10),
      Q2 => data_in_to_device(23),
      R => io_reset,
      S => '0'
    );
\pins[11].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(11),
      O => data_in_from_pins_int(11)
    );
\pins[11].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_int(11),
      Q1 => data_in_to_device(11),
      Q2 => data_in_to_device(24),
      R => io_reset,
      S => '0'
    );
\pins[12].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(12),
      O => data_in_from_pins_int(12)
    );
\pins[12].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_int(12),
      Q1 => data_in_to_device(12),
      Q2 => data_in_to_device(25),
      R => io_reset,
      S => '0'
    );
\pins[1].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(1),
      O => data_in_from_pins_int(1)
    );
\pins[1].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_int(1),
      Q1 => data_in_to_device(1),
      Q2 => data_in_to_device(14),
      R => io_reset,
      S => '0'
    );
\pins[2].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(2),
      O => data_in_from_pins_int(2)
    );
\pins[2].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_int(2),
      Q1 => data_in_to_device(2),
      Q2 => data_in_to_device(15),
      R => io_reset,
      S => '0'
    );
\pins[3].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(3),
      O => data_in_from_pins_int(3)
    );
\pins[3].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_int(3),
      Q1 => data_in_to_device(3),
      Q2 => data_in_to_device(16),
      R => io_reset,
      S => '0'
    );
\pins[4].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(4),
      O => data_in_from_pins_int(4)
    );
\pins[4].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_int(4),
      Q1 => data_in_to_device(4),
      Q2 => data_in_to_device(17),
      R => io_reset,
      S => '0'
    );
\pins[5].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(5),
      O => data_in_from_pins_int(5)
    );
\pins[5].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_int(5),
      Q1 => data_in_to_device(5),
      Q2 => data_in_to_device(18),
      R => io_reset,
      S => '0'
    );
\pins[6].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(6),
      O => data_in_from_pins_int(6)
    );
\pins[6].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_int(6),
      Q1 => data_in_to_device(6),
      Q2 => data_in_to_device(19),
      R => io_reset,
      S => '0'
    );
\pins[7].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(7),
      O => data_in_from_pins_int(7)
    );
\pins[7].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_int(7),
      Q1 => data_in_to_device(7),
      Q2 => data_in_to_device(20),
      R => io_reset,
      S => '0'
    );
\pins[8].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(8),
      O => data_in_from_pins_int(8)
    );
\pins[8].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_int(8),
      Q1 => data_in_to_device(8),
      Q2 => data_in_to_device(21),
      R => io_reset,
      S => '0'
    );
\pins[9].ibuf_inst\: unisim.vcomponents.IBUF
     port map (
      I => data_in_from_pins(9),
      O => data_in_from_pins_int(9)
    );
\pins[9].iddr_inst\: unisim.vcomponents.IDDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT_Q1 => '0',
      INIT_Q2 => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D => data_in_from_pins_int(9),
      Q1 => data_in_to_device(9),
      Q2 => data_in_to_device(22),
      R => io_reset,
      S => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DDR_FDD_IN is
  port (
    data_in_from_pins : in STD_LOGIC_VECTOR ( 12 downto 0 );
    data_in_to_device : out STD_LOGIC_VECTOR ( 25 downto 0 );
    clk_in : in STD_LOGIC;
    clk_out : out STD_LOGIC;
    io_reset : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of DDR_FDD_IN : entity is true;
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of DDR_FDD_IN : entity is "DDR_FDD_IN,selectio_wiz_v5_1,{component_name=DDR_FDD_IN,bus_dir=INPUTS,bus_sig_type=SINGLE,bus_io_std=LVCMOS25,use_serialization=false,use_phase_detector=false,serialization_factor=4,enable_bitslip=false,enable_train=false,system_data_width=13,bus_in_delay=NONE,bus_out_delay=NONE,clk_sig_type=SINGLE,clk_io_std=LVCMOS18,clk_buf=BUFIO2,active_edge=RISING,clk_delay=NONE,selio_bus_in_delay=NONE,selio_bus_out_delay=NONE,selio_clk_buf=BUFIO,selio_active_edge=DDR,selio_ddr_alignment=OPPOSITE_EDGE,selio_oddr_alignment=SAME_EDGE,ddr_alignment=C0,selio_interface_type=NETWORKING,interface_type=NETWORKING,selio_bus_in_tap=0,selio_bus_out_tap=0,selio_clk_io_std=LVCMOS25,selio_clk_sig_type=SINGLE}";
  attribute DEV_W : integer;
  attribute DEV_W of DDR_FDD_IN : entity is 26;
  attribute SYS_W : integer;
  attribute SYS_W of DDR_FDD_IN : entity is 13;
end DDR_FDD_IN;

architecture STRUCTURE of DDR_FDD_IN is
  attribute DEV_W of inst : label is 26;
  attribute SYS_W of inst : label is 13;
begin
inst: entity work.DDR_FDD_IN_DDR_FDD_IN_selectio_wiz
     port map (
      clk_in => clk_in,
      clk_out => clk_out,
      data_in_from_pins(12 downto 0) => data_in_from_pins(12 downto 0),
      data_in_to_device(25 downto 0) => data_in_to_device(25 downto 0),
      io_reset => io_reset
    );
end STRUCTURE;
