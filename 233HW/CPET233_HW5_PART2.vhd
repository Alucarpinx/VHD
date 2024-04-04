-------------------------------------------------------------------------------
-- Hector Garcia
-- Lecture HW 5
-------------------------------------------------------------------------------
 -- Libraries 
library ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

ENTITY hw5q2 IS

Port ( a, b : in STD_LOGIC_VECTOR(7 downto 0); --A, B input
		a_s : in STD_LOGIC; --a_s input
		sum : out STD_LOGIC_VECTOR(8 downto 0)
		);
END hw5q2;  

ARCHITECTURE model OF hw5q2 IS

	SIGNAL a_sig, b_sig: signed(7 downto 0);

BEGIN
	a_sig <= SIGNED (a);
	b_sig <= SIGNED (b);
	case_prc: process(a_s, a_sig, b_sig)
	BEGIN
		case a_s IS
			WHEN '0' => sum<= STD_LOGIC_VECTOR( (a_sig(7) & a_sig) + (b_sig) );
			WHEN OTHERS => sum <= STD_LOGIC_VECTOR( (a_sig(7) & a_sig) - (b_sig) );
		
		end case;
	end process;
end model;