library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

ENTITY IsNegBB is
	PORT(
			InNum      : in  STD_LOGIC_VECTOR(7 DownTo 0);
			OutNum     : out STD_LOGIC_VECTOR(6 DownTo 0)
);
END IsNegBB;
Architecture Korean of IsNegBB is
	SIGNAL SignedIn : signed(7 DownTo 0);
BEGIN
	SignedIn <= SIGNED(InNum);
	PROCESS (SignedIn) is
		BEGIN
			CASE InNum(7) is
				WHEN '1' => OutNum <= "0111111";
												
				WHEN OTHERS => OutNum <= "1111111";
												
		END CASE;
   END PROCESS;
END Korean;