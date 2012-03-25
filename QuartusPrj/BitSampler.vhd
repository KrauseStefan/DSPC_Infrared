library ieee;

use ieee.std_logic_1164.all;

entity BitSampler is
	port(
		clk     : in  std_logic;
		reset_n : in  std_logic;
		data    : out std_logic;
		valid   : out std_logic;
		IR_RX   : in  std_logic);
end entity BitSampler;


architecture BitSampler_RTL of BitSampler is
	
begin
	
end architecture BitSampler_RTL;