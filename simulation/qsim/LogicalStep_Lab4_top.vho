-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"

-- DATE "03/26/2025 10:08:00"

-- 
-- Device: Altera 10M08SAE144C8G Package EQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	LogicalStep_Lab4_top IS
    PORT (
	clkin_50 : IN std_logic;
	rst_n : IN std_logic;
	pb_n : IN std_logic_vector(3 DOWNTO 0);
	sw : IN std_logic_vector(7 DOWNTO 0);
	leds : OUT std_logic_vector(7 DOWNTO 0);
	seg7_data : OUT std_logic_vector(6 DOWNTO 0);
	seg7_char1 : OUT std_logic;
	seg7_char2 : OUT std_logic;
	sm_clken1 : OUT std_logic;
	blink_sig1 : OUT std_logic;
	EW_a : OUT std_logic;
	EW_g : OUT std_logic;
	EW_d : OUT std_logic;
	NS_a : OUT std_logic;
	NS_g : OUT std_logic;
	NS_d : OUT std_logic
	);
END LogicalStep_Lab4_top;

ARCHITECTURE structure OF LogicalStep_Lab4_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clkin_50 : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_pb_n : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_sw : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_leds : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_seg7_data : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_seg7_char1 : std_logic;
SIGNAL ww_seg7_char2 : std_logic;
SIGNAL ww_sm_clken1 : std_logic;
SIGNAL ww_blink_sig1 : std_logic;
SIGNAL ww_EW_a : std_logic;
SIGNAL ww_EW_g : std_logic;
SIGNAL ww_EW_d : std_logic;
SIGNAL ww_NS_a : std_logic;
SIGNAL ww_NS_g : std_logic;
SIGNAL ww_NS_d : std_logic;
SIGNAL \pb_n[2]~input_o\ : std_logic;
SIGNAL \pb_n[3]~input_o\ : std_logic;
SIGNAL \sw[1]~input_o\ : std_logic;
SIGNAL \sw[2]~input_o\ : std_logic;
SIGNAL \sw[3]~input_o\ : std_logic;
SIGNAL \sw[4]~input_o\ : std_logic;
SIGNAL \sw[5]~input_o\ : std_logic;
SIGNAL \sw[6]~input_o\ : std_logic;
SIGNAL \sw[7]~input_o\ : std_logic;
SIGNAL \seg7_data[6]~output_o\ : std_logic;
SIGNAL \leds[0]~output_o\ : std_logic;
SIGNAL \leds[1]~output_o\ : std_logic;
SIGNAL \leds[2]~output_o\ : std_logic;
SIGNAL \leds[3]~output_o\ : std_logic;
SIGNAL \leds[4]~output_o\ : std_logic;
SIGNAL \leds[5]~output_o\ : std_logic;
SIGNAL \leds[6]~output_o\ : std_logic;
SIGNAL \leds[7]~output_o\ : std_logic;
SIGNAL \seg7_data[0]~output_o\ : std_logic;
SIGNAL \seg7_data[1]~output_o\ : std_logic;
SIGNAL \seg7_data[2]~output_o\ : std_logic;
SIGNAL \seg7_data[3]~output_o\ : std_logic;
SIGNAL \seg7_data[4]~output_o\ : std_logic;
SIGNAL \seg7_data[5]~output_o\ : std_logic;
SIGNAL \seg7_char1~output_o\ : std_logic;
SIGNAL \seg7_char2~output_o\ : std_logic;
SIGNAL \sm_clken1~output_o\ : std_logic;
SIGNAL \blink_sig1~output_o\ : std_logic;
SIGNAL \EW_a~output_o\ : std_logic;
SIGNAL \EW_g~output_o\ : std_logic;
SIGNAL \EW_d~output_o\ : std_logic;
SIGNAL \NS_a~output_o\ : std_logic;
SIGNAL \NS_g~output_o\ : std_logic;
SIGNAL \NS_d~output_o\ : std_logic;
SIGNAL \clkin_50~input_o\ : std_logic;
SIGNAL \INST3|clk_divider:counter[0]~1_combout\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \INST2|sreg~1_combout\ : std_logic;
SIGNAL \INST2|sreg~0_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[0]~q\ : std_logic;
SIGNAL \INST3|clk_divider:counter[0]~2\ : std_logic;
SIGNAL \INST3|clk_divider:counter[1]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[1]~q\ : std_logic;
SIGNAL \INST3|clk_divider:counter[1]~2\ : std_logic;
SIGNAL \INST3|clk_divider:counter[2]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[2]~q\ : std_logic;
SIGNAL \INST3|clk_divider:counter[2]~2\ : std_logic;
SIGNAL \INST3|clk_divider:counter[3]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[3]~q\ : std_logic;
SIGNAL \INST3|clk_divider:counter[3]~2\ : std_logic;
SIGNAL \INST3|clk_divider:counter[4]~1_combout\ : std_logic;
SIGNAL \INST3|clk_divider:counter[4]~q\ : std_logic;
SIGNAL \INST3|clk_reg_extend~0_combout\ : std_logic;
SIGNAL \INST3|clk_reg_extend~1_combout\ : std_logic;
SIGNAL \INST3|sm_clken~combout\ : std_logic;
SIGNAL \pb_n[0]~input_o\ : std_logic;
SIGNAL \INST6|sreg~1_combout\ : std_logic;
SIGNAL \INST6|sreg~0_combout\ : std_logic;
SIGNAL \INST7|sreg~0_combout\ : std_logic;
SIGNAL \INST7|sreg~q\ : std_logic;
SIGNAL \pb_n[1]~input_o\ : std_logic;
SIGNAL \INST4|sreg~1_combout\ : std_logic;
SIGNAL \INST4|sreg~0_combout\ : std_logic;
SIGNAL \INST5|sreg~0_combout\ : std_logic;
SIGNAL \INST5|sreg~q\ : std_logic;
SIGNAL \sw[0]~input_o\ : std_logic;
SIGNAL \INST8|Selector2~0_combout\ : std_logic;
SIGNAL \INST8|current_state.s15~q\ : std_logic;
SIGNAL \INST8|current_state~26_combout\ : std_logic;
SIGNAL \INST8|current_state.S0~q\ : std_logic;
SIGNAL \INST8|current_state~29_combout\ : std_logic;
SIGNAL \INST8|current_state.S1~q\ : std_logic;
SIGNAL \INST8|current_state~20_combout\ : std_logic;
SIGNAL \INST8|current_state.S2~q\ : std_logic;
SIGNAL \INST8|current_state~21_combout\ : std_logic;
SIGNAL \INST8|current_state.S3~q\ : std_logic;
SIGNAL \INST8|current_state~18_combout\ : std_logic;
SIGNAL \INST8|current_state.S4~q\ : std_logic;
SIGNAL \INST8|current_state~19_combout\ : std_logic;
SIGNAL \INST8|current_state.S5~q\ : std_logic;
SIGNAL \INST8|WideOr5~0_combout\ : std_logic;
SIGNAL \INST8|Selector0~0_combout\ : std_logic;
SIGNAL \INST8|current_state.S6~q\ : std_logic;
SIGNAL \INST8|current_state~30_combout\ : std_logic;
SIGNAL \INST8|current_state.S7~q\ : std_logic;
SIGNAL \INST8|current_state~27_combout\ : std_logic;
SIGNAL \INST8|current_state.s8~q\ : std_logic;
SIGNAL \INST8|current_state~28_combout\ : std_logic;
SIGNAL \INST8|current_state.s9~q\ : std_logic;
SIGNAL \INST8|current_state~24_combout\ : std_logic;
SIGNAL \INST8|current_state.s10~q\ : std_logic;
SIGNAL \INST8|current_state~25_combout\ : std_logic;
SIGNAL \INST8|current_state.s11~q\ : std_logic;
SIGNAL \INST8|current_state~22_combout\ : std_logic;
SIGNAL \INST8|current_state.s12~q\ : std_logic;
SIGNAL \INST8|current_state~23_combout\ : std_logic;
SIGNAL \INST8|current_state.s13~q\ : std_logic;
SIGNAL \INST8|WideOr9~2_combout\ : std_logic;
SIGNAL \INST8|Selector1~0_combout\ : std_logic;
SIGNAL \INST8|current_state.s14~q\ : std_logic;
SIGNAL \INST8|yellowEW~combout\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[0]~0_combout\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[0]~q\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[1]~1_combout\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[1]~q\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[1]~2\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[2]~1_combout\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[2]~q\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[2]~2\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[3]~1_combout\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[3]~q\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[3]~2\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[4]~1_combout\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[4]~q\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[4]~2\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[5]~1_combout\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[5]~q\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[5]~2\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[6]~1_combout\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[6]~q\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[6]~2\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[7]~1_combout\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[7]~q\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[7]~2\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[8]~1_combout\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[8]~q\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[8]~2\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[9]~1_combout\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[9]~q\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[9]~2\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[10]~1_combout\ : std_logic;
SIGNAL \INST9|clk_proc:COUNT[10]~q\ : std_logic;
SIGNAL \INST8|yellow~0_combout\ : std_logic;
SIGNAL \INST8|WideOr8~0_combout\ : std_logic;
SIGNAL \INST8|WideOr10~0_combout\ : std_logic;
SIGNAL \INST8|WideOr9~1_combout\ : std_logic;
SIGNAL \INST8|WideOr9~0_combout\ : std_logic;
SIGNAL \INST11|process_0~0_combout\ : std_logic;
SIGNAL \INST10|sreg~1_combout\ : std_logic;
SIGNAL \INST10|sreg~0_combout\ : std_logic;
SIGNAL \INST8|WideOr8~1_combout\ : std_logic;
SIGNAL \INST8|WideOr8~combout\ : std_logic;
SIGNAL \INST8|WideOr3~0_combout\ : std_logic;
SIGNAL \INST8|WideOr5~combout\ : std_logic;
SIGNAL \INST11|process_0~1_combout\ : std_logic;
SIGNAL \INST9|DOUT_TEMP[6]~0_combout\ : std_logic;
SIGNAL \INST3|blink_sig~0_combout\ : std_logic;
SIGNAL \INST3|blink_sig~q\ : std_logic;
SIGNAL \INST9|DOUT_TEMP[6]~1_combout\ : std_logic;
SIGNAL \INST8|WideOr7~0_combout\ : std_logic;
SIGNAL \INST8|WideOr10~combout\ : std_logic;
SIGNAL \INST8|WideOr9~combout\ : std_logic;
SIGNAL \INST9|DOUT[0]~0_combout\ : std_logic;
SIGNAL \INST8|Selector4~0_combout\ : std_logic;
SIGNAL \INST8|Selector3~2_combout\ : std_logic;
SIGNAL \INST9|DOUT[3]~1_combout\ : std_logic;
SIGNAL \INST10|sreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INST2|sreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INST3|clk_reg_extend\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INST6|sreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INST4|sreg\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \INST0|sreg4\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \INST0|sreg0\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \INST0|sreg1\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \INST8|ALT_INV_yellow~0_combout\ : std_logic;
SIGNAL \INST8|ALT_INV_WideOr5~combout\ : std_logic;
SIGNAL \INST8|ALT_INV_WideOr8~combout\ : std_logic;
SIGNAL \INST8|ALT_INV_WideOr9~combout\ : std_logic;
SIGNAL \INST8|ALT_INV_WideOr10~combout\ : std_logic;
SIGNAL \INST8|ALT_INV_WideOr3~0_combout\ : std_logic;
SIGNAL \INST9|ALT_INV_clk_proc:COUNT[10]~q\ : std_logic;

