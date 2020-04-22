Library IEEE;
use IEEE.std_logic_1164.all;

Entity FallingEdge is
	generic(n : integer := 6);
	port(
	rst_i  : in std_logic;
	clk_i  : in std_logic;
	hex_i  : in std_logic;
	hex_o : out std_logic
	);
End FallingEdge;

Architecture Behavioral of FallingEdge is
signal Xr : std_logic_vector(n - 1 downto 1);
signal Xp : std_logic_vector(n - 1 downto 0);
signal Xn : std_logic_vector(n - 1 downto 0);
Begin
	Combinational : process(hex_i, Xp, Xr)
	begin
		Xn(0) <= hex_i;
		for k in 1 to n - 1 loop
			Xn(k) <= Xp(k - 1);
		end loop;
		Xr(1) <= NOT(hex_i) AND NOT(Xp(0));
		for i in 1 to n - 2 loop
			Xr(i + 1) <= Xr(i) AND NOT(Xp(i));
		end loop;
		hex_o <= Xr(n - 1) AND Xp(n - 1);
	end process Combinational;
	Sequential : process(rst_i, clk_i)
	begin
		if rst_i = '0' then
			Xp <= (others => '0');
		elsif clk_i'event and clk_i = '1' then
			Xp <= Xn;
		end if;
	end process Sequential;
End Behavioral;	   
/*Fiala, Haniška*/