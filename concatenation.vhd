-- Concatenation Module for Traffic Light Display
-- This module combines traffic light signals into a format suitable for display
-- It handles both normal operation and offline mode
-------------------------------------------------------------------------------

-- Session 202, Team number 7, Bill Lu, Ailu Lin
library ieee;
use ieee.std_logic_1164.all;

entity concatenation is port (
    -- Clock input for synchronization
    clk                                                 : in std_logic;
    -- Current state of the traffic light system
    stateout                                           : in std_logic_vector(3 downto 0);
    -- Control signals
    offline, green, yellow, red                        : in std_logic;
    -- East-West traffic light signals
    greenEW, yellowEW, redEW, blink_sig               : in std_logic;
    
    -- Output signals for display (7-segment format)
    light, lightEW                                     : out std_logic_vector(6 downto 0)
);
end concatenation;

architecture circuit of concatenation is
    -- Internal signals for light pattern storage
    signal l1, l2: std_logic_vector(6 downto 0);
---
BEGIN
    -- Process to combine traffic light signals
    PROCESS(clk)
    BEGIN
        -- Check for offline mode and specific state
        IF (offline = '1' and stateout="1111") THEN
            -- Offline mode pattern
            -- Format: [blink_sig][00][greenEW][00][redEW]
            l1 <= blink_sig & "00" & greenEW & "00" & redEW;
            -- Format: [yellow][00][green][00][blink_sig]
            l2 <= yellow & "00" & green & "00" & blink_sig;
        ELSE 
            -- Normal operation pattern
            -- Format: [yellowEW][00][greenEW][00][redEW]
            l1 <= yellowEW & "00" & greenEW & "00" & redEW;
            -- Format: [yellow][00][green][00][red]
            l2 <= yellow & "00" & green & "00" & red;
        END IF;
    END PROCESS;

    -- Assign internal signals to outputs
    lightEW <= l1;
    light <= l2;

end;