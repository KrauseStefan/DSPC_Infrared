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
		  clk       : in std_logic;
		  reset     : in std_logic;
		  cmd       : out std_logic_vector(11 downto 0);
		  errorBit  : out std_logic;
		  testBit   : out integer
	 );
	end component;

  signal clk: std_logic;
  signal reset: std_logic := '1';
  signal cmd: std_logic_vector(11 downto 0);
  signal errorBit: std_logic;
  signal testBit : integer;

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin
  
-- Component instantiation
UUT : entity work.InfraredReciver port map( clk => clk,
                                reset    => reset,
                                cmd      => cmd,
                                errorBit => errorBit,
                                testBit => testBit);

stimulus: process
begin
  wait for clock_period*2;
  
  reset <= '0';
  
  wait until cmd(0) = '1';
  wait for clock_period*3;
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