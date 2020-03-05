------------------------------------------------------------------------
--
-- Implementation of 4-bit binary counter.
-- Xilinx XC2C256-TQ144 CPLD, ISE Design Suite 14.7
--
-- Copyright (c) 2019-2020 Tomas Fryza
-- Dept. of Radio Electronics, Brno University of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for top level
------------------------------------------------------------------------
entity top is
port (
    clk_i      : in  std_logic;     -- 10 kHz clock signal
    BTN0       : in  std_logic;     -- Synchronous reset
    disp_seg_o : out std_logic_vector(7-1 downto 0);
    disp_dig_o : out std_logic_vector(4-1 downto 0)
);
end entity top;

------------------------------------------------------------------------
-- Architecture declaration for top level
------------------------------------------------------------------------
architecture Behavioral of top is
    constant c_NBIT0 : positive := 4;   -- Number of bits for Counter0
			signal s_en : std_logic;
			signal s_hex : std_logic_vector (4-1 downto 0);
	--- WRITE YOUR CODE HERE
begin

    --------------------------------------------------------------------
    -- Sub-block of clock_enable entity
    --- WRITE YOUR CODE HERE
		CLK_EN_0 : entity work.clock_enable
	 generic map (g_NPERIOD => x"2710")
	 port map (
		 clk_i	=>	clk_i,
		 srst_n_i => BTN0,
		 clock_enable_o => s_en);

    --------------------------------------------------------------------
    -- Sub-block of binary_cnt entity
    --- WRITE YOUR CODE HERE
			BIN_CNT_0 : entity work.binary_cnt
	 generic map (g_NBIT => 4)
	 port map (
		 clk_i	=>	clk_i,
		 en_i => s_en,
		 srst_n_i => BTN0,
		 cnt_o => s_hex);

    --------------------------------------------------------------------
    -- Sub-block of hex_to_7seg entity
    --- WRITE YOUR CODE HERE
		    hex_to_7seg : entity work.hex_to_7seg
			 port map (
			 hex_i => s_hex,
			 seg_o => disp_seg_o);
    -- Select display position
    disp_dig_o <= "1110";

end architecture Behavioral;