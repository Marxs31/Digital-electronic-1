Library IEEE;
use IEEE.std_logic_1164.all;

Entity Timer is
	generic(Ticks : integer := 10);
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	eot_o : out std_logic
	);
end Timer;

Architecture Behavioral of Timer is
signal Cp, Cn : integer;
begin
	Combinational : process(Cp)
	begin
		if Cp = (Ticks - 1) then
			Cn <= 0;
			eot_o <= '1';
		else
			Cn <= Cp + 1;
			eot_o <= '0';
		end if;
	end process Combinational;
	Sequential : process(rst_i, clk_i)
	begin
		if rst_i = '0' then
			Cp <= 0;
		elsif clk_i'event and clk_i = '1' then
			Cp <= Cn;
		end if;
	end process Sequential;
end Behavioral;	
/*Fiala, Haniška*/