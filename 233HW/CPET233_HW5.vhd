-------------------------------------------------------------------------------
-- Hector Garcia
-- Lecture HW 5
-------------------------------------------------------------------------------
 -- Libraries 
library ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity Absolute is

  port (
    In_num       : in  std_logic_vector(7 DownTo 0); 
	 out_num      : out std_logic_vector(7 DownTo 0);
    N            : out std_logic
  );  
END Absolute;  

architecture English of Absolute is 

	SIGNAL SignedIn : signed(7 downto 0);

BEGIN 
	SignedIn <= SIGNED(In_num);
   process (SignedIn)  is
      begin	
         case In_num(7) IS 
            WHEN '1' => out_num <= not(In_num) + "00000001";
		                               N       <= '1';
            WHEN OTHERS            => out_num <= In_num;
				                         N       <= '0';
		END case;
	ENd Process;
END English;