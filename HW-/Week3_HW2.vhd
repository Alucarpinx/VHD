-------------------------------------------------------------------------------
-- Hector Garcia
-- HW_2 
-------------------------------------------------------------------------------
 
 -- Libraries 
library ieee;
USE ieee.std_logic_1164.all;

entity home is
  port (
    A1, A0, B1, B0 : in  std_logic; 
    GT          : out std_logic
  );  
end home;  

architecture status of home  is

signal inputsA : std_logic_vector(1 downto 0) := "00"; 
signal inputsB : std_logic_vector(1 downto 0) := "00"; 

begin

   inputsA <= A1 & A0;
   inputsB <= B1 & B0;
  
   ben10: process (inputsA, inputsB, A1, A0, B1, B0) is 
   begin 
      GT <= '0';
		if inputsA > inputsB then
		  GT <= '1';
		else
	     GT <= '0';
      end if;	 
	end process ben10;	
		
end status;
