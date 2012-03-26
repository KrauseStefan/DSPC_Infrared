library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity IR_Receiver_Componment is
	port(
		-- Avalon Interface
		csi_clockreset_clk     : in  std_logic; -- Avalon Clk
		csi_clockreset_reset_n : in  std_logic; -- Avalon Reset
		avs_s1_write           : in  std_logic; -- Avalon wr
		avs_s1_read            : in  std_logic; -- Avalon rd
		avs_s1_chipselect      : in  std_logic; -- Avalon cs
		avs_s1_address         : in  std_logic_vector(7 downto 0); -- Avalon address
		avs_s1_writedata       : in  std_logic_vector(15 downto 0); -- Avalon wr data
		avs_s1_readdata        : out std_logic_vector(15 downto 0) := (others => '0'); -- Avalon rd data

		-- Interrupt output
		bus_irq                : out std_logic;
		IR_RX                  : in  std_logic;

		debugPins              : out std_logic_vector(7 downto 0)
	);
end entity IR_Receiver_Componment;

architecture IR_Componment_Arc of IR_Receiver_Componment is
	signal data  : std_logic_vector(11 downto 0);
	signal error : std_logic;

begin
	mm_bus : process(csi_clockreset_clk)
	begin
		if rising_edge(csi_clockreset_clk) then
			if avs_s1_chipselect = '1' and avs_s1_read = '1' then
				avs_s1_readdata(12 downto 1) <= data;
				avs_s1_readdata(15 downto 13) <= "000";
				avs_s1_readdata(0) <= error;
			end if;
		end if;
	end process;

	dataGetting : entity work.InfraredReciver port map(
			clk       => csi_clockreset_clk,
			reset     => csi_clockreset_reset_n,
			cmd       => data,
			errorBit  => error,
			IR_RX     => IR_RX,
			debugPins => debugPins
		);

end architecture IR_Componment_Arc;