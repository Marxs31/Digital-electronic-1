Library IEEE;
use IEEE.std_logic_1164.all;

Entity AnodeDecoder is
	port(
	addr_i : in std_logic_vector(1 downto 0);
	data_o : out std_logic_vector(3 downto 0)
	);
end AnodeDecoder;

Architecture DataPath of AnodeDecoder is
begin
	With addr_i Select data_o <=
	"1101" when "01",
	"1011" when "10",
	"0111" when "11",
	"1110" when others;
end DataPath;	 
/*Fiala, Haniška*/