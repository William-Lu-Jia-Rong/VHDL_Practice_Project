-- State Machine for Traffic Light Control System
-- This module implements a Mealy state machine that controls traffic lights at an intersection
-- It handles both North-South and East-West traffic directions
-- The system includes pedestrian crossing control and emergency vehicle handling
-- Inputs: NSRE, EWRE (Transition Section), blink_sig (Decoder Section)
-- Outputs: All outputs are generated in the Decoder Section

library ieee;
use ieee.std_logic_1164.all;  -- For standard logic types
use ieee.numeric_std.all;     -- For numeric operations

Entity State_Machine IS Port
(
 clk                             : in std_logic;  -- Global system clock (clkin_50)
 -- Clock and control signals
 clk_enable, reset, blink_sig, enable		: IN std_logic;  -- Control signals for system operation
 -- Traffic request signals (used in Transition Section)
 NSRE, EWRE 									: IN std_logic;  -- North-South and East-West request signals
 
 -- North-South traffic light outputs (from Decoder Section)
 green, yellow, red						   : OUT std_logic;  -- NS traffic light states
 -- East-West traffic light outputs (from Decoder Section)
 greenEW, yellowEW, redEW					: OUT std_logic;  -- EW traffic light states
 -- Control signals for pedestrian crossing and register clearing (from Decoder Section)
 NS_CROS, EW_CROS, NSREGISTER_CLEAR, EWREGISTER_CLEAR   : OUT std_logic;	-- Pedestrian crossing and register control
 -- Current state output for debugging (from Decoder Section)
 stateout										: OUT std_logic_vector(3 downto 0)  -- Current state display
 );
END ENTITY;
 

 Architecture SM of State_Machine is
 
 -- Define all possible states for the traffic light system
 -- States S0-S7: North-South traffic control
 -- States S8-S15: East-West traffic control
 TYPE STATE_NAMES IS (S0, S1, S2, S3, S4, S5, S6, S7, s8, s9, s10, s11, s12, s13, s14, s15);   

 -- Signals to track current and next state
 SIGNAL current_state, next_state	:  STATE_NAMES;     	

 BEGIN
 
 -------------------------------------------------------------------------------
 -- State Machine Implementation
 -- Consists of three main processes:
 -- 1. Register Section (Sequential Logic): Updates current state on clock edge
 -- 2. Transition Section (Combinational Logic): Determines next state based on inputs
 -- 3. Decoder Section (Combinational Logic): Generates output signals for each state
 -------------------------------------------------------------------------------

 -------------------------------------------------------------------------------
 -- Sequential Logic Section
 -- Register Process: Updates current state on global system clock edge
 -- Only updates when clock enable is active
 -------------------------------------------------------------------------------
 Register_Section: PROCESS (clk)  
BEGIN
	IF(rising_edge(clk)) THEN
		IF (reset = '1') THEN
			current_state <= S0;  -- Reset to initial state
		ELSIF (reset = '0' and clk_enable = '1') THEN
			current_state <= next_state;  -- Update to next state only when enabled
		END IF;
	END IF;
END PROCESS;	

 -------------------------------------------------------------------------------
 -- Combinational Logic Section
 -- Transition Process: Determines next state based on current state and inputs
 -- Uses NSRE and EWRE inputs for state transitions
 -- This is pure combinational logic
 -------------------------------------------------------------------------------
