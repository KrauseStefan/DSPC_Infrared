library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;


entity InfraredReciver is
	port (
		data : 	in std_logic;
		enable :	in std_logic;
		error : 	in std_logic;
		clk : 	in std_logic;
		reset : 	in std_logic;
		cmd : 	out std_logic_vector(11 downto 0);
		errorBit : out std_logic
	);
end entity InfraredReciver;

architecture InfraredReciver_Arc of InfraredReciver is

type state_type is (idle, get_data, last_data, data_ready);
signal state : state_type := idle;

signal sampling_error : std_logic;
signal sampling_cmd : std_logic_vector(11 downto 0);

begin

sample: process(clk)
variable bit_count : integer;
begin
	if rising_edge (clk) then
		if reset = '1' then
			state <= idle;
		else
			case(state) is
				when idle =>		-- waiting for first bit
					if enable = '1' then
						bit_count := 11;	-- set counter 
						sampling_error <= '0';
						state <= get_data;
					end if;
				when get_data =>
					if enable = '1' then
						if 12 > bit_count then
							sampling_cmd(bit_count) <= data;
							bit_count := bit_count - 1;
							if error = '1' then 			-- if error has occur
								sampling_error <= '1';
							end if;
							if bit_count = -1 then
								state <= last_data;
							end if;
						end if;
					end if;
				when last_data =>
					cmd <= sampling_cmd;
					errorBit <= sampling_error;
					state <= data_ready;
				when data_ready =>
					--signal bus
					state <= idle;
			end case;
		end if;
	end if;
end process;

-- HUSK POT MAPPING TIL KASPER OG KRAUSE

	
end architecture InfraredReciver_Arc;