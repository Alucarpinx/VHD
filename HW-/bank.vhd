library ieee;
USE ieee.std_logic_1164.all;
USe ieee.numeric_std.all;
USe ieee.std_logic_unsigned.all;

entity deff is
  PORT(
    d, clk, reset_n            : in  std_logic; 
    q                          : out std_logic
  );  
END deff;  

ARCHITECTURE behave of deff is 
BEGIN
	process(clk) is 
	  begin
	    if rising_edge(clk) then 
			 if reset_n = '0' then 
			   q <= '0';
			 else
			   q <= d;
			 end if;
		  end if;
	end process; 
END behave;
