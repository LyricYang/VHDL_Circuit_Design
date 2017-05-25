-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2.1 (win64) Build 1302555 Wed Aug  5 13:06:02 MDT 2015
-- Date        : Thu Sep 08 14:11:39 2016
-- Host        : user-PC running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode funcsim
--               e:/Project_CMOS_FDD/project_CMOS_FDD/project_CMOS_FDD.srcs/sources_1/ip/DDR_FDD_OUT/DDR_FDD_OUT_funcsim.vhdl
-- Design      : DDR_FDD_OUT
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a200tsbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DDR_FDD_OUT_DDR_FDD_OUT_selectio_wiz is
  port (
    data_out_from_device : in STD_LOGIC_VECTOR ( 25 downto 0 );
    data_out_to_pins : out STD_LOGIC_VECTOR ( 12 downto 0 );
    clk_in : in STD_LOGIC;
    clk_out : out STD_LOGIC;
    io_reset : in STD_LOGIC
  );
  attribute DEV_W : integer;
  attribute DEV_W of DDR_FDD_OUT_DDR_FDD_OUT_selectio_wiz : entity is 26;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of DDR_FDD_OUT_DDR_FDD_OUT_selectio_wiz : entity is "DDR_FDD_OUT_selectio_wiz";
  attribute SYS_W : integer;
  attribute SYS_W of DDR_FDD_OUT_DDR_FDD_OUT_selectio_wiz : entity is 13;
end DDR_FDD_OUT_DDR_FDD_OUT_selectio_wiz;

architecture STRUCTURE of DDR_FDD_OUT_DDR_FDD_OUT_selectio_wiz is
  signal clk_in_int : STD_LOGIC;
  signal \^clk_out\ : STD_LOGIC;
  signal data_out_to_pins_int : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal NLW_clkout_buf_inst_CE_UNCONNECTED : STD_LOGIC;
  signal NLW_clkout_buf_inst_CLR_UNCONNECTED : STD_LOGIC;
  signal \NLW_pins[0].oddr_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_pins[10].oddr_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_pins[11].oddr_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_pins[12].oddr_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_pins[1].oddr_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_pins[2].oddr_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_pins[3].oddr_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_pins[4].oddr_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_pins[5].oddr_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_pins[6].oddr_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_pins[7].oddr_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_pins[8].oddr_inst_S_UNCONNECTED\ : STD_LOGIC;
  signal \NLW_pins[9].oddr_inst_S_UNCONNECTED\ : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of clkout_buf_inst : label is "PRIMITIVE";
  attribute BOX_TYPE of ibuf_clk_inst : label is "PRIMITIVE";
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of ibuf_clk_inst : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of ibuf_clk_inst : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of ibuf_clk_inst : label is "AUTO";
  attribute BOX_TYPE of \pins[0].obuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[0].obuf_inst\ : label is "DONT_CARE";
  attribute BOX_TYPE of \pins[0].oddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ : string;
  attribute \__SRVAL\ of \pins[0].oddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[10].obuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[10].obuf_inst\ : label is "DONT_CARE";
  attribute BOX_TYPE of \pins[10].oddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[10].oddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[11].obuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[11].obuf_inst\ : label is "DONT_CARE";
  attribute BOX_TYPE of \pins[11].oddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[11].oddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[12].obuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[12].obuf_inst\ : label is "DONT_CARE";
  attribute BOX_TYPE of \pins[12].oddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[12].oddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[1].obuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[1].obuf_inst\ : label is "DONT_CARE";
  attribute BOX_TYPE of \pins[1].oddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[1].oddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[2].obuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[2].obuf_inst\ : label is "DONT_CARE";
  attribute BOX_TYPE of \pins[2].oddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[2].oddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[3].obuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[3].obuf_inst\ : label is "DONT_CARE";
  attribute BOX_TYPE of \pins[3].oddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[3].oddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[4].obuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[4].obuf_inst\ : label is "DONT_CARE";
  attribute BOX_TYPE of \pins[4].oddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[4].oddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[5].obuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[5].obuf_inst\ : label is "DONT_CARE";
  attribute BOX_TYPE of \pins[5].oddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[5].oddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[6].obuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[6].obuf_inst\ : label is "DONT_CARE";
  attribute BOX_TYPE of \pins[6].oddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[6].oddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[7].obuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[7].obuf_inst\ : label is "DONT_CARE";
  attribute BOX_TYPE of \pins[7].oddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[7].oddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[8].obuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[8].obuf_inst\ : label is "DONT_CARE";
  attribute BOX_TYPE of \pins[8].oddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[8].oddr_inst\ : label is "FALSE";
  attribute BOX_TYPE of \pins[9].obuf_inst\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \pins[9].obuf_inst\ : label is "DONT_CARE";
  attribute BOX_TYPE of \pins[9].oddr_inst\ : label is "PRIMITIVE";
  attribute \__SRVAL\ of \pins[9].oddr_inst\ : label is "FALSE";
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
\pins[0].obuf_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_to_pins_int(0),
      O => data_out_to_pins(0)
    );
