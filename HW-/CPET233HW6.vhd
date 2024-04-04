library ieee;
USE ieee.std_logic_1164.all;
USe ieee.numeric_std.all;
USe ieee.std_logic_unsigned.all;

entity barley is

  PORT(
    innit            : in  std_logic_vector(7 DownTo 0); 
    outpitA, outpitB  : out std_logic_vector(6 DownTo 0)
	 
  );  
END barley;  

ARCHITECTURE BANK of barley is 

SIGNAL A : STD_LOGIC_VECTOr(3 DownTo 0); 
SIGNAL B : STD_LOGIC_VECTOR(3 DownTo 0); 

COMPONENT Mankey 
	PORT(
	  W, X, Y, Z  : in  std_logic;
     outputs     : out std_logic_vector(6 DownTo 0)
	);
END COMPONENT;
 
BEGIN
	U1: Mankey PORT MAP ( W       => innit(3),
								 X       => innit(2),
								 Y       => innit(1),
								 Z       => innit(0),
								 outputs => outpitA
	);
	
	U2: Mankey PORT MAP ( W       => innit(7),
								 X       => innit(6),
								 Y       => innit(5),
								 Z       => innit(4),
								 outputs => outpitB
	
	);
END;
