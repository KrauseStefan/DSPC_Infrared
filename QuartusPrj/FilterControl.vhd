library ieee;

use IEEE.std_logic_1164.all;

entity FilterControl is
	port(
		clk     : in  std_logic;
		reset_n : in  std_logic;

		IR_RX   : in  std_logic;

		data    : out std_logic_vector(7 downto 0)
	);
end entity FilterControl;

architecture rtl of FilterControl is
	signal ast_sink_data  : std_logic_vector(7 downto 0);
	signal ast_sink_ready : std_logic;
	signal ast_sink_valid : std_logic;
	signal ast_sink_error : std_logic_vector(1 downto 0);

	signal ast_source_data  : std_logic_vector(7 downto 0);
	signal ast_source_ready : std_logic;
	signal ast_source_valid : std_logic;
	signal ast_source_error : std_logic_vector(1 downto 0);

	type stBusStates is (transfer, holdOne);
	signal sinkState   : stBusStates := transfer;
	signal sourceState : stBusStates := transfer;
begin
	fir_Filter : entity work.filter port map(
			clk              => clk,
			reset_n          => reset_n,
			coeff_in_clk     => clk,
			coeff_in_areset  => reset_n,
			--- sink = input
			ast_sink_data    => ast_sink_data,
			ast_sink_ready   => ast_sink_ready,
			ast_sink_valid   => ast_sink_valid,
			ast_sink_error   => ast_sink_error,
			--- source = output
			ast_source_data  => ast_source_data,
			ast_source_ready => '1',    -- Always ready
			ast_source_valid => ast_source_valid,
			ast_source_error => ast_source_error);

	sinkProc : process(clk, reset_n) is
	begin
		if reset_n = '0' then
		elsif rising_edge(clk) then
			case sinkState is
				when transfer =>
					if (ast_sink_ready = '1') then
						if IR_RX = '0' then
							ast_sink_data <= x"00";
						else
							ast_sink_data <= x"ff";
						end if;
						ast_sink_valid <= '1';
						sinkState      <= holdOne;
					else
						ast_sink_valid <= '0';
					end if;
				when holdOne =>
					sinkState <= transfer;
				when others => null;
			end case;
		end if;
	end process sinkProc;

	sourceProc : process(clk, reset_n) is
	begin
		if reset_n = '0' then
		elsif rising_edge(clk) then
			case sourceState is         -- always ready
				when transfer =>
					if (ast_source_valid = '1') then
						data        <= ast_source_data;
						sourceState <= holdOne;
					end if;
				when holdOne =>
					sourceState <= transfer;
				when others => null;
			end case;
		end if;
	end process sourceProc;

end architecture rtl;

























