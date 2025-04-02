-- Top Level Module for Traffic Light Control System
-- This module integrates all components of the traffic light control system
-- including push button handling, clock generation, state machine, and display
-- The system controls traffic lights at an intersection with North-South and East-West directions
-------------------------------------------------------------------------------

-- Session 202, Team number 7, Bill Lu, Ailu Lin
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY LogicalStep_Lab4_top IS
   PORT (
    -- Clock and reset inputs
    clkin_50        : in std_logic;                          -- The 50 MHz FPGA Clock input
    rst_n           : in std_logic;                          -- The RESET input (ACTIVE LOW)
    
    -- User inputs
    pb_n            : in std_logic_vector(3 downto 0);      -- The push-button inputs (ACTIVE LOW)
    sw              : in std_logic_vector(7 downto 0);      -- The switch inputs
    
    -- System status outputs
    leds            : out std_logic_vector(7 downto 0);     -- LED outputs for system status
    
    -- Seven-segment display outputs
    seg7_data       : out std_logic_vector(6 downto 0);     -- 7-bit outputs to a 7-segment display
    seg7_char1      : out std_logic;                        -- Seven-segment digit 1 selector
    seg7_char2      : out std_logic                         -- Seven-segment digit 2 selector
    );
END LogicalStep_Lab4_top;

ARCHITECTURE SimpleCircuit OF LogicalStep_Lab4_top IS
    -- Component declarations
    -- Display Components
    component segment7_mux port (
        clk         : in std_logic := '0';                  -- Clock input
        DIN2        : in std_logic_vector(6 downto 0);      -- Input for second digit
        DIN1        : in std_logic_vector(6 downto 0);      -- Input for first digit
        DOUT        : out std_logic_vector(6 downto 0);     -- Multiplexed output
        DIG2        : out std_logic;                        -- Second digit select
        DIG1        : out std_logic                         -- First digit select
    );
    end component;

    component concatenation port (
        clk         : in std_logic;                        -- Clock input
        stateout    : in std_logic_vector(3 downto 0);     -- State input
        offline, green, yellow, red       : in std_logic;  -- NS light inputs
        greenEW, yellowEW, redEW, blink_sig : in std_logic;  -- EW light inputs
        light, lightEW                    : out std_logic_vector(6 downto 0)  -- Display outputs
    );
    end component;

    -- Clock and Control Components
    component clock_generator port (
        sim_mode    : in boolean;                          -- Simulation mode select
        reset       : in std_logic;                        -- Reset input
        clkin       : in std_logic;                        -- Clock input
        sm_clken    : out std_logic;                       -- State machine clock enable
        blink       : out std_logic                        -- Blink signal output
    );
    end component; 

    -- Button Handling Components
    component pb_filters port (
        clkin       : in std_logic;                        -- Clock input
        rst_n       : in std_logic;                        -- Reset input (active low)
        rst_n_filtered : out std_logic;                    -- Filtered reset output
        pb_n        : in std_logic_vector(3 downto 0);     -- Push button inputs
        pb_n_filtered : out std_logic_vector(3 downto 0)   -- Filtered push button outputs
    );
    end component;

    component pb_inverters port (
        rst_n       : in std_logic;                        -- Reset input (active low)
        rst         : out std_logic;                       -- Reset output (active high)
        pb_n_filtered : in std_logic_vector(3 downto 0);   -- Filtered push button inputs
        pb          : out std_logic_vector(3 downto 0)     -- Inverted push button outputs
    );
    end component;
    
    -- Synchronization Components
    component synchronizer port (
        clk         : in std_logic;                        -- Clock input
        reset       : in std_logic;                        -- Reset input
        din         : in std_logic;                        -- Data input
        dout        : out std_logic                        -- Synchronized output
    );
    end component; 

    component holding_register port (
        clk         : in std_logic;                        -- Clock input
        reset       : in std_logic;                        -- Reset input
        register_clr : in std_logic;                       -- Register clear input
        din         : in std_logic;                        -- Data input
        dout        : out std_logic                        -- Register output
    );
    end component;            
    
    -- Traffic Control Component
    component State_Machine port (
        clk                             : in std_logic;  -- Clock input
        clk_enable, reset, blink_sig, enable : IN std_logic;  -- Control inputs
        NSRE, EWRE                         : IN std_logic;    -- Request inputs
        green, yellow, red                 : OUT std_logic;   -- NS light outputs
        greenEW, yellowEW, redEW          : OUT std_logic;   -- EW light outputs
        NS_CROS, EW_CROS, NSREGISTER_CLEAR, EWREGISTER_CLEAR : OUT std_logic;  -- Control outputs
        stateout                          : OUT std_logic_vector(3 downto 0)     -- State output
    );
    end component;    

    -- Signal declarations
    -- Reset and Clock Signals
    SIGNAL rst, rst_n_filtered, synch_rst : std_logic;     -- Reset signals
    SIGNAL sm_clken, blink_sig           : std_logic;      -- Clock and blink signals
	 CONSTANT	sim_mode								: boolean := false;  -- set to FALSE for LogicalStep board downloads
    
    -- Button Signals
    SIGNAL pb_n_filtered, pb             : std_logic_vector(3 downto 0);  -- Button signals
    SIGNAL sync_OUT                      : std_logic_vector(1 downto 0);   -- Sync outputs
    
    -- Traffic Control Signals
    Signal green, yellow, red            : std_logic;      -- NS light signals
    SIGNAL greenEW, yellowEW, redEW      : std_logic;      -- EW light signals
    SIGNAL NS_CROS, EW_CROS, NSREGISTER_CLEAR, EWREGISTER_CLEAR : std_logic;  -- Control signals
    SIGNAL stateout                      : std_logic_vector(3 downto 0);       -- State signal
    signal NSRE, EWRE                    : std_logic;      -- Request signals
    
    -- Display Signals
    SIGNAL LightEW, Light                : std_logic_vector(6 downto 0);  -- Display patterns
    signal offline                       : std_logic;      -- Offline mode signal
    
