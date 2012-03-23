library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BitSampler is
	port (
		dataIn 	: in std_logic;
		enable	 : in std_logic;
		clk     : in std_logic;
		dataOut	: out std_logic;
		readbit	: out std_logic;
		error		 : out std_logic
		
	);
end entity BitSampler;


architecture BitSamplerArc of BitSampler is
-- States able for Bitsampler COM.
type state_type is (idle, firstBitRecived, secondBitRecived, validateData ,sendValidData, sendErrorData, waitForEnable);
type state_type_send is (idle , sendData);
signal state: state_type;
signal state_sendReadbit : state_type_send;
signal sendReadbit : integer := 0;
begin
-- process on enable
bitsampler_proc : process (clk)
variable firstbit, secondbit : std_logic;
variable samplebit : std_logic_vector (1 downto 0);
begin
  if rising_edge(clk) then 
		case state is
			when idle => -- W8 for the enable bit, which signals bitsample will get first data
				if enable = '1' then
					state <= firstBitRecived;
				end if;
			when firstBitRecived => -- 
				firstbit := dataIn;
				state <= waitForEnable;
			when waitForEnable =>
			  if enable = '0' then
			    state <= secondBitRecived;
			  end if;
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
					sendReadbit <= 1;
					state <= idle;
				else
					dataOut <= '0';
					sendReadbit <= 1;
					state <= idle;
				end if;
			when sendErrorData =>
				readbit <= '1';
				error <= '1';
				dataOut <= '1';
				sendReadbit <= 1;
				state <= idle;
			end case;
end if;
end process;

BitsamplerSendReadbit : process(clk)
constant readbitOpen : integer := 3;
variable readbitCounter : integer; 
begin
if rising_edge(clk) then
  case state_sendReadbit is
  when idle =>
    if sendReadbit = 1 then
      state_sendReadbit <= sendData;
    end if;
    -- Shouldnt do anything here beside waiting.
  when sendData =>
    if readbitOpen = readbitCounter then
      readbit <= '0';
      readbitCounter := 0;
      state_sendReadbit <= idle;
    else 
      readbitCounter := readbitCounter + 1;
    end if;
  end case;
  
end if;
end process; 
	
end architecture BitSamplerArc;