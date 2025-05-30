-- Push Button Inverter Module
-- This module inverts the active-low push button signals to active-high
-- It also inverts the active-low reset signal
-------------------------------------------------------------------------------

-- Session 202, Team number 7, Bill Lu, Ailu Lin
library ieee;
use ieee.std_logic_1164.all;

entity PB_inverters is port (
	-- Active-low reset input
	rst_n				: in	std_logic;
	-- Active-high reset output
	rst				: out std_logic;
	-- Active-low filtered push button inputs
	pb_n_filtered	: in  std_logic_vector (3 downto 0);
	-- Active-high push button outputs
	pb					: out	std_logic_vector(3 downto 0)							 
	); 
end PB_inverters;

architecture ckt of PB_inverters is

begin
	-- Invert reset signal from active-low to active-high
	rst <= NOT(rst_n);
	-- Invert push button signals from active-low to active-high
	pb <= NOT(pb_n_filtered);


end ckt;