
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;
 
entity tlc_tb01 is
end tlc_tb01;
 
architecture behavior if tlc_tb01 is
 
    component traffic_light_controller
    port(
         clk_i : IN  std_logic;
	 ce_2HZ_i : IN  std_logic;
         srst_n_i : IN  std_logic;
         lights_o : OUT  std_logic_vector(5 downto 0);
         count_o : OUT  std_logic_vector(3 downto 0)
        );
    end component;
    
   --Vstupy
   signal clk_i : std_logic := '0';
   signal ce_2HZ_i : std_logic := '0';
   signal srst_n_i : std_logic := '0';
   
   --Vystupy
   signal lights_o : std_logic_vector(5 downto 0);
   signal count_o : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_i_period : time := 10 ns;
   begin
 
   uut: traffic_light_controller PORT MAP (
          clk_i => clk_i,
          ce_2HZ_i => ce_2HZ_i,
          srst_n_i => srst_n_i,
          lights_o => lights_o,
          count_o => count_o
        );

   -- Clock process definitions
   clk_i_process :process
   begin
		clk_i <= '0';
		wait for clk_i_period/2;
		clk_i <= '1';
		wait for clk_i_period/2;
   end process;
 

	 ce_2Hz_i_process :process
   begin
		ce_2Hz_i <= '0';
		wait for 3*clk_i_period; 
		ce_2Hz_i <= '1';
		wait for clk_i_period;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		
		srst_n_i <= '1';
		wait for 600 ns;
		srst_n_i <= '0';
      wait;
   end process;
end;
--Fiala Marek