BEGIN
    -- LED Output Assignments
    leds(7 downto 4) <= stateout(3 downto 0);  -- Current state display
    leds(0) <= NS_CROS;                        -- North-South crossing indicator
    leds(2) <= EW_CROS;                        -- East-West crossing indicator
    leds(1) <= NSRE;                           -- North-South request indicator
    leds(3) <= EWRE;                           -- East-West request indicator

    -- Component Instantiations
    -- Button Processing Chain
    INST0: pb_filters port map (clkin_50, rst_n, rst_n_filtered, pb_n, pb_n_filtered);  -- Button debouncing
    INST1: pb_inverters port map (rst_n_filtered, rst, pb_n_filtered, pb);              -- Button signal inversion

    -- System Reset and Clock Generation
    INST2: synchronizer port map (clkin_50, synch_rst, rst, synch_rst);                 -- Reset synchronization
    INST3: clock_generator port map (sim_mode, synch_rst, clkin_50, sm_clken, blink_sig);  -- Clock generation

    -- East-West Request Processing Chain
    INST4: synchronizer port map (clkin_50, synch_rst, pb(1), sync_OUT(1));              -- EW request sync
    INST5: holding_register port map (clkin_50, synch_rst, EWREGISTER_CLEAR, sync_OUT(1), EWRE);  -- EW request storage

    -- North-South Request Processing Chain
    INST6: synchronizer port map (clkin_50, synch_rst, pb(0), sync_OUT(0));              -- NS request sync
    INST7: holding_register port map (clkin_50, synch_rst, NSREGISTER_CLEAR, sync_OUT(0), NSRE);  -- NS request storage

    -- Traffic Control System
    INST8: State_Machine port map (clkin_50, sm_clken, synch_rst, blink_sig, sw(0), NSRE, EWRE, 
                                  green, yellow, red, greenEW, yellowEW, redEW, 
                                  NS_CROS, EW_CROS, NSREGISTER_CLEAR, EWREGISTER_CLEAR, 
                                  stateout);  -- Traffic light control
    
    -- Display System
    INST9: segment7_mux port map (clkin_50, LightEW, Light, seg7_data(6 downto 0), seg7_char1, seg7_char2);
    INST10: synchronizer port map (clkin_50, synch_rst, sw(0), offline);                 -- Offline mode sync
    INST11: concatenation port map (clkin_50, stateout(3 downto 0), offline, 
                                  green, yellow, red, greenEW, yellowEW, redEW, 
                                  blink_sig, light, lightEW); -- Display formatting   

--
END SimpleCircuit;
