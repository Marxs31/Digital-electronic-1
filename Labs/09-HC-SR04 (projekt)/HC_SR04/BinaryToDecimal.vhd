Library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity BinaryToDecimal is
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	str_i : in std_logic;
	din_i : in std_logic_vector(11 downto 0);
	ONE : out std_logic_vector(3 downto 0);
	TEN : out std_logic_vector(3 downto 0);
	HUN : out std_logic_vector(3 downto 0);
	THO : out std_logic_vector(3 downto 0)
	);
end BinaryToDecimal;

Architecture Structural of BinaryToDecimal is
Component Latch is port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	set_i : in std_logic;
	clr_i : in std_logic;
	qout_o : out std_logic);
end Component;
Component Counter is generic(busWidth : integer := 8);
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	inc_i : in std_logic;
	cnt_o : out std_logic_vector(busWidth - 1 downto 0));
end Component;
Component DecimalCounter is port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	eni_i : in std_logic;
	ONE : out std_logic_vector(3 downto 0);
	TEN : out std_logic_vector(3 downto 0);
	HUN : out std_logic_vector(3 downto 0);
	THO : out std_logic_vector(3 downto 0));
end Component;
signal ena, eoc, rss, gte, inc_i : std_logic;
signal cnt_o : std_logic_vector(11 downto 0);
begin
	rss <= rst_i AND NOT(str_i); 
	inc_i <= gte AND ena;
	eoc <= NOT(gte); 
	gte <= '1' when unsigned(din_i) > unsigned(cnt_o) else '0';
	
	U01 : Latch port map(rst_i, clk_i, str_i, eoc, ena);
	U02 : Counter generic map(12) port map(ena, clk_i, '1', cnt_o);
	U03 : DecimalCounter port map(rss, clk_i, inc_i, ONE, TEN, HUN, THO);	
end Structural;	   
/*Fiala, Haniška*/