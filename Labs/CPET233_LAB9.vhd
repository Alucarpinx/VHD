LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;            
USE ieee.std_logic_unsigned.all;

ENTITY CPET233_LAB9 is
Port(
		S                                   : in std_logic;
		Clk0                                : in std_logic;
		Reset_n                             : in std_logic;
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5  : out std_logic_vector(6 DownTo 0);

);

ARCHITECTURE rex of CPET233_LAB9 is


Component mux is 
	      ( SB            : in std_logic;
			  max_value		 : out std_logic_vector(19 DownTo 0)
		    );
END Component; 

Component delay_unit is 
	      ( max_valueB : std_logic_vector(19 DownTo 0);
			  clk1       : std_logic;
			  reset_nA   : std_logic;
			  flag       : std_logic
		    );			
END Component; 

Component shifter is 
	      ( enable     : std_logic_vector(19 DownTo 0);
			  clk2       : std_logic;
			  reset_nB   : std_logic
			 );	
END Component; 

SIGNAL andX    :  std_logic;
SIGNAL ANNIE   :  std_logic_vector(19 DownTo 0);

BEGIN 
	U1 : mux 
	     PORT MAP (
		     SB            => S,
			  max_value		 => andX 
		  );
	
	U2 : delay_unit
	     PORT MAP (
		     max_valueB    => andX,
			  clk1          => clk0,
			  reset_nA      => reset_n,
			  flag          => ANNIE
		  );
	U3 ; shifter 
        PORT MAP (
		     enable        => ANNIE,
			  clk2          => clk,      
			  reset_nB      => reset_n
		  );
		  
	

END;



