library ieee;
use ieee.std_logic_1164.all;

entity Counter is
	port(
		clk   : in  std_logic;          -- 1,512 MHz
		IR_RX : in  std_logic;
		sr_in : in std_logic;
		shift : in std_logic;
		data  : out std_logic := '0';
		valid : out std_logic := '0'
	);
end entity Counter;

architecture Counter_Arc of Counter is
--	variable rcvCount : integer := 0;
	signal bitShiftReg : std_logic_vector(7 downto 0) := x"00";
	signal intValid : std_logic := '0';
begin
	receive : process(clk) is
	begin
		if rising_edge(clk) then 
			bitShiftReg(7 downto 1) <= bitShiftReg(6 downto 0);
			bitShiftReg(0) <= IR_RX;

			case bitShiftReg is
				when x"ff" =>
					valid <= '1';
					data <= '1';
				when x"00" =>
					valid <= '1';
					data <= '0';					
				when others => 
					valid <= '0';			
			end case;				

		end if;
	end process receive;

end architecture Counter_Arc;

