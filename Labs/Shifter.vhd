LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;            
USE ieee.std_logic_unsigned.all;

ENTITY shift_reg is
port (
		clk 						: in std_logic;
		reset_n 					: in std_logic;
		serial_in 				: in std_logic;
		Load 						: in std_logic;
		Parallel_in 			: in std_logic_vector(7 downto 0);
		Parallel_out 			: out std_logic_vector(7 downto 0)
);
END shift_reg; 

Architecture ben10 of shift_reg is 

signal shift : std_logic_vector(7 downto 0);

BEGIN 
		shifter: process(clk,reset_n)
			begin
			if (reset_n = '0') then
				shift <= (others => '0');
				elsif 
					(clk'event and clk = '1') then
			if (load = ‘1’) then
				shift <= parallel_in;
				else
					shift(7 downto 1) <= shift(6 downto 0);
					shift(0) <= serial_in;
			end if; --load
			end if; --clk
 			end process;
		Parallel_out <= shift;
END;