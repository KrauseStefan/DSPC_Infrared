library ieee;

use ieee.std_logic_1164.all;

entity BitSampler is
	port(
		clk       : in  std_logic;
		reset_n   : in  std_logic;
		rcvDone   : in  std_logic;
		data      : out std_logic                    := '0';
		valid     : out std_logic                    := '0';

		-- Forwarded signals
		IR_RX     : in  std_logic;
		debugPins : out std_logic_vector(7 downto 0) := X"00"
	);
end entity BitSampler;

architecture BitSampler_RTL of BitSampler is
	signal internalClock : std_logic := '0';

	type samplerStates is (idle, validHold, firstSample, sampling);
	signal samplerState : samplerStates := idle;
	signal timer1       : integer       := 0;
	signal intData      : std_logic     := '1';
	signal preIntData   : std_logic     := '1';

	-- clock freq: 2MHz
	-- bit time Period: 889us
	-- 1778 tics = 889us/(1/2MHz)
	constant SAMPLE_TIC_PERIOD      : integer := 356;
	constant HALF_SAMPLE_TIC_PERIOD : integer := SAMPLE_TIC_PERIOD / 2;
	constant VALID_HOLD             : integer := 5; --plenty of time


	signal internalDebug : std_logic_vector(7 downto 0);
begin
	deModulator_inst : entity work.DeModulator
		port map(clk       => internalClock,
			     reset_n   => reset_n,
			     IR_RX     => IR_RX,
			     data      => intData,
			     debugPins => internalDebug
		);

	debugPins(4 downto 0) <= internalDebug(4 downto 0);
	--	debugPins (7 downto 7) <= internalDebug (4 downto 0);
	debugPins(7) <= '0';

	clkScaler : process(clk, reset_n) is
		variable counter       : integer := 0;
		constant COUNT_TO      : integer := 125;
		constant COUNT_TO_HALF : integer := 62;
	begin
		if reset_n = '0' then
		elsif rising_edge(clk) then
			if (counter >= COUNT_TO) then
				counter       := 0;
				internalClock <= '1';
			elsif (counter >= COUNT_TO_HALF) then
				internalClock <= '0';
				counter       := counter + 1;
			else
				internalClock <= '1';
				counter       := counter + 1;
			end if;
		end if;
	end process clkScaler;

	SamplerProcess : process(internalClock, reset_n) is
	begin
		if reset_n = '0' then
			valid      <= '0';
			data       <= '0';
			preIntData <= '1';
			timer1     <= 0;
		elsif rising_edge(internalClock) then
			preIntData <= intData;
			timer1     <= timer1 + 1;

			case samplerState is
				when idle =>
					--debugPins(6) <= '0';
					debugPins(5) <= '1';
					--Rising edge
					if intData = '1' and preIntData = '0' then
						--	debugPins(5) <= '0';
						timer1       <= 0;
						samplerState <= firstSample;
					end if;
				when validHold =>
					if (timer1 >= VALID_HOLD) then
						valid        <= '0';
						samplerState <= sampling;
					end if;
				when firstSample => --first bit is start and should not be sampled.
					debugPins(6) <= '1';
					if timer1 >= HALF_SAMPLE_TIC_PERIOD then
--						data         <= intData;
						timer1       <= 0;
--						valid        <= '1';
						samplerState <= validHold;
					end if;
				when sampling =>
					debugPins(6) <= '1';
					if rcvDone = '1' then
						samplerState <= idle;
					elsif timer1 >= SAMPLE_TIC_PERIOD then
						data         <= intData;
						timer1       <= 0;
						valid        <= '1';
						samplerState <= validHold;
					end if;
				when others => null;
			end case;

		end if;
	end process SamplerProcess;

end architecture BitSampler_RTL;

--architecture TestBitSampler of BitSampler is
--	constant bitperiod : time := 10 ns;
--
--begin
--	genIrData : process
--		constant testData : std_logic_vector(23 downto 0) := "011010010110100101101001"; -- last bit must be 1 to stop the clk
--		variable bitCount : integer;
--	begin
--		bitCount := 23;
--		valid    <= '0';
--		wait until reset_n = '0';
--		wait until clk = '1';
--
--		for bitCount in 23 downto 0 loop
--			data  <= testData(bitCount);
--			valid <= '1';
--			wait for bitperiod * 3;
--			wait until clk = '1';
--
--			valid <= '0';
--			wait for bitperiod;
--			wait until clk = '1';
--		end loop;
--
--		wait;
--
--	end process;
--
--end architecture TestBitSampler;
