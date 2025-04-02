-- Clock Generator Module
-- This module generates clock signals for both simulation and hardware operation
-- It provides a 0.7 Hz clock for state machine operation and a 2.8 Hz clock for blinking indicators
-------------------------------------------------------------------------------

-- Session 202, Team number 7, Bill Lu, Ailu Lin
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- mode is the boolean input to select the clocking outputs for LogicalStep board OR simulation operation
-- clk input is the LogicalStep 50MHz clock input
-- sm_clock is to be connected to the state mackine and other registers in the pipeline (0.7 Hz in real time)
-- blink_clock is used for the blinking indicators only (2.8 Hz in real time)

entity Clock_generator is

	port
	(
		 sim_mode			: in boolean;		-- used to select the clocking frequency for the output signals "sm_clken" and "blink".
		 reset				: in std_logic;
       clkin      		: in  std_logic; -- input used for counter and register clocking
		 sm_clken			: out	std_logic; -- output used to enbl the sm to advance by 1 clk.
		 blink		  		: out std_logic  -- output used for blink signal (1/4 the rate of the sm_clken)
	);

end entity;

architecture rtl of Clock_generator is

-- Counter for clock division
signal digital_counter 					: std_logic_vector(25 downto 0);
-- Clock signals for hardware operation
signal clk_0_7hz, clk_2_8hz					: std_logic;
-- Clock signals for simulation
signal sim_clk_blink, sim_clk_enbl	: std_logic;

-- Pipeline registers for clock enable generation
signal clk_reg_extend					: std_logic_vector(1 downto 0);
-- Internal blink signal
signal blink_sig 							: std_logic;


begin

-- Clock divider process
-- Generates different frequency signals from the 50MHz input clock
clk_divider: process (clkin)
	variable   counter	:  unsigned(25 downto 0);
	
	begin
-- Update counter on rising edge of input clock
		if (rising_edge(clkin))  then
			if(reset ='1') then
				counter := "00000000000000000000000000";
			else
				 counter :=  counter + 1;
			end if;
		end if;
		
		digital_counter <= std_logic_vector(counter);		

	end process;
	
-- Generate different frequency signals using counter bits
clk_0_7hz 				<= digital_counter(25); -- clk_0_7Hz is about 0.7 Hz 
clk_2_8hz 				<= digital_counter(23); -- clk_2_8Hz is about 2.8 Hz
sim_clk_enbl 			<= digital_counter(4);  -- clk_enbl used in simulations
sim_clk_blink 			<= digital_counter(2);  -- clk_blink used in simulations

-- Clock extender process
-- Creates single-cycle enable pulses for the state machine
clk_extender: process (clkin)				   -- clk_extender is an extra pair of serial registers used to create a single one-cycle enable pulse for the state machine
	begin
		if (rising_edge(clkin))  then
			if(reset ='1') then
				-- Reset all signals
				clk_reg_extend(1 downto 0) 	<= "00";
				blink_sig 				 			<= '0';
			elsif(sim_mode) then
				 -- Simulation mode: use faster clocks
				 clk_reg_extend(1 downto 0) 	<= clk_reg_extend(0) & sim_clk_enbl;-- clock register input signal used for simulations
				 blink_sig 		 					<= sim_clk_blink;							-- blink signal input used for blinking in simulations
			else 
				 -- Hardware mode: use normal clocks
				 clk_reg_extend(1 downto 0) 	<= clk_reg_extend(0) & clk_0_7hz ; 	-- clock register input signal used for 0.7Hz clock enbl for LogicalStep Board downloads
				 blink_sig 				 			<= clk_2_8hz;           				-- blink signal input used for LogicalStep Board downloads
				END IF;
		end if;
	end process;

-- Generate single-cycle enable pulse for state machine
sm_clken	<= clk_reg_extend(0) AND (NOT(clk_reg_extend(1)));
-- Connect internal blink signal to output
blink 	<= blink_sig;

end rtl;


