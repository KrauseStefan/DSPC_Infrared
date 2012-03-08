library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

-------------------------------------------------------------------------------

entity IF_Receiver_TB is
  
end IF_Receiver_TB;

-------------------------------------------------------------------------------

architecture test of IF_Receiver_TB is

  component IF_Receiver
    port(
      data      : in std_logic;
		  enable    :	in std_logic;
		  error     : in std_logic;
		  clk       : in std_logic;
		  reset     : in std_logic;
		  cmd       : out std_logic_vector(11 downto 0);
		  errorBit  : out std_logic
	 );
	end component;
  
  signal data: std_logic;
  signal enable: std_logic;
  signal error: std_logic;
  signal clk: std_logic;
  signal reset: std_logic;
  signal cmd: std_logic_vector(11 downto 0);
  signal errorBit: std_logic;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  
end test;