Transition_Section: PROCESS (NSRE, EWRE, current_state, enable) 
BEGIN
  CASE current_state IS
        WHEN S0 =>		-- Initial state: NS green blinking
				IF(EWRE='1' and NSRE='0') THEN
					next_state <= S6;  -- Emergency vehicle priority
				ELSE
					next_state <= S1;  -- Normal operation
				END IF;

         WHEN S1 =>		-- NS green blinking
					IF(EWRE='1' and NSRE='0') THEN
					next_state <= S6;  -- Emergency vehicle priority
				ELSE
					next_state <= S2;  -- Normal operation
				END IF;

         WHEN S2 =>		-- NS green solid
				next_state <= s3;  -- Normal progression
				
         WHEN S3 =>		-- NS green solid
				next_state <= s4;  -- Normal progression

         WHEN S4 =>		-- NS green solid
					next_state <= S5;  -- Normal progression

         WHEN S5 =>		-- NS green solid
					next_state <= S6;  -- Prepare for yellow
				
         WHEN S6 =>		-- NS yellow
				next_state <= S7;  -- Yellow duration
				
         WHEN S7 =>		-- NS yellow
				next_state <= s8;  -- Transition to EW
			
			WHEN s8 =>		-- Initial EW state
				IF(EWRE='0' and NSRE='1') THEN
					next_state <= S14;  -- Emergency vehicle priority
				ELSE
					next_state <= S9;  -- Normal operation
				END IF;
			WHEN s9 =>		-- EW green blinking
				IF(EWRE='0' and NSRE='1') THEN
					next_state <= S14;  -- Emergency vehicle priority
				ELSE
					next_state <= S10;  -- Normal operation
				END IF;
			WHEN s10 =>		-- EW green solid
				next_state <= s11;  -- Normal progression
			WHEN s11 =>		-- EW green solid
				next_state <= s12;  -- Normal progression
			WHEN s12 =>		-- EW green solid
				next_state <= s13;  -- Normal progression
			WHEN s13 =>		-- EW green solid
				next_state <= s14;  -- Prepare for yellow
			WHEN s14 =>		-- EW yellow
				next_state <= s15;  -- Yellow duration
			WHEN s15 =>		-- All red state
			IF(enable='1') THEN
					next_state <= s15;  -- Stay in emergency mode
				ELSE
					next_state <= S0;  -- Return to normal operation
				END IF;
	  END CASE;
 END PROCESS;

 -------------------------------------------------------------------------------
 -- Combinational Logic Section
 -- Decoder Process: Generates all output signals based on current state and inputs
 -- Uses blink_sig input for blinking light control
 -- All outputs are generated in this section
 -------------------------------------------------------------------------------
