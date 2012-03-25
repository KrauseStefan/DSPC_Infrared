
library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity BitSampler_tb is
end;

architecture bench of BitSampler_tb is

  component BitSampler
  	port(
  		clk     : in  std_logic;
  		reset_n : in  std_logic;
  		data    : out std_logic;
  		valid   : out std_logic;
  		IR_RX   : in  std_logic);
  end component;

  signal clk: std_logic;
  signal reset_n: std_logic;
  signal data: std_logic;
  signal valid: std_logic;
  signal IR_RX: std_logic;

begin

  uut: BitSampler port map ( clk     => clk,
                             reset_n => reset_n,
                             data    => data,
                             valid   => valid,
                             IR_RX   => IR_RX );

  stimulus: process
  begin
  
    -- Put initialisation code here


    -- Put test bench stimulus code here

    wait;
  end process;


end;