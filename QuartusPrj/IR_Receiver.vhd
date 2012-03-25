library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity InfraredReciver is
	port(
		clk       : in  std_logic;
		reset     : in  std_logic;
		cmd       : out std_logic_vector(11 downto 0) := "000000000000";
		errorBit  : out std_logic;
		testBit   : out std_logic;

		--Forwared signals
		IR_RX     : in  std_logic;
		debugPins : out std_logic_vector(7 downto 0)
	);
end entity InfraredReciver;

architecture InfraredReciver_Arc of InfraredReciver is
	type state_type is (idle, get_data, data_received, wait_for_low_enable, data_ready);
	signal state : state_type := idle;

	signal sampling_error : std_logic;
	signal sampling_cmd   : std_logic_vector(11 downto 0);

	signal data, enable, error : std_logic;
	signal rcvDone             : std_logic := '0';
begin
	sample : process(clk)
		variable bit_count : integer;
	begin
		if rising_edge(clk) then
			if reset = '1' then
				state <= idle;
			else
				case (state) is
					when idle =>        -- waiting for first bit
						if enable = '1' then
							bit_count      := 11; -- set counter 
							sampling_error <= '0';
							state          <= get_data;
						end if;
					when get_data =>
						if enable = '1' then
							if (0 <= bit_count) then
								sampling_cmd(bit_count) <= data;
								testBit   <= data;
								bit_count := bit_count - 1;

								if error = '1' then -- if error has occur
									sampling_error <= '1';
								end if;

								if (bit_count >= 0) then
									state <= wait_for_low_enable;
								else
									state <= data_received;
								end if;
							end if;
						end if;
					when data_received =>
						cmd      <= sampling_cmd;
						errorBit <= sampling_error;
						rcvDone  <= '1';
						state    <= data_ready;
					when wait_for_low_enable =>
						if enable = '0' then
							if bit_count >= 0 then
								state <= get_data;
							else
								rcvDone <= '0';
								state   <= idle;
							end if;
						end if;
					when data_ready =>
						--signal bus

						state <= wait_for_low_enable;
				end case;
			--testBit <= bit_count; -- TEST
			end if;
		end if;
	end process;

	-- HUSK POT MAPPING TIL KASPER OG KRAUSE

	--Validator : entity work.Validator(TestValidator) port map ( dataOut => data,
	Validator : entity work.Validator(ValidatorArc) port map(dataOut   => data,
			                                                 clk       => clk,
			                                                 reset     => reset,
			                                                 readbit   => enable,
			                                                 error     => error,
			                                                 IR_RX     => IR_RX,
			                                                 rcvDone   => rcvDone,
			                                                 debugPins => debugPins
		);

end architecture InfraredReciver_Arc;
