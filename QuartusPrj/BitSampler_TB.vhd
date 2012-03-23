library IEEE;
USE IEEE.Std_logic_1164.ALL;
use IEEE.Numeric_Std.all;

entity BitSampler_TB is 
end;

architecture bench of BitSampler_TB is 

  component BitSampler
    Port(
      dataIn 	: in std_logic;
  		  enable	 : in std_logic;
  		  clk     : in std_logic;
    		dataOut	: out std_logic := '0';
    		readbit	: out std_logic := '0';
    		error		 : out std_logic := '0'
		);
end component;
  
  signal dataIn : std_logic;
  signal enable : std_logic;
  signal clk    : std_logic;
  signal dataOut: std_logic;
  signal readbit: std_logic;
  signal error  : std_logic;
  
  
  -- signal med data - skal muligvis ændres til en anden type data
  --signal dataInValue : unsigned(23 downto 0) := "0110011000";
  
  -- clk perioden skal være 
  constant clkperiode : time := 10 ns;
  
  signal stop_the_clock : boolean;
  
  begin 
    bitsampler_inst : BitSampler
    
        port map (
            dataIn  =>  dataIn,
            enable  =>  enable,
            clk     =>  clk,
            dataOut =>  dataOut,
            readbit =>  readbit,
            error   =>  error);
            
  stimulus: process 
  begin
    -- Enable High.
    enable <= '1';
    wait for clkperiode;
    
    -- Read data.
    dataIn <= '1';
    wait for clkperiode;
    
    -- Enable Low
    enable <= '0';
    wait for clkperiode;
    
    -- Enable high
    enable <= '1';
    wait for clkperiode;
    
    dataIn <= '0';
    enable <= '0';
    wait for clkperiode;
    -- Wait until every state in Bitsample have been countet for

     wait for clkperiode * 4;    
     stop_the_clock <= true;
     wait;
 end process;
clocking: process
begin
  while not stop_the_clock loop
    clk <= '0', '1' after clkperiode / 2;
    wait for clkperiode;
  end loop;
end process;     
    
  end; -- archtecture

    