Decoder_Section: PROCESS (blink_sig, current_state) 
BEGIN
		-- Initialize register clear signals
		NSREGISTER_CLEAR <= '0';
		EWREGISTER_CLEAR <= '0';
		
     CASE current_state IS
	  
         WHEN S0 =>		-- NS green blinking, EW red
				green  <= blink_sig;  -- Blinking green for NS
				yellow <= '0';
				red <= '0'; 
				
				greenEW  <= '0';
				yellowEW <= '0';
				redEW <= '1';  -- Solid red for EW
				NS_CROS <= '0';
				EW_CROS <= '0'; 
				
				stateout <= "0000";
			
         WHEN S1 =>		-- NS green blinking, EW red
				green  <= blink_sig;  -- Blinking green for NS
				yellow <= '0';
				red <= '0'; 
				
				greenEW  <= '0';
				yellowEW <= '0';
				redEW <= '1';  -- Solid red for EW
				NS_CROS <= '0';
				EW_CROS <= '0'; 
				
				stateout <= "0001";

         WHEN S2 =>		-- NS green solid, EW red, NS crossing enabled
				green  <= '1';  -- Solid green for NS
				yellow <= '0';
				red <= '0'; 
				
				greenEW  <= '0';
				yellowEW <= '0';
				redEW <= '1';  -- Solid red for EW
				NS_CROS <= '1';  -- Enable NS pedestrian crossing
				EW_CROS <= '0'; 
				
				stateout <= "0010";
				
			
         WHEN S3 =>		-- NS green solid, EW red
				green  <= '1';
				yellow <= '0';
				red <= '0'; 
				
				greenEW  <= '0';
				yellowEW <= '0';
				redEW <= '1'; 
				NS_CROS <= '1';
				EW_CROS <= '0'; 
				
				stateout <= "0011";

         WHEN S4 =>		-- NS green solid, EW red
				green  <= '1';
				yellow <= '0';
				red <= '0'; 
				
				greenEW  <= '0';
				yellowEW <= '0';
				redEW <= '1'; 
				NS_CROS <= '1';
				EW_CROS <= '0'; 
				
				stateout <= "0100";

         WHEN S5 =>		-- NS green solid, EW red
				green  <= '1';
				yellow <= '0';
				red <= '0'; 
				
				greenEW  <= '0';
				yellowEW <= '0';
				redEW <= '1'; 
				NS_CROS <= '1';
				EW_CROS <= '0'; 
				
				stateout <= "0101";
				
				
         WHEN S6 =>		-- NS yellow, EW red
				green  <= '0';
				yellow <= '1';  -- Yellow for NS
				red <= '0'; 
				
				greenEW  <= '0';
				yellowEW <= '0';
				redEW <= '1'; 
				NS_CROS <= '0';
				EW_CROS <= '0'; 
				
				stateout <= "0110";
				NSREGISTER_CLEAR <= '1';  -- Clear NS request register
				EWREGISTER_CLEAR <= '0';

				
				
         WHEN S7 =>		-- NS yellow, EW red				
				green  <= '0';
				yellow <= '1';
				red <= '0'; 
				
				greenEW  <= '0';
				yellowEW <= '0';
				redEW <= '1'; 
				NS_CROS <= '0';
				EW_CROS <= '0'; 
				
				stateout <= "0111";
				
			WHEN S8 =>		-- NS red, EW green blinking
				green  <= '0';
				yellow <= '0';
				red <= '1'; 
				
				greenEW  <= blink_sig;  -- Blinking green for EW
				yellowEW <= '0';
				redEW <= '0'; 
				NS_CROS <= '0';
				EW_CROS <= '0'; 
				
				stateout <= "1000";
				
			WHEN S9 =>		-- NS red, EW green blinking
				green  <= '0';
				yellow <= '0';
				red <= '1'; 
				
				greenEW  <= blink_sig;  -- Blinking green for EW
				yellowEW <= '0';
				redEW <= '0'; 
				NS_CROS <= '0';
				EW_CROS <= '0'; 
				
				stateout <= "1001";
				
			WHEN S10 =>		-- NS red, EW green solid
				green  <= '0';
				yellow <= '0';
				red <= '1'; 
				
				greenEW  <= '1';  -- Solid green for EW
				yellowEW <= '0';
				redEW <= '0'; 
				NS_CROS <= '0';
				EW_CROS <= '1';  -- Enable EW pedestrian crossing
				
				stateout <= "1010";

				
			WHEN S11 =>		-- NS red, EW green solid
				green  <= '0';
				yellow <= '0';
				red <= '1'; 
				
				greenEW  <= '1';
				yellowEW <= '0';
				redEW <= '0'; 
				NS_CROS <= '0';
				EW_CROS <= '1'; 
				
				stateout <= "1011";
				
			WHEN S12 =>		-- NS red, EW green solid
				green  <= '0';
				yellow <= '0';
				red <= '1'; 
				
				greenEW  <= '1';
				yellowEW <= '0';
				redEW <= '0'; 
				NS_CROS <= '0';
				EW_CROS <= '1'; 
				
				stateout <= "1100";
				
			WHEN S13 =>		-- NS red, EW green solid
				green  <= '0';
				yellow <= '0';
				red <= '1'; 
				
				greenEW  <= '1';
				yellowEW <= '0';
				redEW <= '0'; 
				NS_CROS <= '0';
				EW_CROS <= '1'; 
				
				stateout <= "1101";
				
			WHEN S14 =>		-- NS red, EW yellow
				green  <= '0';
				yellow <= '0';
				red <= '1'; 
				
				greenEW  <= '0';
				yellowEW <= '1';  -- Yellow for EW
				redEW <= '0'; 
				NS_CROS <= '0';
				EW_CROS <= '0'; 
				NSREGISTER_CLEAR <= '0';
				EWREGISTER_CLEAR <= '1';  -- Clear EW request register
				
				stateout <= "1110";
				
			WHEN S15 =>		-- All red state (emergency mode)
				green  <= '0';
				yellow <= '0';
				red <= '1'; 
				
				greenEW  <= '0';
				yellowEW <= '1';
				redEW <= '0'; 
				NS_CROS <= '0';
				EW_CROS <= '0'; 
				
				stateout <= "1111";

				
         WHEN others =>		-- Default state (safety mode)
				green  <= '0';
				yellow <= '0';
				red <= '0'; 
				
				greenEW  <= '0';
				yellowEW <= '0';
				redEW <= '0'; 
				NS_CROS <= '0';
				EW_CROS <= '0'; 
				
				NSREGISTER_CLEAR <= '0';
				EWREGISTER_CLEAR <= '0';
	  END CASE;
 END PROCESS;

 END ARCHITECTURE SM;
