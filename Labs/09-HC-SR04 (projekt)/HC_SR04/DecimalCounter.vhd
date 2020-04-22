Library IEEE;
use IEEE.std_logic_1164.all;

Entity DecimalCounter is
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	eni_i : in std_logic;
	ONE : out std_logic_vector(3 downto 0);
	TEN : out std_logic_vector(3 downto 0);
	HUN : out std_logic_vector(3 downto 0);
	THO : out std_logic_vector(3 downto 0)
	);
end DecimalCounter;

Architecture Structural of DecimalCounter is
Component CounterM10 is port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	eni_i : in std_logic;
	eno_o : out std_logic;
	cnt_o : out std_logic_vector(3 downto 0));
end Component;
signal eni_1, eni_2, eni_3 : std_logic;
begin
	U01 : CounterM10 port map(rst_i, clk_i, eni_i, eni_1, ONE);
	U02 : CounterM10 port map(rst_i, clk_i, eni_1, eni_2, TEN);
	U03 : CounterM10 port map(rst_i, clk_i, eni_2, eni_3, HUN);
	U04 : CounterM10 port map(rst_i, clk_i, eni_3, OPEN, THO);
end Structural;						 
/*Fiala, Haniška*/