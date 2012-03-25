library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DeModulator is
	port(
		clk     : in  std_logic;        -- 1,512 MHz not during test
		reset_n : in  std_logic;
		IR_RX   : in  std_logic;
		data    : out std_logic := '0'
	);
end entity DeModulator;

architecture DeModulator_Arc of DeModulator is
	-- clock freq: 2MHz
	-- bit time Period: 889us
	-- 1778 tics = 889us/(1/2MHz)
	constant BIT_TIME          : integer := 1778; --us
	constant HOLD_TICS         : integer := BIT_TIME / (32 * 2); -- hold for half a mod cycle
	constant MODULATION_CYCLES : integer := 32;

	type deModulatorStates is (low, high);
	signal deModState : deModulatorStates := low;
	signal dataCounter : integer;
	signal idleCounter : integer;
	signal holdCounter : integer;
	
	-- preVal is '1' to make sure we don't get false reading if reset is used.
	signal preVal      : std_logic := '1';
	signal intData     : std_logic;
begin
	FilterControl1 : entity work.FilterControl
		port map(clk     => clk,
			     reset_n => reset_n,
			     IR_RX   => IR_RX,
			     data    => intData
		);

	receive : process(clk) is
	begin
		if reset_n = '1' then
			preVal <= '1';
			data   <= '0';
		elsif rising_edge(clk) then
			preVal <= intData;
			-- if rising edge
			if preVal = '0' and intData = '1' then
				dataCounter <= dataCounter + 1;
				idleCounter <= 0;
			else
				idleCounter <= idleCounter + 1;
			end if;

			case deModState is
				when low =>
					data <= '0';
					if dataCounter = MODULATION_CYCLES then
						deModState <= high;
					end if;
				when high =>
					data <= '1';
					if (HOLD_TICS <= holdCounter) then
						deModState  <= low;
						holdCounter <= 0;
						data        <= '0';
					else
						holdCounter <= holdCounter + 1;
					end if;
				when others => null;
			end case;

		end if;
	end process receive;

end architecture DeModulator_Arc;



