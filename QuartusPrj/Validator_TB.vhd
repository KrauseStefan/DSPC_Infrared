library IEEE;
USE IEEE.Std_logic_1164.ALL;
use IEEE.Numeric_Std.all;

entity Validator_TB is 
end;

architecture bench of Validator_TB is 

  component Validator
    Port(
  		  clk     : in std_logic;
  		  reset   : in std_logic;
    		dataOut	: out std_logic;
    		readbit	: out std_logic;
    		error		 : out std_logic;
    		first   : out std_logic;
		  second  : out std_logic;
    		IR_RX   : in std_logic 
		);
end component;
  
  signal dataIn : std_logic;
  signal enable : std_logic;
  signal clk    : std_logic;
  signal dataOut: std_logic;
  signal readbit: std_logic;
  signal error  : std_logic;
  signal reset  : std_logic;
  signal IR_RX  : std_logic;
  signal first, second : std_logic := '0';
  
  
  -- signal med data - skal muligvis �ndres til en anden type data
  --signal dataInValue : unsigned(23 downto 0) := "0110011000";
  
  -- clk perioden skal v�re 
  constant clkperiode : time := 10 ns;
  
  signal stop_the_clock : boolean;
  
  begin 
    Validator_inst : entity work.Validator(ValidatorArc)
    
        port map (
            clk     =>  clk,
            reset   =>  reset,
            dataOut =>  dataOut,
            readbit =>  readbit,
            error   =>  error,
            second => second,
            first => first,
            IR_RX   =>  IR_RX
            );
            
  stimulus: process 
  begin
    -- Enable High.
--    wait for clkperiode;
--    enable <= '0';
--    wait for clkperiode;
    
--    enable <= '1';
--    wait for clkperiode;
    
    -- Read data.
--    dataIn <= '0';
--    wait for clkperiode;
    
    -- Enable Low
--    enable <= '0';
--    wait for clkperiode;
    
    -- Enable high
--    enable <= '1';
--    dataIn <= '1';
--    wait for clkperiode;
    
--    dataIn <= '0';
--    enable <= '0';
--    wait for clkperiode;
    -- Wait until every state in Bitsample have been countet for
    
    reset <= '1';
    wait for clkperiode*3;
    
    reset <= '0';

     wait for clkperiode * 100;    
     stop_the_clock <= true;
     wait;
 end process;
clocking: process
begin
  while not stop_the_clock loop
    clk <= '0', '1' after clkperiode / 2;
    wait for clkperiode;
  end loop;
  wait;
end process;     
    
  end; -- archtecture

    