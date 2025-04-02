-- Synchronizer Module
-- This module implements a two-stage synchronizer to handle asynchronous input signals
-- It helps prevent metastability issues when sampling asynchronous signals
-------------------------------------------------------------------------------

-- Session 202, Team number 7, Bill Lu, Ailu Lin
library ieee;
use ieee.std_logic_1164.all;

entity synchronizer is port (
    -- Clock input for synchronization
    clk             : in std_logic;
    -- Reset signal (active high)
    reset           : in std_logic;
    -- Asynchronous input signal
    din             : in std_logic;
    -- Synchronized output signal
    dout            : out std_logic
);
end synchronizer;

architecture circuit of synchronizer is
    -- Two-stage shift register for synchronization
    Signal sreg     : std_logic_vector(1 downto 0);

BEGIN
    -- Process to handle synchronization
    process(clk) IS
    begin 
        -- Check for rising edge of clock
        if (rising_edge(clk)) then
            -- First stage: Sample input with reset handling
            sreg(0) <= (not reset AND din);
            -- Second stage: Sample first stage with reset handling
            sreg(1) <= (not reset AND sreg(0));
        end if;
    end process;

    -- Output is the synchronized signal from second stage
    dout <= sreg(1);

end;