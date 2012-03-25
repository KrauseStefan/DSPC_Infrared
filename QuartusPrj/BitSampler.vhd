library ieee;

use ieee.std_logic_1164.all;

entity BitSampler is
	port(
		clk     : in  std_logic;
		reset_n : in  std_logic;
		rcvDone : in  std_logic;
		data    : out std_logic := '0';
		valid   : out std_logic := '0';

		-- Forwarded signals
		IR_RX   : in  std_logic
	);
end entity BitSampler;

architecture BitSampler_RTL of BitSampler is
	type samplerStates is (idle, validHold, firstSample, sampling);
	signal samplerState : samplerStates := idle;
	signal timer1       : integer       := 0;
	signal intData      : std_logic     := '1';
	signal preIntData   : std_logic     := '1';

	-- clock freq: 2MHz
	-- bit time Period: 889us
	-- 1778 tics = 889us/(1/2MHz)
	constant SAMPLE_TIC_PERIOD      : integer := 1778;
	constant HALF_SAMPLE_TIC_PERIOD : integer := SAMPLE_TIC_PERIOD / 2;
	constant VALID_HOLD             : integer := 5; --plenty of time
begin
	deModulator_inst : entity work.DeModulator
		port map(clk     => clk,
			     reset_n => reset_n,
			     IR_RX   => IR_RX,
			     data    => intData);

	SamplerProcess : process(clk, reset_n) is
	begin
		preIntData <= intData;

		if reset_n = '1' then
			valid      <= '0';
			data       <= '0';
			preIntData <= '1';
			timer1     <= 0;
		elsif rising_edge(clk) then
			timer1 <= timer1 + 1;

			case samplerState is
				when idle =>
					--Rising edge
					if intData = '1' and preIntData = '0' then
						timer1       <= 0;
						samplerState <= firstSample;
					end if;
				when validHold =>
					if (timer1 >= VALID_HOLD) then
						valid        <= '0';
						samplerState <= sampling;
					end if;
				when firstSample =>
					if timer1 >= HALF_SAMPLE_TIC_PERIOD then
						data         <= intData;
						timer1       <= 0;
						valid        <= '1';
						samplerState <= validHold;
					end if;
				when sampling =>
					if rcvDone = '1' then
						samplerState <= idle;
					elsif timer1 >= SAMPLE_TIC_PERIOD then
						data         <= intData;
						timer1       <= 0;
						samplerState <= validHold;
					end if;
				when others => null;
			end case;

		end if;
	end process SamplerProcess;

end architecture BitSampler_RTL;

architecture TestBitSampler of BitSampler is
	constant bitperiod : time := 10 ns;

begin
	genIrData : process
		constant testData : std_logic_vector(23 downto 0) := "011010010110100101101001"; -- last bit must be 1 to stop the clk
		variable bitCount : integer;
	begin
		bitCount := 23;
		valid    <= '0';
		wait until reset_n = '0';
		wait until clk = '1';

		for bitCount in 23 downto 0 loop
			data  <= testData(bitCount);
			valid <= '1';
			wait for bitperiod * 3;
			wait until clk = '1';

			valid <= '0';
			wait for bitperiod;
			wait until clk = '1';
		end loop;

		wait;

	end process;

end architecture TestBitSampler;
