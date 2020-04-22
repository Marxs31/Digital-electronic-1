Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity Counter is
	generic(busWidth : integer := 8);
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	inc_i : in std_logic;
	cnt_o : out std_logic_vector(busWidth - 1 downto 0)
	);
end Counter;

Architecture Behavioral of Counter is
signal Cp, Cn : std_logic_vector(busWidth - 1 downto 0);
begin
	Combinational : process(Cp, inc_i)
	begin
		if inc_i = '1' then
			Cn <= Cp + 1;
		else
			Cn <= Cp;
		end  if;
		cnt_o <= Cp;
	end process Combinational;
	Sequential : process(rst_i, clk_i)
	begin
		if rst_i = '0' then
			Cp <= (others => '0');
		elsif clk_i'event and clk_i = '1' then
			Cp <= Cn;
		end if;
	end process Sequential;
end Behavioral;	 
/*Fiala, Haniška*/