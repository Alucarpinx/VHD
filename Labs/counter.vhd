LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;            
USE ieee.std_logic_unsigned.all;

entity counter IS
		Port ( set_n                     : 		 in   STD_LOGIC_VECTOR(9 downto 0);   
				 clkTT                     :      in   STD_LOGIC;  
				 timer                     :      in   std_logic; 
				 enable                    :      in   std_logic; 
				 resetn                    :      in   STD_LOGIC; 
				 count                     : 	    out  STD_LOGIC_VECTOR(9 downto 0)
				 );     
END COMPONENT;

ARCHITECTURE BANDSUP OF counter IS
	
  SIGNAL int_count : UNSIGNED(3 downto 0);
  CONSTANT MAX_VAL : UNSIGNED(3 downto 0) := “1100”;

BEGIN
   Simple : PROCESS(clk, reset_n)
      BEGIN
			IF (reset_n = ‘0’) THEN
				int_count <= “0000”;
				ELSIF (rising_edge(clk)) THEN
						IF (int_count = MAX_VAL) THEN
i						    nt_count <= “0000”;
						ELSE
							 int_count <= int_count + “0001”;
						END IF;
			END IF;
	END PROCESS;
count <= STD_LOGIC_VECTOR(int_count);
end BANDSUP;