Library ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_bit.all;

entity Synchronizer_edge_detect is	
	
    Port ( 
			  asynch_in       : in   std_logic;
			  synch_out       : out  std_logic;
			  falling_edg     : out  std_logic;
			  rising_edg      : out  std_logic;
			  clk             : in   STD_LOGIC;
			  reset_n         : in   std_logic
			  );
			  
end Synchronizer_edge_detect;

ARCHITECTURE ZIMBA of Synchronizer_edge_detect IS 
	SIGNAL IDK, IDK2, IDK3 : std_logic;
	BEGIN 
	
		process(clk, reset_n, IDK)
		
		begin
				if (reset_n = '0') then 			     
				 
					IDK   <= '0';
				
					IDK2  <= '0';
				
					IDK3  <= '0';
				
				elsif(clk'event and clk = '1') then
				
					IDK   <=  asynch_in;
					
					IDK2  <=  IDK;
					 
					IDK3  <=  IDK2;
					
				END IF;
				
				IF (IDK2 = '1' AND IDK3 = '0') THEN 
				
					rising_edg <= '1';
					
					else 
					
						rising_edg <= '0';
						
				END IF; 
					
				IF  (IDK2 = '0' AND IDK3 = '1') THEN 
				
					  falling_edg <= '1'; 
				
				ELSE 
						falling_edg <= '0';
						
				END IF;
				
		END PROCESS;
		
	synch_out <= IDK3;


END ZIMBA; 