\pins[0].oddr_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D1 => data_out_from_device(0),
      D2 => data_out_from_device(13),
      Q => data_out_to_pins_int(0),
      R => io_reset,
      S => \NLW_pins[0].oddr_inst_S_UNCONNECTED\
    );
\pins[10].obuf_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_to_pins_int(10),
      O => data_out_to_pins(10)
    );
\pins[10].oddr_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D1 => data_out_from_device(10),
      D2 => data_out_from_device(23),
      Q => data_out_to_pins_int(10),
      R => io_reset,
      S => \NLW_pins[10].oddr_inst_S_UNCONNECTED\
    );
\pins[11].obuf_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_to_pins_int(11),
      O => data_out_to_pins(11)
    );
\pins[11].oddr_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D1 => data_out_from_device(11),
      D2 => data_out_from_device(24),
      Q => data_out_to_pins_int(11),
      R => io_reset,
      S => \NLW_pins[11].oddr_inst_S_UNCONNECTED\
    );
\pins[12].obuf_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_to_pins_int(12),
      O => data_out_to_pins(12)
    );
\pins[12].oddr_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D1 => data_out_from_device(12),
      D2 => data_out_from_device(25),
      Q => data_out_to_pins_int(12),
      R => io_reset,
      S => \NLW_pins[12].oddr_inst_S_UNCONNECTED\
    );
\pins[1].obuf_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_to_pins_int(1),
      O => data_out_to_pins(1)
    );
\pins[1].oddr_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D1 => data_out_from_device(1),
      D2 => data_out_from_device(14),
      Q => data_out_to_pins_int(1),
      R => io_reset,
      S => \NLW_pins[1].oddr_inst_S_UNCONNECTED\
    );
\pins[2].obuf_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_to_pins_int(2),
      O => data_out_to_pins(2)
    );
\pins[2].oddr_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D1 => data_out_from_device(2),
      D2 => data_out_from_device(15),
      Q => data_out_to_pins_int(2),
      R => io_reset,
      S => \NLW_pins[2].oddr_inst_S_UNCONNECTED\
    );
\pins[3].obuf_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_to_pins_int(3),
      O => data_out_to_pins(3)
    );
\pins[3].oddr_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D1 => data_out_from_device(3),
      D2 => data_out_from_device(16),
      Q => data_out_to_pins_int(3),
      R => io_reset,
      S => \NLW_pins[3].oddr_inst_S_UNCONNECTED\
    );
\pins[4].obuf_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_to_pins_int(4),
      O => data_out_to_pins(4)
    );
\pins[4].oddr_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D1 => data_out_from_device(4),
      D2 => data_out_from_device(17),
      Q => data_out_to_pins_int(4),
      R => io_reset,
      S => \NLW_pins[4].oddr_inst_S_UNCONNECTED\
    );
\pins[5].obuf_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_to_pins_int(5),
      O => data_out_to_pins(5)
    );
\pins[5].oddr_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D1 => data_out_from_device(5),
      D2 => data_out_from_device(18),
      Q => data_out_to_pins_int(5),
      R => io_reset,
      S => \NLW_pins[5].oddr_inst_S_UNCONNECTED\
    );
