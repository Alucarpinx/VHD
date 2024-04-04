library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

ENTITY ABS_NumBB is
	PORT(
			In_Num      : in  STD_LOGIC_VECTOR(7 DownTo 0);
			Out_Num     : out STD_LOGIC_VECTOR(7 DownTo 0)
		  
);
END ABS_NumBB;
Architecture English of ABS_NumBB is
	SIGNAL SignedIn : signed(7 DownTo 0);
BEGIN
	SignedIn <= SIGNED(In_Num);
	PROCESS (SignedIn) is
		BEGIN
			CASE In_Num(7) is
				WHEN '1' => Out_Num <= not(In_Num) + "00000001";
												
				WHEN OTHERS => Out_Num <= In_Num;
												
		END CASE;
   END PROCESS;
END English;