library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity IR_Receiver_Componment_tb is
end;

architecture bench of IR_Receiver_Componment_tb is
	component IR_Receiver_Componment
		port(
			csi_clockreset_clk     : in  std_logic;
			csi_clockreset_reset_n : in  std_logic;
			avs_s1_write           : in  std_logic;
			avs_s1_read            : in  std_logic;
			avs_s1_chipselect      : in  std_logic;
			avs_s1_address         : in  std_logic_vector(7 downto 0);
			avs_s1_writedata       : in  std_logic_vector(15 downto 0);
			avs_s1_readdata        : out std_logic_vector(15 downto 0);
			bus_irq                : out std_logic;
			IR_RX                  : in  std_logic;
			debugPins              : out std_logic_vector(7 downto 0)
		);
	end component;

	signal clk                    : std_logic;
	signal csi_clockreset_reset_n : std_logic;
	signal avs_s1_write           : std_logic;
	signal avs_s1_read            : std_logic;
	signal avs_s1_chipselect      : std_logic;
	signal avs_s1_address         : std_logic_vector(7 downto 0);
	signal avs_s1_writedata       : std_logic_vector(15 downto 0);
	signal avs_s1_readdata        : std_logic_vector(15 downto 0);
	signal bus_irq                : std_logic;
	signal IR_RX                  : std_logic;
	signal debugPins              : std_logic_vector(7 downto 0);

	constant clock_period   : time    := 20 ns; -- 50 MHz;
	constant IrClock_period : time    := 27 us;
	constant Ir_signals     : integer := 32;

	signal stop_the_clock   : boolean;
	signal stop_the_Irclock : boolean := false;

begin
	uut : IR_Receiver_Componment
		port map(
			csi_clockreset_clk     => clk,
			csi_clockreset_reset_n => csi_clockreset_reset_n,
			avs_s1_write           => avs_s1_write,
			avs_s1_read            => avs_s1_read,
			avs_s1_chipselect      => avs_s1_chipselect,
			avs_s1_address         => avs_s1_address,
			avs_s1_writedata       => avs_s1_writedata,
			avs_s1_readdata        => avs_s1_readdata,
			bus_irq                => bus_irq,
			IR_RX                  => IR_RX,
			debugPins              => debugPins);

	stimulus : process
	begin
		csi_clockreset_reset_n <= '1';
		-- Put initialisation code here
		wait for 23 ms;
				
		avs_s1_chipselect <= '1';
		avs_s1_read <= '1';
		avs_s1_address <= X"00";
		
		-- Put test bench stimulus code here

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

end;