Library IEEE;
use IEEE.std_logic_1164.all;

Entity DistanceMeter is
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	ech_i : in std_logic;
	trg_o : out std_logic;
	seg_o : out std_logic_vector(7 downto 0);
	ano_o : out std_logic_vector(3 downto 0)
	);
end DistanceMeter;

Architecture Structural of DistanceMeter is
Component Timer is generic(Ticks : integer := 10);
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	eot_o : out std_logic);
end Component;
Component HC_SR04 is port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	str_i : in std_logic;
	ech_i : in std_logic;
	trg_o : out std_logic;
	dis_o : out std_logic_vector(11 downto 0));
end Component;
Component FallingEdge is generic(n : integer := 6);
	port(
	rst_i  : in std_logic;
	clk_i  : in std_logic;
	hex_i  : in std_logic;
	hex_o : out std_logic );
End Component;
Component BinaryToDecimal is port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	str_i : in std_logic;
	din_i : in std_logic_vector(11 downto 0);
	ONE : out std_logic_vector(3 downto 0);
	TEN : out std_logic_vector(3 downto 0);
	HUN : out std_logic_vector(3 downto 0);
	THO : out std_logic_vector(3 downto 0));
end Component;
Component DisplayDriver is port(
	rst_i  : in std_logic;
	clk_i  : in std_logic;
	DIG1 : in std_logic_vector(3 downto 0);
	DIG2 : in std_logic_vector(3 downto 0);
	DIG3 : in std_logic_vector(3 downto 0);
	DIG4 : in std_logic_vector(3 downto 0);
	seg_o  : out std_logic_vector(7 downto 0);
	ano_o  : out std_logic_vector(3 downto 0));
end Component;
signal str_i, eom_i : std_logic;
signal dis_o : std_logic_vector(11 downto 0);
signal ONE : std_logic_vector(3 downto 0);
signal TEN : std_logic_vector(3 downto 0);
signal HUN : std_logic_vector(3 downto 0);
signal THO : std_logic_vector(3 downto 0);
begin
	U01 : Timer generic map(2500000) port map(rst_i, clk_i, str_i);
	U02 : HC_SR04 port map(rst_i, clk_i, str_i, ech_i, trg_o, dis_o);
	U03 : FallingEdge port map(rst_i, clk_i, ech_i, eom_i);
	U04 : BinaryToDecimal port map(rst_i, clk_i, eom_i, dis_o, ONE, TEN, HUN, THO);
	U05 : DisplayDriver port map(rst_i, clk_i, ONE, TEN, HUN, THO, seg_o, ano_o);
end Structural;	
/*Fiala, Haniška*/