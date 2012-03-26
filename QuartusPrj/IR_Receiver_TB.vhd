library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

-------------------------------------------------------------------------------

entity IR_Receiver_TB is
end IR_Receiver_TB;

-------------------------------------------------------------------------------

architecture test of IR_Receiver_TB is
	component InfraredReciver
		port(
			clk      : in  std_logic;
			reset    : in  std_logic;
			IR_RX    : in std_logic;
			cmd      : out std_logic_vector(11 downto 0);
			errorBit : out std_logic;
			testBit  : out integer
		);
	end component;

	signal clk      : std_logic;
	signal reset    : std_logic := '1';
	signal cmd      : std_logic_vector(11 downto 0);
	signal errorBit : std_logic;
	signal testBit  : std_logic;
	signal IR_RX    : std_logic;

	--	constant clock_period : time := 10 ns;


	-- clk perioden skal v�re 
	constant clock_period   : time    := 20 ns; -- 2 MHz;
	constant IrClock_period : time    := 27 us;
	constant Ir_signals     : integer := 32;

	signal stop_the_clock   : boolean;
	signal stop_the_Irclock : boolean := false;

begin

	-- Component instantiation
	UUT : entity work.InfraredReciver port map(clk      => clk,
			                                   reset    => reset,
			                                   cmd      => cmd,
			                                   errorBit => errorBit,
			                                   testBit  => testBit,
			                                   IR_RX    => IR_RX
		);

	stimulus : process
	begin
		--		wait for clock_period * 2;

		reset <= '1';

		wait until cmd(0) = '1';
		wait for clock_period * 3;
		stop_the_clock <= true;
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

end test;