BEGIN

ww_clkin_50 <= clkin_50;
ww_rst_n <= rst_n;
ww_pb_n <= pb_n;
ww_sw <= sw;
leds <= ww_leds;
seg7_data <= ww_seg7_data;
seg7_char1 <= ww_seg7_char1;
seg7_char2 <= ww_seg7_char2;
sm_clken1 <= ww_sm_clken1;
blink_sig1 <= ww_blink_sig1;
EW_a <= ww_EW_a;
EW_g <= ww_EW_g;
EW_d <= ww_EW_d;
NS_a <= ww_NS_a;
NS_g <= ww_NS_g;
NS_d <= ww_NS_d;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\INST8|ALT_INV_yellow~0_combout\ <= NOT \INST8|yellow~0_combout\;
\INST8|ALT_INV_WideOr5~combout\ <= NOT \INST8|WideOr5~combout\;
\INST8|ALT_INV_WideOr8~combout\ <= NOT \INST8|WideOr8~combout\;
\INST8|ALT_INV_WideOr9~combout\ <= NOT \INST8|WideOr9~combout\;
\INST8|ALT_INV_WideOr10~combout\ <= NOT \INST8|WideOr10~combout\;
\INST8|ALT_INV_WideOr3~0_combout\ <= NOT \INST8|WideOr3~0_combout\;
\INST9|ALT_INV_clk_proc:COUNT[10]~q\ <= NOT \INST9|clk_proc:COUNT[10]~q\;

\seg7_data[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \INST9|DOUT_TEMP[6]~1_combout\,
	devoe => ww_devoe,
	o => \seg7_data[6]~output_o\);

\leds[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST8|ALT_INV_WideOr3~0_combout\,
	devoe => ww_devoe,
	o => \leds[0]~output_o\);

\leds[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST7|sreg~q\,
	devoe => ww_devoe,
	o => \leds[1]~output_o\);

