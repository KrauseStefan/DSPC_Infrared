library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

-------------------------------------------------------------------------------

entity IR_Receiver_TB is
  
end IR_Receiver_TB;

-------------------------------------------------------------------------------

architecture test of IR_Receiver_TB is

  component InfraredReciver
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
  
-- Component instantiation
UUT : InfraredReciver port map( clk      => clk,
                                reset    => reset,
                                data     => data,
                                enable   => enable,
                                error    => error,
                                cmd      => cmd,
                                errorBit => errorBit);

stimulus: process
begin

  data <= '1';
  enable <= '1';
  wait for clock_period;
  
  data <= '0';
  wait for clock_period;
  
  data <= '1';
  wait for clock_period;
  
  data <= '0';
  wait for clock_period;
  
  data <= '1';
  wait for clock_period;
  
  data <= '0';
  wait for clock_period;
  
  data <= '1';
  wait for clock_period;
  
  data <= '0';
  wait for clock_period;
  
  data <= '1';
  wait for clock_period * 4;

  stop_the_clock <= true;
  wait;
end process;

clocking: process
begin
  while not stop_the_clock loop
    clk <= '0', '1' after clock_period / 2;
    wait for clock_period;
  end loop;
  wait;
end process;
  
end test;