------------------------------------------------------------------------
--
-- Hex to seven-segment decoder.
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
-- Entity declaration for hex to seven-segment decoder
------------------------------------------------------------------------
entity hex_to_7seg is
    port (
	hex_i: in std_logic_vector(3 downto 0);
	seg_o: out std_logic_vector(7 downto 0)
	);
end hex_to_7seg;   

 ------------------------------------------------------------------------
-- Architecture declaration for hex to seven-segment decoder
------------------------------------------------------------------------
  Architecture DataPath of hex_to_7seg is
begin	
 --------------------------------------------------------------------
    --         a
    --       -----          a: seg_o(6)
    --    f |     | b       b: seg_o(5)
    --      |  g  |         c: seg_o(4)
    --       -----          d: seg_o(3)
    --    e |     | c       e: seg_o(2)
    --      |     |         f: seg_o(1)
    --       -----          g: seg_o(0)
    --         d
    --------------------------------------------------------------------



	
		With hex_i Select seg_o <=
	"10011111" when "0001", --1
	"00100101" when "0010",	--2
	"00001101" when "0011",	--3
	"10011001" when "0100",	--4
	"01001001" when "0101",	--5
	"01000001" when "0110",	--6
	"00011101" when "0111",	--7
	"00000001" when "1000",	--8
	"00001001" when "1001",	--9
	"00010001" when "1010",	--A
	"11000001" when "1011",	--B
	"01100011" when "1100",	--C
	"10000101" when "1101",	--D
	"01100001" when "1110",	--E
	"01110001" when "1111",	--F
	"00000011" when others;	--0
end DataPath;  
/*Fiala, Haniška*/
/*Fiala, Haniška*/