library ieee;
use ieee.std_logic_1164.all;

entity Counter is
	port(
		clk      : in  std_logic;       -- 1,512 MHz
		IR_RX    : in  std_logic;
		sr_in    : in  std_logic;
		shift    : in  std_logic;
		data     : out std_logic := '0';
		valid    : out std_logic := '0';
		intValid : out std_logic := '0'
	);
end entity Counter;

architecture Counter_Arc of Counter is
begin
	receive : process(clk) is
		variable bitShiftReg : std_logic_vector(11 downto 0) := x"000";
		variable rcvCount    : integer                       := 0;
		variable isHigh      : boolean                       := false;
	begin
		if rising_edge(clk) then
			bitShiftReg(11 downto 1) := bitShiftReg(10 downto 0);
			bitShiftReg(0) := IR_RX;

			if(bitShiftReg = x"FFF" and isHigh = false) then
				rcvCount := 1 + rcvCount;
				isHigh  := true;
			elsif(not(bitShiftReg = x"FFF") and isHigh = true) then
				isHigh := false;
			end if;

			if(rcvCount = 32) then
				intValid <= '1';
				rcvCount := 0;
			else
				intValid <= '0';
			end if;

		--			case bitShiftReg is
		--				when x"fff" =>
		--					valid <= '1';
		--					data <= '1';
		--				when x"000" =>
		--					valid <= '1';
		--					data <= '0';					
		--				when others => 
		--					valid <= '0';			
		--			end case;				

		end if;
	end process receive;

end architecture Counter_Arc;

