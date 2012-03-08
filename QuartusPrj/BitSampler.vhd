library ieee;
use ieee.std_logic_1164.all;


entity BitSampler is
	port (
		dataIn 	: in std_logic;
		enable	: in std_logic;
		dataOut	: out std_logic;
		readbit	: out std_logic;
		error		: out std_logic
		
	);
end entity BitSampler;


architecture BitSamplerArc of BitSampler is

type state_type is (idle, firstBitRecived, secondBitRecived, validateData ,sendValidData, sendErrorData);

signal state: state_type;
begin
-- process on enable
bitsampler_proc : process (enable)
variable firstbit, secondbit : std_logic;
variable samplebit : std_logic_vector (1 downto 0);
begin
		case state is
			when idle =>
				if enable = '1' then
					state <= firstBitRecived;
				end if;
			when firstBitRecived =>
				firstbit := dataIn;
				state <= secondBitRecived;
			when secondBitRecived =>
				if enable = '1' then
					secondbit := dataIn;
					state <= validateData;
				end if;
			when validateData =>
				-- Skal firstbit og secondbit omskrives ?
				samplebit(1) := firstbit;
				samplebit(0) := secondbit;
				if(samplebit = "01" or samplebit = "10" ) then
					state <=  sendValidData;
				else 
					state <= sendErrorData;
				end if;
			when sendValidData =>
				readbit <= '1';
				error <= '0';
				if(samplebit = "01") then
					dataOut <= '1';
					state <= idle;
				else
					dataOut <= '0';
					state <= idle;
				end if;
			when sendErrorData =>
				readbit <= '1';
				error <= '0';
				dataOut <= '1';
				state <= idle;
			end case;

end process;
	
end architecture BitSamplerArc;