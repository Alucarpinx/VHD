LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;            
USE ieee.std_logic_unsigned.all;

ENTITY CPET233LAB7 IS 
    Port ( AA, BB                       : in  STD_LOGIC_VECTOR(3 downto 0);     	
			  OP                          : in STD_LOGIC_VECTOR(1 downto 0);
			  HEX0T, HEX1T, HEX2T, HEX3T   : out STD_LOGIC_VECTOR(6 downto 0));		  
END CPET233LAB7;
 
ARCHITECTURE STRUCTURE OF CPET233LAB7 IS

	signal In_NUM      : STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL Bsig, Asig  : signed(3 downto 0);
	
	COMPONENT Calc_LabBB IS
		Port ( A, B    : in   STD_LOGIC_VECTOR(3 downto 0);     
				 OP      : in   STD_LOGIC_VECTOR(1 downto 0);      
				 R       : out STD_LOGIC_VECTOR(7 downto 0)
				 );
	END COMPONENT;
	COMPONENT LAB6BB IS
		Port ( innit                     : 		 in   STD_LOGIC_VECTOR(7 downto 0);                  
				 HEX0, HEX1, HEX2, HEX3    : 	    out  STD_LOGIC_VECTOR(6 downto 0)
				 );     
	END COMPONENT;
	
BEGIN
	Asig <= SIGNED (AA);
	Bsig <= SIGNED (BB);
	
	U1: calc_LabBB
		PORT MAP(A => AA,
					B => BB,  
					OP => OP,   
			      R => In_NUM
					);
	U2: LAB6BB
		PORT MAP(innit => In_NUM,
					HEX0 => HEX0T,
					HEX1 => HEX1T,
					HEX2 => HEX2T,
					HEX3 => HEX3T
					);
					
end STRUCTURE;
