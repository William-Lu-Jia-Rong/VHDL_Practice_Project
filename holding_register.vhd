-- Holding Register Module
-- This module implements a single-bit holding register with reset and clear functionality
-- It maintains its state until explicitly cleared or reset
-------------------------------------------------------------------------------

-- Session 202, Team number 7, Bill Lu, Ailu Lin
library ieee;
use ieee.std_logic_1164.all;

entity holding_register is port (
    -- Clock input for synchronization
    clk                     : in std_logic;
    -- Reset signal (active high)
    reset                   : in std_logic;
    -- Register clear signal (active high)
    register_clr            : in std_logic;
    -- Data input
    din                     : in std_logic;
    -- Data output
    dout                    : out std_logic
);
end holding_register;

architecture circuit of holding_register is
    -- Internal register signal
    Signal sreg             : std_logic;

BEGIN
    -- Process to handle register operations
    PROCESS(clk)
    BEGIN
        -- Check for rising edge of clock
        IF (rising_edge(clk)) THEN
            -- Reset takes highest priority
            IF (reset = '1') THEN
                sreg <= '0';  -- Clear register on reset
            ELSE 
                -- Update register value based on input and control signals
                -- Logic: (current_value OR input) AND NOT (clear OR reset)
                -- This ensures the register maintains its state until cleared
                sreg <= ((sreg OR din) AND NOT (register_clr OR reset));
            END IF;
        END IF;
    END PROCESS;

    -- Connect internal register to output
    dout <= sreg;

end;