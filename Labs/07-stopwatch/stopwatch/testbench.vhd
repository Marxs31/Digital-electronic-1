library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
--empty
end testbench;

architecture tb of testbench is
-- DUT component
component driver_7seg is
port(
	clk_i    : in  std_logic;
    srst_n_i : in  std_logic;  
    cnt_en_i : in  std_logic;	
    seg_o    : out unsigned(7-1 downto 0);
    dig_o    : out unsigned(4-1 downto 0)
);
end component;

signal clk_in   	: std_logic := '0';
signal srst_n_in 	:   std_logic := '0';   
signal cnt_en_in	:   std_logic := '0';
signal seg_out   	:  unsigned(7-1 downto 0);
signal dig_out    	:  unsigned(4-1 downto 0);


BEGIN
	UUT: driver_7seg port map(
     						clk_i => clk_in, 
     						srst_n_i => srst_n_in, 
    						cnt_en_i => cnt_en_in,
      						seg_o => seg_out, 
      						dig_o => dig_out
    						);


	Clk_gen: process	-- NEW
  	begin
    	while Now < 1000 NS loop		
      		clk_in <= '0';
      		wait for 0.5 NS;
      		clk_in <= '1';
      		wait for 0.5 NS;
    	end loop;
    	wait;
  	end process Clk_gen;
   
   -- Stimulus process
   stim_proc: process
   begin		
 
      srst_n_in <= '1';
      wait until rising_edge(clk_in);	-- NEW
      wait until rising_edge(clk_in);	-- NEW
      srst_n_in <= '0';
      wait until rising_edge(clk_in);	-- NEW
      wait until rising_edge(clk_in);	-- NEW
      wait until rising_edge(clk_in);	-- NEW
      srst_n_in <= '1';
      
      wait;
   end process;
end tb;