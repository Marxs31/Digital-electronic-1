Library IEEE;
use IEEE.std_logic_1164.all;

Entity DisplayDriver is
	port(
	rst_i  : in std_logic;
	clk_i  : in std_logic;
	DIG1 : in std_logic_vector(3 downto 0);
	DIG2 : in std_logic_vector(3 downto 0);
	DIG3 : in std_logic_vector(3 downto 0);
	DIG4 : in std_logic_vector(3 downto 0);
	seg_o  : out std_logic_vector(7 downto 0);
	ano_o  : out std_logic_vector(3 downto 0)
	);
end DisplayDriver;

Architecture Structural of DisplayDriver is
Component Timer is generic(Ticks : integer := 10);
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	eot_o : out std_logic);
end Component;
Component Counter is generic(busWidth : integer := 8);
	port(
	rst_i : in std_logic;
	clk_i : in std_logic;
	inc_i : in std_logic;
	cnt_o : out std_logic_vector(busWidth - 1 downto 0));
end Component;
Component AnodeDecoder is port(
	addr_i : in std_logic_vector(1 downto 0);
	data_o : out std_logic_vector(3 downto 0));
end Component;
Component Multiplexer4To1 is generic(busWidth : integer := 8);
	port(
	hex_1 : in std_logic_vector(busWidth - 1 downto 0);
	hex_2 : in std_logic_vector(busWidth - 1 downto 0);
	hex_3 : in std_logic_vector(busWidth - 1 downto 0);
	hex_4 : in std_logic_vector(busWidth - 1 downto 0);
	sel_i  : in std_logic_vector(1 downto 0);
	hex_o : out std_logic_vector(busWidth - 1 downto 0));
end Component;
Component hex_to_7seg is port(
	hex_i : in std_logic_vector(3 downto 0);
	seg_o : out std_logic_vector(7 downto 0));
end Component;
signal syn : std_logic;
signal sel_i : std_logic_vector(1 downto 0);
signal nib : std_logic_vector(3 downto 0);
begin
	U01 : Timer generic map(125000) port map(rst_i, clk_i, syn);
	U02 : Counter generic map(2) port map(rst_i, clk_i, syn, sel_i);
	U03 : AnodeDecoder port map(sel_i, ano_o);
	U04 : Multiplexer4To1 generic map(4) port map(DIG1, DIG2, DIG3, DIG4, sel_i, nib);
	U05 : hex_to_7seg port map(nib, seg_o);
end Structural;	  
/*Fiala, Haniška*/