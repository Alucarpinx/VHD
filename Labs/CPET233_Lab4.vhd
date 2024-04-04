-- Hector Garcia
-- LAB4
-------------------------------------------------------------------------------
 -- Libraries 
library ieee;
USE ieee.std_logic_1164.all;
USe ieee.numeric_std.all;
USe ieee.std_logic_unsigned.all;

entity Mankey is

  port (
    W, X, Y, Z  : in  std_logic; 
    outputs  : out std_logic_vector(6 DownTo 0); -- Initializes outputs
	 outputsB  : out std_logic_vector(6 DownTo 0) -- Initializes outputs
  );  
END Mankey;  

architecture bangels of Mankey is 

signal inputs : std_logic_vector(3 downto 0) := "0000";
begin

   inputs <= W & X & Y & Z; 

   case_proc: process (inputs , W, X, Y, Z) is 
   begin 
      case inputs is 
		   when	"0000" => outputs <= "0011000";
		   when	"0001" => outputs <= "1111001";
			when	"0010" => outputs <= "1111000";
			when	"0011" => outputs <= "0111111";
			when	"0100" => outputs <= "0011001";
			when	"0101" => outputs <= "1000000";
			when	"0110" => outputs <= "0110000";
			when	"0111" => outputs <= "0111111";
			when	"1000" => outputs <= "1111000";
			when	"1001" => outputs <= "0000010";
			when	"1010" => outputs <= "1111001";
			when	"1011" => outputs <= "0110000";
			when	"1100" => outputs <= "1111111";
			when	"1101" => outputs <= "1111111";
			when	"1110" => outputs <= "1111111";
			when	"1111" => outputs <= "1111111";
				when others  => outputs <= "1111111" ;
			
	  end case;
   end process;
	if_proc: process (inputs , W, X, Y, Z) is 
		begin 
			if (inputs = "0000") then 
			  outputsB <= "0011000"; 
		  elsif (inputs = "0001") then 
			  outputsB <= "1111001"; 
		  elsif (inputs = "0010") then 
			  outputsB <= "1111000";
		  elsif (inputs = "0011") then 
			  outputsB <= "0111111"; 
			  
		  elsif (inputs = "0100") then 
			  outputsB <= "0011001"; 
		  elsif (inputs = "0101") then 
			  outputsB <= "1000000"; 
		  elsif (inputs = "0110") then 
			  outputsB <= "0110000"; 
		  elsif (inputs = "0111") then 
			  outputsB <= "0111111";
			  
		  elsif (inputs = "1000") then 
			  outputsB <= "1111000"; 
		  elsif (inputs = "1001") then 
			  outputsB <= "0000010"; 
		  elsif (inputs = "1010") then 
			  outputsB <= "1111001"; 
		  elsif (inputs = "1011") then 
			  outputsB <= "0110000";
			 
		  elsif (inputs = "1100") then 
			  outputsB <= "1111111"; 
		  elsif (inputs = "1101") then 
			  outputsB <= "1111111"; 
		  elsif (inputs = "1110") then 
			  outputsB <= "1111111"; 
		  elsif (inputs = "1111") then 
			  outputsB <= "1111111";
		  else
			  outputsB <= "1111111"; 
		  end if;	  
		end process;	
		
end bangels; 
		