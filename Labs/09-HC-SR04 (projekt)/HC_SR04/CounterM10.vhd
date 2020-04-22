Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity CounterM10 is
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	eni_i : in std_logic;
	eno_o : out std_logic;
	cnt_o : out std_logic_vector(3 downto 0)
	);
end CounterM10;

Architecture Behavioral of CounterM10 is
signal Cp, Cn : std_logic_vector(3 downto 0);
begin
	Combinational : process(Cp, eni_i)
	begin
		if eni_i = '1' then
			if Cp = "1001" then
				Cn <= "0000";
				eno_o <= '1';
			else
				Cn <= Cp + 1;
				eno_o <= '0';
			end if;
		else
			Cn <= Cp;
			eno_o <= '0';
		end if;
		cnt_o <= Cp;
	end process Combinational;
	Sequential : process(rst_i, clk_i)
	begin
		if rst_i = '0' then
			Cp <= "0000";
		elsif clk_i'event and clk_i = '1' then
			Cp <= Cn;
		end if;
	end process Sequential;
end Behavioral;	 
/*Fiala, Haniška*/