\leds[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST8|WideOr7~0_combout\,
	devoe => ww_devoe,
	o => \leds[2]~output_o\);

\leds[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST5|sreg~q\,
	devoe => ww_devoe,
	o => \leds[3]~output_o\);

\leds[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST8|ALT_INV_WideOr10~combout\,
	devoe => ww_devoe,
	o => \leds[4]~output_o\);

\leds[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST8|ALT_INV_WideOr9~combout\,
	devoe => ww_devoe,
	o => \leds[5]~output_o\);

\leds[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST8|ALT_INV_WideOr8~combout\,
	devoe => ww_devoe,
	o => \leds[6]~output_o\);

\leds[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST8|ALT_INV_WideOr5~combout\,
	devoe => ww_devoe,
	o => \leds[7]~output_o\);

\seg7_data[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST9|DOUT[0]~0_combout\,
	devoe => ww_devoe,
	o => \seg7_data[0]~output_o\);

\seg7_data[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seg7_data[1]~output_o\);

\seg7_data[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seg7_data[2]~output_o\);

\seg7_data[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST9|DOUT[3]~1_combout\,
	devoe => ww_devoe,
	o => \seg7_data[3]~output_o\);

\seg7_data[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seg7_data[4]~output_o\);

\seg7_data[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \seg7_data[5]~output_o\);

\seg7_char1~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST9|clk_proc:COUNT[10]~q\,
	devoe => ww_devoe,
	o => \seg7_char1~output_o\);

\seg7_char2~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST9|ALT_INV_clk_proc:COUNT[10]~q\,
	devoe => ww_devoe,
	o => \seg7_char2~output_o\);

\sm_clken1~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST3|sm_clken~combout\,
	devoe => ww_devoe,
	o => \sm_clken1~output_o\);

\blink_sig1~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST3|blink_sig~q\,
	devoe => ww_devoe,
	o => \blink_sig1~output_o\);

\EW_a~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST8|ALT_INV_yellow~0_combout\,
	devoe => ww_devoe,
	o => \EW_a~output_o\);

\EW_g~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST8|Selector3~2_combout\,
	devoe => ww_devoe,
	o => \EW_g~output_o\);

\EW_d~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST8|ALT_INV_WideOr5~combout\,
	devoe => ww_devoe,
	o => \EW_d~output_o\);

\NS_a~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST8|yellowEW~combout\,
	devoe => ww_devoe,
	o => \NS_a~output_o\);

\NS_g~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST8|Selector4~0_combout\,
	devoe => ww_devoe,
	o => \NS_g~output_o\);

\NS_d~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \INST8|WideOr5~combout\,
	devoe => ww_devoe,
	o => \NS_d~output_o\);

\clkin_50~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clkin_50,
	o => \clkin_50~input_o\);

\INST3|clk_divider:counter[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[0]~1_combout\ = \INST3|clk_divider:counter[0]~q\ $ (VCC)
-- \INST3|clk_divider:counter[0]~2\ = CARRY(\INST3|clk_divider:counter[0]~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[0]~q\,
	datad => VCC,
	combout => \INST3|clk_divider:counter[0]~1_combout\,
	cout => \INST3|clk_divider:counter[0]~2\);

\rst_n~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_n,
	o => \rst_n~input_o\);

\INST0|sreg4[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \rst_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg4\(0));

\INST0|sreg4[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg4\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg4\(1));

\INST0|sreg4[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg4\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg4\(2));

\INST0|sreg4[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg4\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg4\(3));

\INST2|sreg~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST2|sreg~1_combout\ = (!\INST2|sreg\(1) & (!\INST0|sreg4\(1) & (!\INST0|sreg4\(2) & !\INST0|sreg4\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST2|sreg\(1),
	datab => \INST0|sreg4\(1),
	datac => \INST0|sreg4\(2),
	datad => \INST0|sreg4\(3),
	combout => \INST2|sreg~1_combout\);

\INST2|sreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST2|sreg~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST2|sreg\(0));

\INST2|sreg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST2|sreg~0_combout\ = (\INST2|sreg\(0) & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST2|sreg\(0),
	datad => \INST2|sreg\(1),
	combout => \INST2|sreg~0_combout\);

\INST2|sreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST2|sreg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST2|sreg\(1));

\INST3|clk_divider:counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[0]~1_combout\,
	sclr => \INST2|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[0]~q\);

\INST3|clk_divider:counter[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[1]~1_combout\ = (\INST3|clk_divider:counter[1]~q\ & (!\INST3|clk_divider:counter[0]~2\)) # (!\INST3|clk_divider:counter[1]~q\ & ((\INST3|clk_divider:counter[0]~2\) # (GND)))
-- \INST3|clk_divider:counter[1]~2\ = CARRY((!\INST3|clk_divider:counter[0]~2\) # (!\INST3|clk_divider:counter[1]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[1]~q\,
	datad => VCC,
	cin => \INST3|clk_divider:counter[0]~2\,
	combout => \INST3|clk_divider:counter[1]~1_combout\,
	cout => \INST3|clk_divider:counter[1]~2\);

\INST3|clk_divider:counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[1]~1_combout\,
	sclr => \INST2|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[1]~q\);

\INST3|clk_divider:counter[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[2]~1_combout\ = (\INST3|clk_divider:counter[2]~q\ & (\INST3|clk_divider:counter[1]~2\ $ (GND))) # (!\INST3|clk_divider:counter[2]~q\ & (!\INST3|clk_divider:counter[1]~2\ & VCC))
-- \INST3|clk_divider:counter[2]~2\ = CARRY((\INST3|clk_divider:counter[2]~q\ & !\INST3|clk_divider:counter[1]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[2]~q\,
	datad => VCC,
	cin => \INST3|clk_divider:counter[1]~2\,
	combout => \INST3|clk_divider:counter[2]~1_combout\,
	cout => \INST3|clk_divider:counter[2]~2\);

\INST3|clk_divider:counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[2]~1_combout\,
	sclr => \INST2|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[2]~q\);

\INST3|clk_divider:counter[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[3]~1_combout\ = (\INST3|clk_divider:counter[3]~q\ & (!\INST3|clk_divider:counter[2]~2\)) # (!\INST3|clk_divider:counter[3]~q\ & ((\INST3|clk_divider:counter[2]~2\) # (GND)))
-- \INST3|clk_divider:counter[3]~2\ = CARRY((!\INST3|clk_divider:counter[2]~2\) # (!\INST3|clk_divider:counter[3]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[3]~q\,
	datad => VCC,
	cin => \INST3|clk_divider:counter[2]~2\,
	combout => \INST3|clk_divider:counter[3]~1_combout\,
	cout => \INST3|clk_divider:counter[3]~2\);

\INST3|clk_divider:counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[3]~1_combout\,
	sclr => \INST2|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[3]~q\);

\INST3|clk_divider:counter[4]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_divider:counter[4]~1_combout\ = \INST3|clk_divider:counter[4]~q\ $ (!\INST3|clk_divider:counter[3]~2\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[4]~q\,
	cin => \INST3|clk_divider:counter[3]~2\,
	combout => \INST3|clk_divider:counter[4]~1_combout\);

\INST3|clk_divider:counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_divider:counter[4]~1_combout\,
	sclr => \INST2|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_divider:counter[4]~q\);

