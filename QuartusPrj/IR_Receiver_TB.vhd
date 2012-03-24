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
		  errorBit  : out std_logic;
		  testBit   : out integer
	 );
	end component;
  
  signal data: std_logic;
  signal enable: std_logic;
  signal error: std_logic;
  signal clk: std_logic;
  signal reset: std_logic;
  signal cmd: std_logic_vector(11 downto 0);
  signal errorBit: std_logic;
  signal testBit : integer;

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
                                errorBit => errorBit,
                                testBit => testBit);

stimulus: process
begin
  reset <= '1';
  wait for clock_period;
  
  reset <= '0';
  wait for clock_period;
  
  -- data 1
  error <= '0';
  data <= '1';
  enable <= '1';
  wait for clock_period*2;
  
  enable <= '0';
  wait for clock_period;

  -- data 2  
  enable <= '1';
  data <= '0';
  wait for clock_period;
  
  enable <= '0';
  wait for clock_period;

  -- data 3  
  enable <= '1';
  data <= '1';
  wait for clock_period;
  
  enable <= '0';
  wait for clock_period;
  
  -- data 4
  enable <= '1';
  data <= '0';
  wait for clock_period;
  
  enable <= '0';
  wait for clock_period;
  
  -- data 5
  enable <= '1';
  data <= '1';
  wait for clock_period;
  
  enable <= '0';
  wait for clock_period;
  
  -- data 6
  enable <= '1';
  data <= '0';
  wait for clock_period;

  enable <= '0';
  wait for clock_period;
  
  -- data 7
  enable <= '1';
  data <= '1';
  wait for clock_period;
  
  enable <= '0';
  wait for clock_period;
  
  -- data 8
  enable <= '1';
  data <= '0';
  wait for clock_period;
  
  enable <= '0';
  wait for clock_period;
  
  -- data 9
  enable <= '1';
  data <= '0';
  wait for clock_period;
  
  enable <= '0';
  wait for clock_period;
  
  -- data 10
  enable <= '1';
  data <= '0';
  wait for clock_period;
  
  enable <= '0';
  wait for clock_period;
  
  -- data 11
  enable <= '1';
  data <= '0';
  wait for clock_period;
  
  enable <= '0';
  wait for clock_period;
  
  -- data 12
  enable <= '1';
  data <= '1';
  wait for clock_period;
  
  enable <= '0';
  wait for clock_period*3;
  
  -- data 13
  enable <= '1';
  data <= '0';
  wait for clock_period;
  
  enable <= '0';
  
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