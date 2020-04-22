Library IEEE;
use IEEE.std_logic_1164.all;

Entity Latch is
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	set_i : in std_logic;
	clr_i : in std_logic;
	qout_o : out std_logic
	);
end Latch;

Architecture Behavioral of Latch is
signal Qp, Qn : std_logic;
begin
	Combinational : process(Qp, set_i, clr_i)
	begin
		if set_i = '1' then
			Qn <= '1';
		elsif clr_i = '1' then
			Qn <= '0';
		else
			Qn <= Qp;
		end if;
		qout_o <= Qp;
	end process Combinational;
	Sequential : process(rst_i, clk_i)
	begin
		if rst_i = '0' then
			Qp <= '0';
		elsif clk_i'event and clk_i = '1' then
			Qp <= Qn;
		end if;
	end process Sequential;
end Behavioral;		 
/*Fiala, Haniška*/