\INST3|clk_reg_extend~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_reg_extend~0_combout\ = (\INST3|clk_divider:counter[4]~q\ & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[4]~q\,
	datad => \INST2|sreg\(1),
	combout => \INST3|clk_reg_extend~0_combout\);

\INST3|clk_reg_extend[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_reg_extend~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_reg_extend\(0));

\INST3|clk_reg_extend~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|clk_reg_extend~1_combout\ = (\INST3|clk_reg_extend\(0) & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_reg_extend\(0),
	datad => \INST2|sreg\(1),
	combout => \INST3|clk_reg_extend~1_combout\);

\INST3|clk_reg_extend[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|clk_reg_extend~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|clk_reg_extend\(1));

\INST3|sm_clken\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|sm_clken~combout\ = LCELL((\INST3|clk_reg_extend\(0) & !\INST3|clk_reg_extend\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_reg_extend\(0),
	datad => \INST3|clk_reg_extend\(1),
	combout => \INST3|sm_clken~combout\);

\pb_n[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(0),
	o => \pb_n[0]~input_o\);

\INST0|sreg0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \pb_n[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg0\(0));

\INST0|sreg0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg0\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg0\(1));

\INST0|sreg0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg0\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg0\(2));

\INST0|sreg0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg0\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg0\(3));

\INST6|sreg~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST6|sreg~1_combout\ = (!\INST2|sreg\(1) & (!\INST0|sreg0\(1) & (!\INST0|sreg0\(2) & !\INST0|sreg0\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST2|sreg\(1),
	datab => \INST0|sreg0\(1),
	datac => \INST0|sreg0\(2),
	datad => \INST0|sreg0\(3),
	combout => \INST6|sreg~1_combout\);

\INST6|sreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST6|sreg~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST6|sreg\(0));

\INST6|sreg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST6|sreg~0_combout\ = (\INST6|sreg\(0) & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST6|sreg\(0),
	datad => \INST2|sreg\(1),
	combout => \INST6|sreg~0_combout\);

\INST6|sreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST6|sreg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST6|sreg\(1));

\INST7|sreg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST7|sreg~0_combout\ = (!\INST8|current_state.S6~q\ & (!\INST2|sreg\(1) & ((\INST7|sreg~q\) # (\INST6|sreg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST7|sreg~q\,
	datab => \INST6|sreg\(1),
	datac => \INST8|current_state.S6~q\,
	datad => \INST2|sreg\(1),
	combout => \INST7|sreg~0_combout\);

\INST7|sreg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST7|sreg~0_combout\,
	sclr => \INST2|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST7|sreg~q\);

\pb_n[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(1),
	o => \pb_n[1]~input_o\);

\INST0|sreg1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \pb_n[1]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg1\(0));

\INST0|sreg1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg1\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg1\(1));

\INST0|sreg1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg1\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg1\(2));

\INST0|sreg1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST0|sreg1\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST0|sreg1\(3));

\INST4|sreg~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST4|sreg~1_combout\ = (!\INST2|sreg\(1) & (!\INST0|sreg1\(1) & (!\INST0|sreg1\(2) & !\INST0|sreg1\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST2|sreg\(1),
	datab => \INST0|sreg1\(1),
	datac => \INST0|sreg1\(2),
	datad => \INST0|sreg1\(3),
	combout => \INST4|sreg~1_combout\);

\INST4|sreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST4|sreg~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST4|sreg\(0));

\INST4|sreg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST4|sreg~0_combout\ = (\INST4|sreg\(0) & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST4|sreg\(0),
	datad => \INST2|sreg\(1),
	combout => \INST4|sreg~0_combout\);

\INST4|sreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST4|sreg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST4|sreg\(1));

\INST5|sreg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST5|sreg~0_combout\ = (!\INST8|current_state.s14~q\ & (!\INST2|sreg\(1) & ((\INST5|sreg~q\) # (\INST4|sreg\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST5|sreg~q\,
	datab => \INST4|sreg\(1),
	datac => \INST8|current_state.s14~q\,
	datad => \INST2|sreg\(1),
	combout => \INST5|sreg~0_combout\);

\INST5|sreg\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST5|sreg~0_combout\,
	sclr => \INST2|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST5|sreg~q\);

\sw[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(0),
	o => \sw[0]~input_o\);

\INST8|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|Selector2~0_combout\ = (\INST8|current_state.s14~q\) # ((\INST8|current_state.s15~q\ & \sw[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.s14~q\,
	datab => \INST8|current_state.s15~q\,
	datac => \sw[0]~input_o\,
	combout => \INST8|Selector2~0_combout\);

\INST8|current_state.s15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|Selector2~0_combout\,
	sclr => \INST2|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.s15~q\);

\INST8|current_state~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|current_state~26_combout\ = (!\INST2|sreg\(1) & ((\sw[0]~input_o\) # (!\INST8|current_state.s15~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST2|sreg\(1),
	datab => \INST8|current_state.s15~q\,
	datad => \sw[0]~input_o\,
	combout => \INST8|current_state~26_combout\);

\INST8|current_state.S0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|current_state~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.S0~q\);

\INST8|current_state~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|current_state~29_combout\ = (!\INST8|current_state.S0~q\ & (!\INST2|sreg\(1) & ((\INST7|sreg~q\) # (!\INST5|sreg~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST7|sreg~q\,
	datab => \INST5|sreg~q\,
	datac => \INST8|current_state.S0~q\,
	datad => \INST2|sreg\(1),
	combout => \INST8|current_state~29_combout\);

\INST8|current_state.S1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|current_state~29_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.S1~q\);

\INST8|current_state~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|current_state~20_combout\ = (\INST8|current_state.S1~q\ & (!\INST2|sreg\(1) & ((\INST7|sreg~q\) # (!\INST5|sreg~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S1~q\,
	datab => \INST7|sreg~q\,
	datac => \INST5|sreg~q\,
	datad => \INST2|sreg\(1),
	combout => \INST8|current_state~20_combout\);

\INST8|current_state.S2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|current_state~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.S2~q\);

\INST8|current_state~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|current_state~21_combout\ = (\INST8|current_state.S2~q\ & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S2~q\,
	datad => \INST2|sreg\(1),
	combout => \INST8|current_state~21_combout\);

\INST8|current_state.S3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|current_state~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.S3~q\);

\INST8|current_state~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|current_state~18_combout\ = (\INST8|current_state.S3~q\ & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S3~q\,
	datad => \INST2|sreg\(1),
	combout => \INST8|current_state~18_combout\);

\INST8|current_state.S4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|current_state~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.S4~q\);

