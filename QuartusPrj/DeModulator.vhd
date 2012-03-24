library ieee;
use ieee.std_logic_1164.all;

entity DeModulator is
	port(
		clk      : in  std_logic;       -- 1,512 MHz not during test
		reset_n  : in  std_logic;
		data     : out std_logic := '0';
		valid    : out std_logic := '0'
	);
end entity DeModulator;

architecture DeModulator_Arc of DeModulator is
	-- clock freq: 2MHz
	-- bit time Period: 889us
	-- 1778 tics = 889us/(1/2MHz)
	constant BIT_TIME                  : integer := 1778; --us
	constant clkHoldCount              : integer := BIT_TIME / 4; -- 1/4 of a recive cycle.
	constant ACCEPTABLE_LOW_TIME_COUNT : integer := BIT_TIME * 4 / (32 * 3); -- 1/4 of a recive cycle.
	signal IR_RX, sr_in, shift, intValid : std_logic;

begin

	receive : process(clk) is
		variable bitShiftReg   : std_logic_vector(11 downto 0) := x"000";
		variable rcvCount      : integer                       := 0;
		variable rcvCountSmall : integer                       := 0;
		variable isHigh        : boolean                       := false;
		variable holdCount     : integer                       := 0;
	begin
		if rising_edge(clk) then
			bitShiftReg(11 downto 1) := bitShiftReg(10 downto 0);
			bitShiftReg(0) := IR_RX;

			if (bitShiftReg = x"FFF" and isHigh = false) then
				rcvCount  := 1 + rcvCount;
				isHigh    := true;
				holdCount := holdCount + 1;
			elsif (not (bitShiftReg = x"FFF") and isHigh = true) then
				isHigh    := false;
				holdCount := 0;
			end if;

			if (rcvCount = 32) then
				intValid  <= '1';
				rcvCount  := 0;
				holdCount := 0;
			end if;

			if (holdCount < ACCEPTABLE_LOW_TIME_COUNT) then
				data <= '1';
			else
				data      <= '0';
				holdCount := ACCEPTABLE_LOW_TIME_COUNT;
			end if;

			if (holdCount < clkHoldCount) then
				holdCount := holdCount + 1;
				if (holdCount = clkHoldCount) then
					intValid <= '0';
				end if;
			end if;

		end if;
	end process receive;

end architecture DeModulator_Arc;

architecture TestDeModulator of DeModulator is
  
constant bitperiod : time := 10 ns;
  
begin
genIrData : process
constant testData : std_logic_vector(23 downto 0) := "011010010110100101101001"; -- last bit must be 1 to stop the clk
variable bitCount : integer;
begin
  bitCount := 22;
  valid <= 0;
  wait until reset_n = '0';
  wait until clk = '1';
  
  for bitCount in 22 downto 0 loop
    data <= testData(bitCount);
    valid <= '1';
    wait for bitperiod*3;
    wait until clk = '1';
  
    valid <= '0';
    wait for bitperiod;
    wait until clk = '1';
  end loop;
  
  wait;
  
end process;
  
end architecture TestDeModulator;


