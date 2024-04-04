Library ieee;

USE IEEE.STD_LOGIC_1164.ALL;

USE IEEE.NUMERIC_STD.ALL;

entity Calc_Lab is
  port (
    A, B   : in  std_logic_vector(3 DownTo 0);
    OP     : in  std_logic_vector(1 DownTo 0); 
    R      : out std_logic_vector(7 DownTo 0)
  );  
end Calc_Lab;  

architecture Functionality of Calc_Lab is
 
signal A_signed, B_signed: signed(3 DownTo 0);


begin
	A_signed <= signed(A);
	B_signed <= signed(B);
	
  
   case_proc: process (A_signed, B_signed, OP) is 
   begin 
      case OP is 
	    when "00"   => R <= std_logic_vector((A_signed(3) & A_signed(3) & A_signed(3) & A_signed(3) & A_signed) + (B_signed)); 
		 when "01"   => R <= std_logic_vector((A_signed(3) & A_signed(3) & A_signed(3) & A_signed(3) & A_signed) - (B_signed));
		 when "10"   => R <= std_logic_vector(A_signed * B_signed);	
		 when others => R <= std_logic_vector((A_signed(3) & A_signed(3) & A_signed(3) & A_signed(3) & A_signed) / (B_signed));
	  end case;
   end process;	  
		
end Functionality;
  

