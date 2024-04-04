Library ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_bit.all;

entity UNI_SHIFT_REG is	
    Port ( Din             : in  STD_LOGIC_vector(15 DownTo 0);
			  serial_in       : in std_logic;
			  serial_out      : out std_logic;
			  sh_ld, rl       : in std_logic;
			  clk             : in  STD_LOGIC;
			  reset_n         : in std_logic
			  );
end UNI_SHIFT_REG;

architecture Behave of UNI_SHIFT_REG is

	SIGNAL Shift : std_logic_vector(15 DownTo 0);
	
BEGIN
	process(clk, reset_n, sh_ld, rl)
	begin
		if (reset_n = '0') then 
		
			shift <= (OTHERS => '0');
			
		elsif(clk'event and clk = '1') then
		
		
			if (sh_ld = '0') THEN 
		
				shift <= Din;
			
			ELSE 
			
				CASE (rl) IS 
				
					WHEN ('1') =>
				
						shift(14 DownTo 0) <= shift(15 DownTO 1);
					
						shift(15) <= serial_in;
				
					WHEN OTHERS =>
				
						shift(15 DownTo 1) <= shift(14 DownTO 0);
					
						shift(0) <= serial_in;
				
				END CASE;
			END IF;
		END IF;	
		end process;
	process(rl)
	BEGIN
		CASE (rl) IS 
	
			WHEN ('0') =>
		
				serial_out <= shift(15);
			
			WHEN OTHERS =>
	
				serial_out <= shift(0);
			
		END CASE;
	END PROCESS;
end Behave;