\INST8|current_state~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|current_state~19_combout\ = (\INST8|current_state.S4~q\ & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S4~q\,
	datad => \INST2|sreg\(1),
	combout => \INST8|current_state~19_combout\);

\INST8|current_state.S5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|current_state~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.S5~q\);

\INST8|WideOr5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|WideOr5~0_combout\ = (\INST8|current_state.S0~q\ & !\INST8|current_state.S1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S0~q\,
	datad => \INST8|current_state.S1~q\,
	combout => \INST8|WideOr5~0_combout\);

\INST8|Selector0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|Selector0~0_combout\ = (\INST8|current_state.S5~q\) # ((\INST5|sreg~q\ & (!\INST7|sreg~q\ & !\INST8|WideOr5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S5~q\,
	datab => \INST5|sreg~q\,
	datac => \INST7|sreg~q\,
	datad => \INST8|WideOr5~0_combout\,
	combout => \INST8|Selector0~0_combout\);

\INST8|current_state.S6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|Selector0~0_combout\,
	sclr => \INST2|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.S6~q\);

\INST8|current_state~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|current_state~30_combout\ = (\INST8|current_state.S6~q\ & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S6~q\,
	datad => \INST2|sreg\(1),
	combout => \INST8|current_state~30_combout\);

\INST8|current_state.S7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|current_state~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.S7~q\);

\INST8|current_state~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|current_state~27_combout\ = (\INST8|current_state.S7~q\ & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S7~q\,
	datad => \INST2|sreg\(1),
	combout => \INST8|current_state~27_combout\);

\INST8|current_state.s8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|current_state~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.s8~q\);

\INST8|current_state~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|current_state~28_combout\ = (\INST8|current_state.s8~q\ & (!\INST2|sreg\(1) & ((\INST5|sreg~q\) # (!\INST7|sreg~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.s8~q\,
	datab => \INST5|sreg~q\,
	datac => \INST7|sreg~q\,
	datad => \INST2|sreg\(1),
	combout => \INST8|current_state~28_combout\);

\INST8|current_state.s9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|current_state~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.s9~q\);

\INST8|current_state~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|current_state~24_combout\ = (\INST8|current_state.s9~q\ & (!\INST2|sreg\(1) & ((\INST5|sreg~q\) # (!\INST7|sreg~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.s9~q\,
	datab => \INST5|sreg~q\,
	datac => \INST7|sreg~q\,
	datad => \INST2|sreg\(1),
	combout => \INST8|current_state~24_combout\);

\INST8|current_state.s10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|current_state~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.s10~q\);

\INST8|current_state~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|current_state~25_combout\ = (\INST8|current_state.s10~q\ & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.s10~q\,
	datad => \INST2|sreg\(1),
	combout => \INST8|current_state~25_combout\);

\INST8|current_state.s11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|current_state~25_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.s11~q\);

\INST8|current_state~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|current_state~22_combout\ = (\INST8|current_state.s11~q\ & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.s11~q\,
	datad => \INST2|sreg\(1),
	combout => \INST8|current_state~22_combout\);

\INST8|current_state.s12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|current_state~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.s12~q\);

\INST8|current_state~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|current_state~23_combout\ = (\INST8|current_state.s12~q\ & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.s12~q\,
	datad => \INST2|sreg\(1),
	combout => \INST8|current_state~23_combout\);

\INST8|current_state.s13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|current_state~23_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.s13~q\);

\INST8|WideOr9~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|WideOr9~2_combout\ = (!\INST8|current_state.s8~q\ & !\INST8|current_state.s9~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \INST8|current_state.s8~q\,
	datad => \INST8|current_state.s9~q\,
	combout => \INST8|WideOr9~2_combout\);

\INST8|Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|Selector1~0_combout\ = (\INST8|current_state.s13~q\) # ((\INST7|sreg~q\ & (!\INST5|sreg~q\ & !\INST8|WideOr9~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.s13~q\,
	datab => \INST7|sreg~q\,
	datac => \INST5|sreg~q\,
	datad => \INST8|WideOr9~2_combout\,
	combout => \INST8|Selector1~0_combout\);

\INST8|current_state.s14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \INST3|sm_clken~combout\,
	d => \INST8|Selector1~0_combout\,
	sclr => \INST2|sreg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST8|current_state.s14~q\);

\INST8|yellowEW\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|yellowEW~combout\ = (\INST8|current_state.s14~q\) # (\INST8|current_state.s15~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.s14~q\,
	datab => \INST8|current_state.s15~q\,
	combout => \INST8|yellowEW~combout\);

\INST9|clk_proc:COUNT[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|clk_proc:COUNT[0]~0_combout\ = !\INST9|clk_proc:COUNT[0]~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST9|clk_proc:COUNT[0]~q\,
	combout => \INST9|clk_proc:COUNT[0]~0_combout\);

\INST9|clk_proc:COUNT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST9|clk_proc:COUNT[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST9|clk_proc:COUNT[0]~q\);

