library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BitSampler is
	port(
		clk     : in  std_logic;
		reset   : in  std_logic;
		dataOut : out std_logic := '0';
		readbit : out std_logic := '0';
		error   : out std_logic := '0';
		first   : out std_logic;
		second  : out std_logic;

		-- Forwared signals
		IR_RX   : in  std_logic
	);
end entity BitSampler;

architecture BitSamplerArc of BitSampler is
	-- States able for Bitsampler COM.
	type state_type is (idle, firstBitRecived, secondBitRecived, validateData, sendValidData, sendErrorData, waitForEnable);
	type state_type_send is (idle, sendData);
	signal state             : state_type;
	signal state_sendReadbit : state_type_send;
	signal sendReadbit       : integer := 0;
	signal dataIn, enable    : std_logic;
begin
	-- process on enable
	bitsampler_proc : process(clk)
		variable firstbit, secondbit : std_logic;
		variable samplebit           : std_logic_vector(1 downto 0);
		constant readbitOpen         : integer := 3;
		variable readbitCounter      : integer := 0;

	begin
		if rising_edge(clk) then
			case state is
				when idle =>            -- W8 for the enable bit, which signals bitsample will get first data
					if enable = '1' then
						state <= firstBitRecived;
					end if;
				when firstBitRecived => -- 
					firstbit := dataIn;
					first <= dataIn; -- TEST
					state    <= waitForEnable;
				when waitForEnable =>
					if enable = '0' then
						state <= secondBitRecived;
					end if;
				when secondBitRecived =>
					if enable = '1' then
						secondbit := dataIn;
						second <= dataIn; -- TEST
						state     <= validateData;
					end if;
				when validateData =>
					-- Skal firstbit og secondbit omskrives ?
					samplebit(1) := firstbit;
					samplebit(0) := secondbit;
					if (samplebit = "01" or samplebit = "10") then
						state <= sendValidData;
					else
						state <= sendErrorData;
					end if;
				when sendValidData =>
					readbit <= '1';
					error   <= '0';
					if (samplebit = "01") then
						dataOut     <= '1';
						sendReadbit <= 1;
						state       <= idle;
					else
						dataOut     <= '0';
						sendReadbit <= 1;
						state       <= idle;
					end if;
				when sendErrorData =>
					readbit     <= '1';
					error       <= '1';
					dataOut     <= '1';
					sendReadbit <= 1;
					state       <= idle;
			end case;

			case state_sendReadbit is
				when idle =>
					if sendReadbit = 1 then
						state_sendReadbit <= sendData;
					end if;
				-- Shouldnt do anything here beside waiting.
				when sendData =>
					if readbitOpen = readbitCounter then
						readbit           <= '0';
						readbitCounter    := 0;
						state_sendReadbit <= idle;
					else
						readbitCounter := readbitCounter + 1;
					end if;
			end case;

		end if;
	end process;

	modulator : entity work.DeModulator(TestDeModulator) port map(
			--modulator : entity work.DeModulator(DeModulator_Arc) port map(
			clk     => clk,
			reset_n => reset,
			data    => dataIn,
			valid   => enable,
			IR_RX   => IR_RX);
end architecture BitSamplerArc;

-------------------------------------------------------------------------------
-- For test only
-------------------------------------------------------------------------------

architecture TestBitSampler of BitSampler is
	constant bitperiod : time := 10 ns;

begin
	genIrData : process
		constant testData : std_logic_vector(11 downto 0) := "100110011001"; -- last bit must be 1 to stop the clk
		variable bitCount : integer;
	begin
		bitCount := 11;
		wait until reset = '0';
		wait until clk = '1';

		for bitCount in 11 downto 0 loop
			error   <= '0';
			dataOut <= testData(bitCount);
			readbit <= '1';
			wait for bitperiod * 3;
			wait until clk = '1';

			readbit <= '0';
			wait for bitperiod;
			wait until clk = '1';
		end loop;

		wait;

	end process;

end architecture TestBitSampler;