\pins[6].obuf_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_to_pins_int(6),
      O => data_out_to_pins(6)
    );
\pins[6].oddr_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D1 => data_out_from_device(6),
      D2 => data_out_from_device(19),
      Q => data_out_to_pins_int(6),
      R => io_reset,
      S => \NLW_pins[6].oddr_inst_S_UNCONNECTED\
    );
\pins[7].obuf_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_to_pins_int(7),
      O => data_out_to_pins(7)
    );
\pins[7].oddr_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D1 => data_out_from_device(7),
      D2 => data_out_from_device(20),
      Q => data_out_to_pins_int(7),
      R => io_reset,
      S => \NLW_pins[7].oddr_inst_S_UNCONNECTED\
    );
\pins[8].obuf_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_to_pins_int(8),
      O => data_out_to_pins(8)
    );
\pins[8].oddr_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D1 => data_out_from_device(8),
      D2 => data_out_from_device(21),
      Q => data_out_to_pins_int(8),
      R => io_reset,
      S => \NLW_pins[8].oddr_inst_S_UNCONNECTED\
    );
\pins[9].obuf_inst\: unisim.vcomponents.OBUF
     port map (
      I => data_out_to_pins_int(9),
      O => data_out_to_pins(9)
    );
\pins[9].oddr_inst\: unisim.vcomponents.ODDR
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D1_INVERTED => '0',
      IS_D2_INVERTED => '0',
      SRTYPE => "ASYNC"
    )
        port map (
      C => \^clk_out\,
      CE => '1',
      D1 => data_out_from_device(9),
      D2 => data_out_from_device(22),
      Q => data_out_to_pins_int(9),
      R => io_reset,
      S => \NLW_pins[9].oddr_inst_S_UNCONNECTED\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity DDR_FDD_OUT is
  port (
    data_out_from_device : in STD_LOGIC_VECTOR ( 25 downto 0 );
    data_out_to_pins : out STD_LOGIC_VECTOR ( 12 downto 0 );
    clk_in : in STD_LOGIC;
    clk_out : out STD_LOGIC;
    io_reset : in STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of DDR_FDD_OUT : entity is true;
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of DDR_FDD_OUT : entity is "DDR_FDD_OUT,selectio_wiz_v5_1,{component_name=DDR_FDD_OUT,bus_dir=OUTPUTS,bus_sig_type=SINGLE,bus_io_std=LVCMOS25,use_serialization=false,use_phase_detector=false,serialization_factor=4,enable_bitslip=false,enable_train=false,system_data_width=13,bus_in_delay=NONE,bus_out_delay=NONE,clk_sig_type=SINGLE,clk_io_std=LVCMOS18,clk_buf=BUFIO2,active_edge=RISING,clk_delay=NONE,selio_bus_in_delay=NONE,selio_bus_out_delay=NONE,selio_clk_buf=BUFIO,selio_active_edge=DDR,selio_ddr_alignment=SAME_EDGE_PIPELINED,selio_oddr_alignment=OPPOSITE_EDGE,ddr_alignment=C0,selio_interface_type=NETWORKING,interface_type=NETWORKING,selio_bus_in_tap=0,selio_bus_out_tap=0,selio_clk_io_std=LVCMOS25,selio_clk_sig_type=SINGLE}";
  attribute DEV_W : integer;
  attribute DEV_W of DDR_FDD_OUT : entity is 26;
  attribute SYS_W : integer;
  attribute SYS_W of DDR_FDD_OUT : entity is 13;
end DDR_FDD_OUT;

architecture STRUCTURE of DDR_FDD_OUT is
  attribute DEV_W of inst : label is 26;
  attribute SYS_W of inst : label is 13;
begin
inst: entity work.DDR_FDD_OUT_DDR_FDD_OUT_selectio_wiz
     port map (
      clk_in => clk_in,
      clk_out => clk_out,
      data_out_from_device(25 downto 0) => data_out_from_device(25 downto 0),
      data_out_to_pins(12 downto 0) => data_out_to_pins(12 downto 0),
      io_reset => io_reset
    );
end STRUCTURE;