\INST9|clk_proc:COUNT[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|clk_proc:COUNT[1]~1_combout\ = (\INST9|clk_proc:COUNT[1]~q\ & (\INST9|clk_proc:COUNT[0]~q\ $ (VCC))) # (!\INST9|clk_proc:COUNT[1]~q\ & (\INST9|clk_proc:COUNT[0]~q\ & VCC))
-- \INST9|clk_proc:COUNT[1]~2\ = CARRY((\INST9|clk_proc:COUNT[1]~q\ & \INST9|clk_proc:COUNT[0]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST9|clk_proc:COUNT[1]~q\,
	datab => \INST9|clk_proc:COUNT[0]~q\,
	datad => VCC,
	combout => \INST9|clk_proc:COUNT[1]~1_combout\,
	cout => \INST9|clk_proc:COUNT[1]~2\);

\INST9|clk_proc:COUNT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST9|clk_proc:COUNT[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST9|clk_proc:COUNT[1]~q\);

\INST9|clk_proc:COUNT[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|clk_proc:COUNT[2]~1_combout\ = (\INST9|clk_proc:COUNT[2]~q\ & (!\INST9|clk_proc:COUNT[1]~2\)) # (!\INST9|clk_proc:COUNT[2]~q\ & ((\INST9|clk_proc:COUNT[1]~2\) # (GND)))
-- \INST9|clk_proc:COUNT[2]~2\ = CARRY((!\INST9|clk_proc:COUNT[1]~2\) # (!\INST9|clk_proc:COUNT[2]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST9|clk_proc:COUNT[2]~q\,
	datad => VCC,
	cin => \INST9|clk_proc:COUNT[1]~2\,
	combout => \INST9|clk_proc:COUNT[2]~1_combout\,
	cout => \INST9|clk_proc:COUNT[2]~2\);

\INST9|clk_proc:COUNT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST9|clk_proc:COUNT[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST9|clk_proc:COUNT[2]~q\);

\INST9|clk_proc:COUNT[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|clk_proc:COUNT[3]~1_combout\ = (\INST9|clk_proc:COUNT[3]~q\ & (\INST9|clk_proc:COUNT[2]~2\ $ (GND))) # (!\INST9|clk_proc:COUNT[3]~q\ & (!\INST9|clk_proc:COUNT[2]~2\ & VCC))
-- \INST9|clk_proc:COUNT[3]~2\ = CARRY((\INST9|clk_proc:COUNT[3]~q\ & !\INST9|clk_proc:COUNT[2]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST9|clk_proc:COUNT[3]~q\,
	datad => VCC,
	cin => \INST9|clk_proc:COUNT[2]~2\,
	combout => \INST9|clk_proc:COUNT[3]~1_combout\,
	cout => \INST9|clk_proc:COUNT[3]~2\);

\INST9|clk_proc:COUNT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST9|clk_proc:COUNT[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST9|clk_proc:COUNT[3]~q\);

\INST9|clk_proc:COUNT[4]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|clk_proc:COUNT[4]~1_combout\ = (\INST9|clk_proc:COUNT[4]~q\ & (!\INST9|clk_proc:COUNT[3]~2\)) # (!\INST9|clk_proc:COUNT[4]~q\ & ((\INST9|clk_proc:COUNT[3]~2\) # (GND)))
-- \INST9|clk_proc:COUNT[4]~2\ = CARRY((!\INST9|clk_proc:COUNT[3]~2\) # (!\INST9|clk_proc:COUNT[4]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST9|clk_proc:COUNT[4]~q\,
	datad => VCC,
	cin => \INST9|clk_proc:COUNT[3]~2\,
	combout => \INST9|clk_proc:COUNT[4]~1_combout\,
	cout => \INST9|clk_proc:COUNT[4]~2\);

\INST9|clk_proc:COUNT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST9|clk_proc:COUNT[4]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST9|clk_proc:COUNT[4]~q\);

\INST9|clk_proc:COUNT[5]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|clk_proc:COUNT[5]~1_combout\ = (\INST9|clk_proc:COUNT[5]~q\ & (\INST9|clk_proc:COUNT[4]~2\ $ (GND))) # (!\INST9|clk_proc:COUNT[5]~q\ & (!\INST9|clk_proc:COUNT[4]~2\ & VCC))
-- \INST9|clk_proc:COUNT[5]~2\ = CARRY((\INST9|clk_proc:COUNT[5]~q\ & !\INST9|clk_proc:COUNT[4]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST9|clk_proc:COUNT[5]~q\,
	datad => VCC,
	cin => \INST9|clk_proc:COUNT[4]~2\,
	combout => \INST9|clk_proc:COUNT[5]~1_combout\,
	cout => \INST9|clk_proc:COUNT[5]~2\);

\INST9|clk_proc:COUNT[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST9|clk_proc:COUNT[5]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST9|clk_proc:COUNT[5]~q\);

\INST9|clk_proc:COUNT[6]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|clk_proc:COUNT[6]~1_combout\ = (\INST9|clk_proc:COUNT[6]~q\ & (!\INST9|clk_proc:COUNT[5]~2\)) # (!\INST9|clk_proc:COUNT[6]~q\ & ((\INST9|clk_proc:COUNT[5]~2\) # (GND)))
-- \INST9|clk_proc:COUNT[6]~2\ = CARRY((!\INST9|clk_proc:COUNT[5]~2\) # (!\INST9|clk_proc:COUNT[6]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST9|clk_proc:COUNT[6]~q\,
	datad => VCC,
	cin => \INST9|clk_proc:COUNT[5]~2\,
	combout => \INST9|clk_proc:COUNT[6]~1_combout\,
	cout => \INST9|clk_proc:COUNT[6]~2\);

\INST9|clk_proc:COUNT[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST9|clk_proc:COUNT[6]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST9|clk_proc:COUNT[6]~q\);

\INST9|clk_proc:COUNT[7]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|clk_proc:COUNT[7]~1_combout\ = (\INST9|clk_proc:COUNT[7]~q\ & (\INST9|clk_proc:COUNT[6]~2\ $ (GND))) # (!\INST9|clk_proc:COUNT[7]~q\ & (!\INST9|clk_proc:COUNT[6]~2\ & VCC))
-- \INST9|clk_proc:COUNT[7]~2\ = CARRY((\INST9|clk_proc:COUNT[7]~q\ & !\INST9|clk_proc:COUNT[6]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST9|clk_proc:COUNT[7]~q\,
	datad => VCC,
	cin => \INST9|clk_proc:COUNT[6]~2\,
	combout => \INST9|clk_proc:COUNT[7]~1_combout\,
	cout => \INST9|clk_proc:COUNT[7]~2\);

\INST9|clk_proc:COUNT[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST9|clk_proc:COUNT[7]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST9|clk_proc:COUNT[7]~q\);

\INST9|clk_proc:COUNT[8]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|clk_proc:COUNT[8]~1_combout\ = (\INST9|clk_proc:COUNT[8]~q\ & (!\INST9|clk_proc:COUNT[7]~2\)) # (!\INST9|clk_proc:COUNT[8]~q\ & ((\INST9|clk_proc:COUNT[7]~2\) # (GND)))
-- \INST9|clk_proc:COUNT[8]~2\ = CARRY((!\INST9|clk_proc:COUNT[7]~2\) # (!\INST9|clk_proc:COUNT[8]~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST9|clk_proc:COUNT[8]~q\,
	datad => VCC,
	cin => \INST9|clk_proc:COUNT[7]~2\,
	combout => \INST9|clk_proc:COUNT[8]~1_combout\,
	cout => \INST9|clk_proc:COUNT[8]~2\);

\INST9|clk_proc:COUNT[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST9|clk_proc:COUNT[8]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST9|clk_proc:COUNT[8]~q\);

\INST9|clk_proc:COUNT[9]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|clk_proc:COUNT[9]~1_combout\ = (\INST9|clk_proc:COUNT[9]~q\ & (\INST9|clk_proc:COUNT[8]~2\ $ (GND))) # (!\INST9|clk_proc:COUNT[9]~q\ & (!\INST9|clk_proc:COUNT[8]~2\ & VCC))
-- \INST9|clk_proc:COUNT[9]~2\ = CARRY((\INST9|clk_proc:COUNT[9]~q\ & !\INST9|clk_proc:COUNT[8]~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST9|clk_proc:COUNT[9]~q\,
	datad => VCC,
	cin => \INST9|clk_proc:COUNT[8]~2\,
	combout => \INST9|clk_proc:COUNT[9]~1_combout\,
	cout => \INST9|clk_proc:COUNT[9]~2\);

\INST9|clk_proc:COUNT[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST9|clk_proc:COUNT[9]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST9|clk_proc:COUNT[9]~q\);

\INST9|clk_proc:COUNT[10]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|clk_proc:COUNT[10]~1_combout\ = \INST9|clk_proc:COUNT[10]~q\ $ (\INST9|clk_proc:COUNT[9]~2\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \INST9|clk_proc:COUNT[10]~q\,
	cin => \INST9|clk_proc:COUNT[9]~2\,
	combout => \INST9|clk_proc:COUNT[10]~1_combout\);

\INST9|clk_proc:COUNT[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST9|clk_proc:COUNT[10]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST9|clk_proc:COUNT[10]~q\);

\INST8|yellow~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|yellow~0_combout\ = (!\INST8|current_state.S6~q\ & !\INST8|current_state.S7~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \INST8|current_state.S6~q\,
	datad => \INST8|current_state.S7~q\,
	combout => \INST8|yellow~0_combout\);

\INST8|WideOr8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|WideOr8~0_combout\ = (\INST8|current_state.S0~q\ & (!\INST8|current_state.S2~q\ & (!\INST8|current_state.s10~q\ & !\INST8|current_state.s8~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S0~q\,
	datab => \INST8|current_state.S2~q\,
	datac => \INST8|current_state.s10~q\,
	datad => \INST8|current_state.s8~q\,
	combout => \INST8|WideOr8~0_combout\);

\INST8|WideOr10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|WideOr10~0_combout\ = (\INST8|current_state.S4~q\) # ((\INST8|current_state.s12~q\) # ((\INST8|current_state.S6~q\) # (\INST8|current_state.s14~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S4~q\,
	datab => \INST8|current_state.s12~q\,
	datac => \INST8|current_state.S6~q\,
	datad => \INST8|current_state.s14~q\,
	combout => \INST8|WideOr10~0_combout\);

\INST8|WideOr9~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|WideOr9~1_combout\ = (\INST8|current_state.s12~q\) # ((\INST8|current_state.s13~q\) # ((\INST8|current_state.S1~q\) # (!\INST8|current_state.S0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.s12~q\,
	datab => \INST8|current_state.s13~q\,
	datac => \INST8|current_state.S1~q\,
	datad => \INST8|current_state.S0~q\,
	combout => \INST8|WideOr9~1_combout\);

\INST8|WideOr9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|WideOr9~0_combout\ = (\INST8|current_state.S4~q\) # ((\INST8|current_state.S5~q\) # ((\INST8|current_state.s8~q\) # (\INST8|current_state.s9~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S4~q\,
	datab => \INST8|current_state.S5~q\,
	datac => \INST8|current_state.s8~q\,
	datad => \INST8|current_state.s9~q\,
	combout => \INST8|WideOr9~0_combout\);

\INST11|process_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST11|process_0~0_combout\ = (\INST8|WideOr8~0_combout\ & (!\INST8|WideOr10~0_combout\ & (!\INST8|WideOr9~1_combout\ & !\INST8|WideOr9~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|WideOr8~0_combout\,
	datab => \INST8|WideOr10~0_combout\,
	datac => \INST8|WideOr9~1_combout\,
	datad => \INST8|WideOr9~0_combout\,
	combout => \INST11|process_0~0_combout\);

\INST10|sreg~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST10|sreg~1_combout\ = (\sw[0]~input_o\ & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sw[0]~input_o\,
	datad => \INST2|sreg\(1),
	combout => \INST10|sreg~1_combout\);

\INST10|sreg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST10|sreg~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST10|sreg\(0));

\INST10|sreg~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST10|sreg~0_combout\ = (\INST10|sreg\(0) & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST10|sreg\(0),
	datad => \INST2|sreg\(1),
	combout => \INST10|sreg~0_combout\);

\INST10|sreg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST10|sreg~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST10|sreg\(1));

\INST8|WideOr8~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|WideOr8~1_combout\ = (\INST8|current_state.S3~q\) # ((\INST8|current_state.s11~q\) # ((\INST8|current_state.S1~q\) # (\INST8|current_state.s9~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S3~q\,
	datab => \INST8|current_state.s11~q\,
	datac => \INST8|current_state.S1~q\,
	datad => \INST8|current_state.s9~q\,
	combout => \INST8|WideOr8~1_combout\);

\INST8|WideOr8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|WideOr8~combout\ = (\INST8|WideOr8~1_combout\) # (!\INST8|WideOr8~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|WideOr8~1_combout\,
	datad => \INST8|WideOr8~0_combout\,
	combout => \INST8|WideOr8~combout\);

\INST8|WideOr3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|WideOr3~0_combout\ = (!\INST8|current_state.S4~q\ & (!\INST8|current_state.S5~q\ & (!\INST8|current_state.S2~q\ & !\INST8|current_state.S3~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S4~q\,
	datab => \INST8|current_state.S5~q\,
	datac => \INST8|current_state.S2~q\,
	datad => \INST8|current_state.S3~q\,
	combout => \INST8|WideOr3~0_combout\);

\INST8|WideOr5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|WideOr5~combout\ = (\INST8|current_state.S6~q\) # ((\INST8|current_state.S7~q\) # ((!\INST8|WideOr5~0_combout\) # (!\INST8|WideOr3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S6~q\,
	datab => \INST8|current_state.S7~q\,
	datac => \INST8|WideOr3~0_combout\,
	datad => \INST8|WideOr5~0_combout\,
	combout => \INST8|WideOr5~combout\);

\INST11|process_0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST11|process_0~1_combout\ = (\INST11|process_0~0_combout\ & (\INST10|sreg\(1) & (!\INST8|WideOr8~combout\ & !\INST8|WideOr5~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST11|process_0~0_combout\,
	datab => \INST10|sreg\(1),
	datac => \INST8|WideOr8~combout\,
	datad => \INST8|WideOr5~combout\,
	combout => \INST11|process_0~1_combout\);

\INST9|DOUT_TEMP[6]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|DOUT_TEMP[6]~0_combout\ = (\INST9|clk_proc:COUNT[10]~q\ & (\INST8|yellowEW~combout\ & ((!\INST11|process_0~1_combout\)))) # (!\INST9|clk_proc:COUNT[10]~q\ & (((!\INST8|yellow~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001110001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|yellowEW~combout\,
	datab => \INST9|clk_proc:COUNT[10]~q\,
	datac => \INST8|yellow~0_combout\,
	datad => \INST11|process_0~1_combout\,
	combout => \INST9|DOUT_TEMP[6]~0_combout\);

\INST3|blink_sig~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST3|blink_sig~0_combout\ = (\INST3|clk_divider:counter[2]~q\ & !\INST2|sreg\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST3|clk_divider:counter[2]~q\,
	datad => \INST2|sreg\(1),
	combout => \INST3|blink_sig~0_combout\);

\INST3|blink_sig\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkin_50~input_o\,
	d => \INST3|blink_sig~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \INST3|blink_sig~q\);

\INST9|DOUT_TEMP[6]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|DOUT_TEMP[6]~1_combout\ = (\INST9|DOUT_TEMP[6]~0_combout\) # ((\INST9|clk_proc:COUNT[10]~q\ & (\INST3|blink_sig~q\ & \INST11|process_0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST9|DOUT_TEMP[6]~0_combout\,
	datab => \INST9|clk_proc:COUNT[10]~q\,
	datac => \INST3|blink_sig~q\,
	datad => \INST11|process_0~1_combout\,
	combout => \INST9|DOUT_TEMP[6]~1_combout\);

\INST8|WideOr7~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|WideOr7~0_combout\ = (\INST8|current_state.s12~q\) # ((\INST8|current_state.s13~q\) # ((\INST8|current_state.s10~q\) # (\INST8|current_state.s11~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.s12~q\,
	datab => \INST8|current_state.s13~q\,
	datac => \INST8|current_state.s10~q\,
	datad => \INST8|current_state.s11~q\,
	combout => \INST8|WideOr7~0_combout\);

\INST8|WideOr10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|WideOr10~combout\ = (\INST8|WideOr10~0_combout\) # (!\INST8|WideOr8~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|WideOr10~0_combout\,
	datad => \INST8|WideOr8~0_combout\,
	combout => \INST8|WideOr10~combout\);

\INST8|WideOr9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|WideOr9~combout\ = (\INST8|current_state.s12~q\) # ((\INST8|current_state.s13~q\) # ((\INST8|WideOr9~0_combout\) # (!\INST8|WideOr5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.s12~q\,
	datab => \INST8|current_state.s13~q\,
	datac => \INST8|WideOr9~0_combout\,
	datad => \INST8|WideOr5~0_combout\,
	combout => \INST8|WideOr9~combout\);

\INST9|DOUT[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|DOUT[0]~0_combout\ = (\INST9|clk_proc:COUNT[10]~q\ & (\INST8|WideOr5~combout\)) # (!\INST9|clk_proc:COUNT[10]~q\ & ((\INST11|process_0~1_combout\ & ((\INST3|blink_sig~q\))) # (!\INST11|process_0~1_combout\ & (!\INST8|WideOr5~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|WideOr5~combout\,
	datab => \INST3|blink_sig~q\,
	datac => \INST11|process_0~1_combout\,
	datad => \INST9|clk_proc:COUNT[10]~q\,
	combout => \INST9|DOUT[0]~0_combout\);

\INST8|Selector4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|Selector4~0_combout\ = (\INST8|WideOr7~0_combout\) # ((\INST3|blink_sig~q\ & ((\INST8|current_state.s8~q\) # (\INST8|current_state.s9~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|WideOr7~0_combout\,
	datab => \INST3|blink_sig~q\,
	datac => \INST8|current_state.s8~q\,
	datad => \INST8|current_state.s9~q\,
	combout => \INST8|Selector4~0_combout\);

