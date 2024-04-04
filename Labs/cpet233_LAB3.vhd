-------------------------------------------------------------------------------
-- Hector Garcia
-- LAB3
-------------------------------------------------------------------------------
 
 -- Libraries 
library ieee;
USE ieee.std_logic_1164.all;

entity circuit is
  port (
    W, X, Y, Z  : in  std_logic; 
    a, b, c, d, e, f, g  : out std_logic;
	 a_cond, b_cond, c_cond, d_cond, e_cond, f_cond, g_cond: out std_logic;  --: out std_logic_vector(6 DownTo 0)
	 a_sel, b_sel, c_sel, d_sel, e_sel, f_sel, g_sel: out std_logic
  );  
END circuit;  


architecture pepe of circuit  is

signal Sin : std_logic_vector(3 downto 0) := "0000"; 
--signal Sout : std_logic_vector(6 DownTo 0) := "0000000";

signal selector_inputsA : std_logic_vector(3 downto 0) := "0000"; 
--signal selector_outputs : std_logic_vector(6 DownTo 0) := "0000000";
 
  
BEGIN
  
  Sin <= W & X & Y & Z; 
  --Sout <= a_cond & b_cond & c_cond & d_cond & e_cond & f_cond & g_cond;
  
  selector_inputsA <= W & X & Y & Z;
  --selector_inputsA <= a_sel & b_sel & c_sel & d_sel & e_sel & f_sel & g_sel;
  
  a <= (NOT W AND NOT X AND NOT Y AND Z) OR (NOT W AND NOT X AND Y AND Z) OR (NOT W AND X AND NOT Y AND NOT Z) OR (W AND NOT X AND Y AND NOT Z) OR (W AND X) OR (NOT W AND X AND Y AND Z) ;
  b <= (W AND X) OR (NOT W AND Y AND Z) OR (W AND NOT Y AND Z);
  c <= (W AND X) OR (NOT W AND Y AND Z);
  d <= (NOT W AND NOT x) OR (W AND X) OR (NOT W AND Y AND Z) OR (NOT Z AND NOT X) OR (NOT Y AND NOT Z);
  e <= (NOT Z) OR (Y) OR (NOT W AND NOT X) OR (W AND X);
  f <= (Y) OR (W AND NOT Z) OR (W AND X) OR (NOT W AND NOT X AND Z);
  g <= (W AND NOT Z) OR (W AND X) OR (NOT W AND NOT Y AND Z) OR (NOT X AND Y AND NOT Z);
  
  
  
  a_cond <= '1' WHEN Sin ="0001" or Sin ="0011" or Sin ="0100" or Sin ="0111" or Sin ="1010" or Sin ="1100" or Sin ="1101" or Sin ="1110" or Sin ="1111"
				else '0';
  
  b_cond <= '1' WHEN Sin ="0011" or Sin ="0111" or Sin ="1001" or Sin ="1100" or Sin ="1101" or Sin ="1110" or Sin ="1111"
				else '0';
  
  c_cond <= '1' WHEN Sin ="0011" or Sin ="0111" or Sin ="1100" or Sin ="1101" or Sin ="1110" or Sin ="1111"
				else '0';
  
  d_cond <= '1' WHEN Sin ="0000" or Sin ="0001" or Sin ="0010" or Sin ="0011" or Sin ="0100" or Sin ="0111" or Sin ="1000" or Sin ="1010" or Sin ="1100" or Sin ="1101" or Sin ="1110" or Sin ="1111"
				else '0';
  
  e_cond <= '1' WHEN Sin ="0000" or Sin ="0001" or Sin ="0010" or Sin ="0011" or Sin ="0100" or Sin ="0110" or Sin ="0111" or Sin ="1000" or Sin ="1010" or Sin ="1011" or Sin ="1100" or Sin ="1101" or Sin ="1110" or Sin ="1111"
				else '0';
  
  f_cond <= '1' WHEN Sin ="0001" or Sin ="0010" or Sin ="0011" or Sin ="0110" or Sin ="0111" or Sin ="1000" or Sin ="1010" or Sin ="1011" or Sin ="1100" or Sin ="1101" or Sin ="1110" or Sin ="1111"
				else '0';
  
  g_cond <= '1' WHEN Sin ="0001" or Sin ="0010" or Sin ="0101" or Sin ="1000" or Sin ="1010" or Sin ="1100" or Sin ="1101" or Sin ="1110" or Sin ="1111"
				else '0';
	
	
  WITH selector_inputsA SELECT
  
			a_sel <= '1' WHEN "0001" | "0011" | "0100" | "0111" | "1010" | "1100" | "1101" | "1110" | "1111",
				      '0' WHEN OTHERS;
						
  WITH selector_inputsA SELECT
  
			b_sel <= '1' WHEN "0011" | "0111" | "1001" | "1100" | "1101" | "1110" | "1111",
				      '0' WHEN OTHERS;
				
  WITH selector_inputsA SELECT
  
			c_sel <= '1' WHEN "0011" | "0111" | "1100" | "1101" | "1110" | "1111",
				      '0' WHEN OTHERS;
 				
  WITH selector_inputsA SELECT
  
			d_sel <= '1' WHEN "0000" | "0001" | "0010" | "0011" | "0100" | "0111" | "1000" | "1010" | "1100" | "1101" | "1110" | "1111",
				      '0' WHEN OTHERS;
  				
  WITH selector_inputsA SELECT
  
			e_sel <= '1' WHEN "0000" | "0001" | "0010" | "0011" | "0100" | "0110" | "0111" | "1000" | "1010" | "1011" | "1100" | "1101" | "1110" | "1111",
				      '0' WHEN OTHERS;
  				
  WITH selector_inputsA SELECT
  
			f_sel <= '1' WHEN "0001" | "0010" | "0011" | "0110" | "0111" | "1000" | "1010" | "1011" | "1100" | "1101" | "1110" | "1111",
				      '0' WHEN OTHERS;
  				
  WITH selector_inputsA SELECT
  
			g_sel <= '1' WHEN "0001" | "0010" | "0101" | "1000" | "1010" | "1100" | "1101" | "1110" | "1111",
				      '0' WHEN OTHERS;
			
  
END pepe;