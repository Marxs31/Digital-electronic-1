Library IEEE;
use IEEE.std_logic_1164.all;

Entity Multiplexer4To1 is
	generic(busWidth : integer := 8);
	port(
	hex_1 : in std_logic_vector(busWidth - 1 downto 0);
	hex_2 : in std_logic_vector(busWidth - 1 downto 0);
	hex_3 : in std_logic_vector(busWidth - 1 downto 0);
	hex_4 : in std_logic_vector(busWidth - 1 downto 0);
	sel_i  : in std_logic_vector(1 downto 0);
	hex_o : out std_logic_vector(busWidth - 1 downto 0)
	);
end Multiplexer4To1;

Architecture DataPath of Multiplexer4To1 is
begin
	With sel_i Select hex_o <=
	hex_2 when "01",
	hex_3 when "10",
	hex_4 when "11",
	hex_1 when others;
end DataPath;			
/*Fiala, Haniška*/