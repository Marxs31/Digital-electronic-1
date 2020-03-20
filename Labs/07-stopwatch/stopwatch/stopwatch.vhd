library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stopwatch is

port(
    clk_i       : in std_logic;
    ce_100Hz_i  : in std_logic;
    srst_n_i    : in std_logic;
    cnt_en_i    : in std_logic; 
  
    sec_h_o     : out unsigned (3 downto 0);
    sec_l_o     : out unsigned (3 downto 0);
    hth_h_o     : out unsigned (3 downto 0);
    hth_l_o     : out unsigned (3 downto 0)
	);
end entity stopwatch;

architecture Behavioral of stopwatch is
    
	signal cnt_sec_h_o  : unsigned (3 downto 0) := (others => '0');
	signal cnt_sec_l_o  : unsigned (3 downto 0) := (others => '0');
	signal cnt_hth_h_o  : unsigned (3 downto 0) := (others => '0');
	signal cnt_hth_l_o  : unsigned (3 downto 0) := (others => '0');
    signal cnt_en		: std_logic;

begin
     
    p_assign: process(clk_i)
    begin
    	if rising_edge(clk_i) then 
        	hth_l_o <= unsigned(cnt_hth_l_o);
            hth_h_o <= unsigned(cnt_hth_h_o);
            sec_l_o <= unsigned(cnt_sec_l_o);
            sec_h_o <= unsigned(cnt_sec_h_o);
            if cnt_en_i = '1' then
            	cnt_en 	<=	'0';
            else
            	cnt_en 	<=	'1';
            end if;
        end if;
      end process; 
            
    p_cnt: process(clk_i, srst_n_i, cnt_en, cnt_sec_h_o, cnt_sec_l_o, cnt_hth_h_o, cnt_hth_l_o)
    begin    
		if rising_edge(clk_i) then    	    
        	if srst_n_i = '0' or (cnt_hth_l_o = "1001" and cnt_hth_h_o = "1001" and cnt_sec_l_o = "1001" and cnt_sec_h_o = "0101") then
            	cnt_sec_h_o <= (others => '0');  
         	    cnt_sec_l_o <= (others => '0');
        	    cnt_hth_h_o <= (others => '0');
         	    cnt_hth_l_o <= (others => '0');
       	 	elsif cnt_en = '1' and ce_100Hz_i = '1' then
        		cnt_hth_l_o <= cnt_hth_l_o + 1;
        	    if cnt_hth_l_o = "1001" then
					cnt_hth_l_o <= (others => '0');
		   	       	cnt_hth_h_o <= cnt_hth_h_o + 1;
                   	if cnt_hth_h_o = "1001" then
						cnt_hth_h_o <= (others => '0');
        	        	cnt_sec_l_o <= cnt_sec_l_o + 1;
            	        if cnt_sec_l_o = "1001" then
                    		cnt_sec_l_o <= (others => '0');
                        	cnt_sec_h_o <= cnt_sec_h_o + 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process; 
end architecture Behavioral;