\INST8|Selector3~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST8|Selector3~2_combout\ = ((\INST3|blink_sig~q\ & ((\INST8|current_state.S1~q\) # (!\INST8|current_state.S0~q\)))) # (!\INST8|WideOr3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|current_state.S0~q\,
	datab => \INST8|current_state.S1~q\,
	datac => \INST3|blink_sig~q\,
	datad => \INST8|WideOr3~0_combout\,
	combout => \INST8|Selector3~2_combout\);

\INST9|DOUT[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \INST9|DOUT[3]~1_combout\ = (\INST9|clk_proc:COUNT[10]~q\ & (\INST8|Selector4~0_combout\)) # (!\INST9|clk_proc:COUNT[10]~q\ & ((\INST8|Selector3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \INST8|Selector4~0_combout\,
	datab => \INST8|Selector3~2_combout\,
	datad => \INST9|clk_proc:COUNT[10]~q\,
	combout => \INST9|DOUT[3]~1_combout\);

\pb_n[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(2),
	o => \pb_n[2]~input_o\);

\pb_n[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pb_n(3),
	o => \pb_n[3]~input_o\);

\sw[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(1),
	o => \sw[1]~input_o\);

\sw[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(2),
	o => \sw[2]~input_o\);

\sw[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(3),
	o => \sw[3]~input_o\);

\sw[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(4),
	o => \sw[4]~input_o\);

\sw[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(5),
	o => \sw[5]~input_o\);

\sw[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(6),
	o => \sw[6]~input_o\);

\sw[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sw(7),
	o => \sw[7]~input_o\);

ww_leds(0) <= \leds[0]~output_o\;

ww_leds(1) <= \leds[1]~output_o\;

ww_leds(2) <= \leds[2]~output_o\;

ww_leds(3) <= \leds[3]~output_o\;

ww_leds(4) <= \leds[4]~output_o\;

ww_leds(5) <= \leds[5]~output_o\;

ww_leds(6) <= \leds[6]~output_o\;

ww_leds(7) <= \leds[7]~output_o\;

ww_seg7_data(0) <= \seg7_data[0]~output_o\;

ww_seg7_data(1) <= \seg7_data[1]~output_o\;

ww_seg7_data(2) <= \seg7_data[2]~output_o\;

ww_seg7_data(3) <= \seg7_data[3]~output_o\;

ww_seg7_data(4) <= \seg7_data[4]~output_o\;

ww_seg7_data(5) <= \seg7_data[5]~output_o\;

ww_seg7_data(6) <= \seg7_data[6]~output_o\;

ww_seg7_char1 <= \seg7_char1~output_o\;

ww_seg7_char2 <= \seg7_char2~output_o\;

ww_sm_clken1 <= \sm_clken1~output_o\;

ww_blink_sig1 <= \blink_sig1~output_o\;

ww_EW_a <= \EW_a~output_o\;

ww_EW_g <= \EW_g~output_o\;

ww_EW_d <= \EW_d~output_o\;

ww_NS_a <= \NS_a~output_o\;

ww_NS_g <= \NS_g~output_o\;

ww_NS_d <= \NS_d~output_o\;
END structure;


