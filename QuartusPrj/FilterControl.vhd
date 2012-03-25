library ieee;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FilterControl is
	port(
		clk     : in  std_logic;
		reset_n : in  std_logic;

		IR_RX   : in  std_logic;

		data    : out std_logic
	);
end entity FilterControl;

architecture rtl of FilterControl is
	signal coeff_in_clk    : std_logic;
	signal coeff_in_areset : std_logic;

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
			coeff_in_areset  => coeff_in_areset,
			--- sink = input
			ast_sink_data    => ast_sink_data,
			ast_sink_ready   => ast_sink_ready,
			ast_sink_valid   => ast_sink_valid,
			ast_sink_error   => ast_sink_error,
			--- source = output
			ast_source_data  => ast_source_data,
			ast_source_ready => ast_source_ready, -- Always ready
			ast_source_valid => ast_source_valid,
			ast_source_error => ast_source_error);

	sinkProc : process(clk, reset_n) is
		constant SCALE_TO : integer := 5;
		variable scaler   : integer := 0;
	begin
		if reset_n = '0' then
			coeff_in_clk    <= '0';
			coeff_in_areset <= '1';
			sinkState       <= transfer;
			ast_sink_valid  <= '0';
		elsif rising_edge(clk) then
			coeff_in_areset <= '1';
			case sinkState is
				when transfer =>
					if (ast_sink_ready = '1') then
						if IR_RX = '0' then
							ast_sink_data <= std_logic_vector(to_signed(0, 8));
						else
							ast_sink_data <= std_logic_vector(to_signed(127, 8));
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
		elsif falling_edge(clk) then
		end if;

	--		scaler := scaler + 1;
	--		if (scaler >= SCALE_TO) then
	--			scaler := 0;
	--		end if;

	end process sinkProc;

	sourceProc : process(clk, reset_n) is
		variable result : integer;
	begin
		if reset_n = '0' then
			sourceState      <= transfer;
			ast_source_ready <= '0';
		elsif rising_edge(clk) then
			case sourceState is         -- always ready
				when transfer =>
					ast_source_ready <= '1';
					if (ast_source_valid = '1') then
						result := TO_INTEGER(signed(ast_source_data));
						if result >= 3 then
							data <= '1';
						else
							data <= '0';
						end if;
						sourceState <= holdOne;
					end if;
				when holdOne =>
					sourceState <= transfer;
				when others => null;
			end case;
		end if;
	end process sourceProc;

end architecture rtl;

























