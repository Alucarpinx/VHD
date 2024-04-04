LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;            
USE ieee.std_logic_unsigned.all;

ENTITY CPET233LAB8 IS 
    Port ( time_                        : in  STD_LOGIC_VECTOR(9 downto 0);
			  setn                         : in  STD_LOGIC_VECTOR(9 downto 0);
			  S		                 	    : in  STD_LOGIC_VECTOR(1 downto 0);
			  clk                          : in  STD_LOGIC; 
			  reset_n                      : in  STD_LOGIC; 
			  HEX0F, HEX1F, HEX2F          : out STD_LOGIC_VECTOR(6 downto 0)
);		  
END CPET233LAB8;
 
ARCHITECTURE MAKEUP OF CPET233LAB8 IS

	signal countT       : unsigned(7 downto 0);
	SIGNAL s            : unsigned(9 downto 0);
	signal beaner       : 
	
	constant ns = 100ns;
	constant ms = 100ms:
	COMPONENT delay_unit IS
		Port ( clkT           : in   STD_LOGIC;     
				 max_value      : in   STD_LOGIC_VECTOR(9 downto 0);   
		       reset          : in   STD_LOGIC;  		 
				 flag           : out STD_LOGIC
				 );
	END COMPONENT;
	COMPONENT counter IS
		Port ( set_n                     : 		 in   STD_LOGIC_VECTOR(9 downto 0);   
				 clkTT                     :      in   STD_LOGIC;  
				 timer                     :      in   std_logic_vector(9 DownTo 0); 
				 enable                    :      in   std_logic; 
				 resetn                    :      in   STD_LOGIC; 
				 count                     : 	    out  STD_LOGIC_VECTOR(9 downto 0)
				 );     
	END COMPONENT;
	COMPONENT binary2ssd IS
		Port ( in_num                   : 		 in   STD_LOGIC_VECTOR(7 downto 0);                  
				 HEX0, HEX1, HEX2         : 	    out  STD_LOGIC_VECTOR(6 downto 0)
				 );     
	END COMPONENT;
BEGIN
	process (s) is
   begin 
      case s is 
				 when '1'  => max_value <= ms; 
             when '0'  => max_value <= ns; 
             when others => max_value <= ns; 
	  end case;
   end process;	  
	
	U1: delay_unit
		PORT MAP(reset   => reset_n,
					max_value => s,  
					clkT      => clk,   
			      flag      => beaner,
					);
	U2: counter
		PORT MAP(resetn => reset_n
					set_n  => setn
					timer  => time_
					enable => beaner
					clkTT  => clk
					count  => countT
					);
					
	U3: binary2ssd
		PORT MAP(in_num => countT,
					HEX0   => HEX0F,
					HEX1   => HEX1F,
					HEX2   => HEX2F
					);				
end MAKEUP;