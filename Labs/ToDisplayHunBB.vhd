library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

ENTITY ToDisplayHunBB is
	PORT(
			InPUTS      : in  STD_LOGIC_VECTOR(7 DownTo 0);
			outputs     : out STD_LOGIC_VECTOR(6 DownTo 0)
);
END ToDisplayHunBB;
Architecture Danny of ToDisplayHunBB is
	
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
	constant BLANk: std_logic_vector(6 DownTo 0) :="1111111"; 

	
BEGIN
	
   process (InPUTS) is
   begin 
      case InPUTS is 
				 when "00000000"=> outputs <= NUM_0; -- display '0'
             when "00000001"=> outputs <= NUM_1; -- display '1'
             when "00000010"=> outputs <= NUM_2; -- display '2'
             when "00000011"=> outputs <= NUM_3; -- display '3'
             when "00000100"=> outputs <= NUM_4; -- display '4' 
             when "00000101"=> outputs <= NUM_5; -- display '5'
             when "00000110"=> outputs <= NUM_6; -- display '6'
             when "00000111"=> outputs <= NUM_7; -- display '7'
             when "00001000"=> outputs <= NUM_8; -- display '8'
             when "00001001"=> outputs <= NUM_9; -- display '9'
             when others => outputs <= BLANK; -- if inputs differ no output 
	  end case;
   end process;	  
END Danny; 

