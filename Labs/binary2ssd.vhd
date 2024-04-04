LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;            
USE ieee.std_logic_unsigned.all;

ENTITY binary2ssd IS 
    Port (
			InPUTS      : in  STD_LOGIC_VECTOR(7 DownTo 0);
			outputs     : out STD_LOGIC_VECTOR(6 DownTo 0)
);		  
END binary2ssd;

Architecture BEN of binary2ssd is
	
	constant NUM_0: std_logic_vector(6 DownTo 0) :="1000000"; 
	constant NUM_1: std_logic_vector(6 DownTo 0) :="1111001"; 
	constant NUM_2: std_logic_vector(6 DownTo 0) :="0100100";
	constant NUM_3: std_logic_vector(6 DownTo 0) :="0110000";
	constant NUM_4: std_logic_vector(6 DownTo 0) :="0011001";
	constant NUM_5: std_logic_vector(6 DownTo 0) :="0010010";
	constant NUM_6: std_logic_vector(6 DownTo 0) :="0000010";
	constant NUM_7: std_logic_vector(6 DownTo 0) :="1111000";
	constant NUM_8: std_logic_vector(6 DownTo 0) :="0000000";
	constant NUM_9: std_logic_vector(6 DownTo 0) :="0011000";
	
	TYPE ssd_array_type IS ARRAY (0 TO 9) OF std_logic_vector(6 DownTo 0);
	CONSTANT ssd_array_c : ssd_array_type := (NUM_0, NUM_1, NUM_2, NUM_3, 
	NUM_4, NUM_5, NUM_6, NUM_7, NUM_8, NUM_9);

BEGIN
	ones_dig     <= unsigned(InPUTS) rem 10;
	tens_dig     <= (unsigned(InPUTS) rem 100) / 10 ;
	hundreds_dig <= unsigned(InPUTS) / 100;
	
	HEX0 <= ssd_array_c(to_integer(ones_dig));
	HEX1 <= ssd_array_c(to_integer(tens_dig));
	HEX2 <= ssd_array_c(to_integer(hundreds_dig));
   
END BEN; 

