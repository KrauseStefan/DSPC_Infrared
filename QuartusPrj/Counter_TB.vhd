library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity Counter_tb is
end;

architecture bench of Counter_tb is

  component Counter
  	port(
  		clk   : in  std_logic;
  		IR_RX : in  std_logic;
  		sr_in : in std_logic;
  		shift : in std_logic;
  		data  : out std_logic := '0';
  		valid : out std_logic := '0'
  	);
  end component;

  signal clk: std_logic;
  signal IR_RX: std_logic;
  signal sr_in: std_logic;
  signal shift: std_logic;
  signal data: std_logic := '0';
  signal valid: std_logic := '0' ;

  constant clock_period: time := 500 ps;
  constant IrClock_period: time := 27 us;
  signal stop_the_clock: boolean;

begin

  uut: Counter port map ( clk   => clk,
                          IR_RX => IR_RX,
                          sr_in => sr_in,
                          shift => shift,
                          data  => data,
                          valid => valid );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    stop_the_clock <= false;
    wait;
  end process;

  IRclocking: process
  begin
    while not stop_the_clock loop
      IR_RX <= '0', '1' after IrClock_period / 2;
      wait for IrClock_period;
    end loop;
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

end;
  

--Configuration Declaration

-- Test bench configuration created online at:
--    www.doulos.com/knowhow/perl/testbench_creation/
-- Copyright Doulos Ltd
-- SD, 03 November 2002

--configuration cfg_Counter_tb of Counter_tb is
--  for bench
--    for uut: Counter
--      -- Default configuration
--    end for;
--  end for;
--end cfg_Counter_tb;
--
--configuration cfg_Counter_tb_Counter_Arc of Counter_tb is
--  for bench
--    for uut: Counter
--      use entity work.Counter(Counter_Arc);
--    end for;
--  end for;
--end cfg_Counter_tb_Counter_Arc;