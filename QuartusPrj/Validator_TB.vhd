library IEEE;
USE IEEE.Std_logic_1164.ALL;
use IEEE.Numeric_Std.all;

entity Validator_TB is
end;

architecture bench of Validator_TB is
	component Validator
		Port(
			clk     : in  std_logic;
			reset   : in  std_logic;
			dataOut : out std_logic;
			readbit : out std_logic;
			error   : out std_logic;
			first   : out std_logic;
			second  : out std_logic;
			IR_RX   : in  std_logic;
			rcvDone : in  std_logic
		);
	end component;

	signal dataIn        : std_logic;
	signal enable        : std_logic;
	signal clk           : std_logic;
	signal dataOut       : std_logic;
	signal readbit       : std_logic;
	signal error         : std_logic;
	signal reset         : std_logic;
	signal IR_RX         : std_logic;
	signal first, second : std_logic := '0';
	signal rcvDone       : std_logic := '0';

	-- signal med data - skal muligvis �ndres til en anden type data
	--signal dataInValue : unsigned(23 downto 0) := "0110011000";

	-- clk perioden skal v�re 
	constant clock_period   : time    := 20 ns; -- 2 MHz;
	constant IrClock_period : time    := 27 us;
	constant Ir_signals     : integer := 32;

	signal stop_the_clock   : boolean;
	signal stop_the_Irclock : boolean := false;

begin
	Validator_inst : entity work.Validator(ValidatorArc)
		port map(
			clk     => clk,
			reset   => reset,
			dataOut => dataOut,
			readbit => readbit,
			error   => error,
			second  => second,
			first   => first,
			IR_RX   => IR_RX,
			rcvDone => rcvDone
		);

	stimulus : process
	begin
		-- Enable High.
		--    wait for clkperiode;
		--    enable <= '0';
		--    wait for clkperiode;

		--    enable <= '1';
		--    wait for clkperiode;

		-- Read data.
		--    dataIn <= '0';
		--    wait for clkperiode;

		-- Enable Low
		--    enable <= '0';
		--    wait for clkperiode;

		-- Enable high
		--    enable <= '1';
		--    dataIn <= '1';
		--    wait for clkperiode;

		--    dataIn <= '0';
		--    enable <= '0';
		--    wait for clkperiode;
		-- Wait until every state in Bitsample have been countet for

		reset <= '0';
		wait for 1 us;

		reset <= '1';




--		wait for clock_period * 100;
--		stop_the_clock <= true;
		wait;
	end process;

	IRclocking : process
		variable Ir_recived : integer := 0;
	begin
		wait for 1 us;
		while not stop_the_Irclock loop
			IR_RX <= '1', '0' after IrClock_period / 3 * 2;
			if (Ir_recived = Ir_signals) then
				-- stop_the_Irclock <= true;
				IR_RX      <= '1';
				Ir_recived := 0;
				wait for 889 us;
			else
				Ir_recived := 1 + Ir_recived;
			end if;
			wait for IrClock_period;
		end loop;
		wait;
	end process;

	clocking : process
	begin
		while not stop_the_clock loop
			clk <= '0', '1' after clock_period / 2;
			wait for clock_period;
		end loop;
		wait;
	end process;

end;                                    -- archtecture

    