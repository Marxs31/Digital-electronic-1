Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

Entity HC_SR04 is
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	str_i : in std_logic;
	ech_i : in std_logic;
	trg_o : out std_logic;
	dis_o : out std_logic_vector(11 downto 0)
	);
end HC_SR04;

Architecture Structural of HC_SR04 is
Component Latch is port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	set_i : in std_logic;
	clr_i : in std_logic;
	qout_o : out std_logic);
end Component;
Component Timer is generic(Ticks : integer := 10);
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	eot_o : out std_logic );
end Component;
Component Counter is generic(busWidth : integer := 8);
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	inc_i : in std_logic;
	cnt_o : out std_logic_vector(busWidth - 1 downto 0));
end Component;
signal ena, eot_o, syn, rss : std_logic;
signal cnt_o : std_logic_vector(14 downto 0);
constant K : std_logic_vector(15 downto 0) := "0010101110000101";
signal res : std_logic_vector(30 downto 0);
begin
	trg_o <= ena;
	rss <= rst_i AND NOT(eot_o);
	res <= unsigned(cnt_o) * unsigned(K);
	dis_o <= res(27 downto 16);
	U01 : Latch port map(rst_i, clk_i, str_i, eot_o, ena);
	U02 : Timer generic map(1000) port map(ena, clk_i, eot_o);
	U03 : Timer generic map(100)  port map(ech_i, clk_i, syn);
	U04 : Counter generic map(15) port map(rss, clk_i, syn, cnt_o);
end Structural;		
/*Fiala, Haniška*/
