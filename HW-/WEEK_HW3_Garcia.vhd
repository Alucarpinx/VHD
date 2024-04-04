-------------------------------------------------------------------------------
-- Hector Garcia
-- HW_3
-------------------------------------------------------------------------------
 -- Libraries 
library ieee;
USE ieee.std_logic_1164.all;
USe ieee.numeric_std.all;
USe ieee.std_logic_unsigned.all;

entity Mankey is

  port (
    W, X, Y, Z  : in  std_logic; -- Initializes inputs 
    outputs  : out std_logic_vector(6 DownTo 0) -- Initializes outputs
	 
  );  
END Mankey;  

architecture bangels of Mankey is 


   --Constants for the sixteen inputs--with respective combinational output
	
	constant hex_0: std_logic_vector(6 DownTo 0) :="0000001"; 
	constant hex_1: std_logic_vector(6 DownTo 0) :="1001111"; 
	constant hex_2: std_logic_vector(6 DownTo 0) :="0010010";
	constant hex_3: std_logic_vector(6 DownTo 0) :="0000110";
	constant hex_4: std_logic_vector(6 DownTo 0) :="1001100";
	constant hex_5: std_logic_vector(6 DownTo 0) :="0100100";
	constant hex_6: std_logic_vector(6 DownTo 0) :="0100000";
	constant hex_7: std_logic_vector(6 DownTo 0) :="0001111";
	constant hex_8: std_logic_vector(6 DownTo 0) :="0000000";
	constant hex_9: std_logic_vector(6 DownTo 0) :="0000100";
	constant hex_A: std_logic_vector(6 DownTo 0) :="0001000"; 
	constant hex_b: std_logic_vector(6 DownTo 0) :="1100000";
	constant hex_C: std_logic_vector(6 DownTo 0) :="0110001";
	constant hex_d: std_logic_vector(6 DownTo 0) :="1000010";
	constant hex_E: std_logic_vector(6 DownTo 0) :="0110000";
	constant hex_F: std_logic_vector(6 DownTo 0) :="0111000";
	
	signal inputs: std_logic_vector(3 DownTo 0) := "0000";
   --signal output: std_logic_vector(6 DownTo 0) := "0000000";--

BEGIN
	
   inputs <= W & X & Y & Z; -- concatenates W, X, Y, Y
 
	
   process (inputs) is
   begin 
      case inputs is 
				 when "0000"=> outputs <= hex_0; -- display '0'
             when "0001"=> outputs <= hex_1; -- display '1'
             when "0010"=> outputs <= hex_2; -- display '2'
             when "0011"=> outputs <= hex_3; -- display '3'
             when "0100"=> outputs <= hex_4; -- display '4' 
             when "0101"=> outputs <= hex_5; -- display '5'
             when "0110"=> outputs <= hex_6; -- display '6'
             when "0111"=> outputs <= hex_7; -- display '7'
             when "1000"=> outputs <= hex_8; -- display '8'
             when "1001"=> outputs <= hex_9; -- display '9'
             when "1010"=> outputs <= hex_A; -- display 'A'
             when "1011"=> outputs <= hex_b; -- display 'b'
             when "1100"=> outputs <= hex_C; -- display 'C'
             when "1101"=> outputs <= hex_d; -- display 'd'
             when "1110"=> outputs <= hex_E; -- display 'E'
             when "1111"=> outputs <= hex_F; -- display 'F'
             when others =>  NULL; -- if inputs differ no output 
	  end case;
   end process;	  
END bangels; 