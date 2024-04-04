-------------------------------------------------------------------------------
-- Hector Garcia
-- HW_2 
-------------------------------------------------------------------------------
 
 -- Libraries 
library ieee;
USE ieee.std_logic_1164.all;

entity circuit is
  port (
    A, S, B : in  std_logic; 
    Y          : out std_logic
  );  
END circuit;  
--architecture pepe of circuit  is
--  BEGIN
--  Y <= (A AND NOT S) OR (S AND B);
--END pepe;

architecture LOLA of circuit  is
signal and1 : STD_LOGIC := '0'; 
signal and2 : STD_LOGIC := '0'; 
  BEGIN
  and2 <= S AND B;
  Y <= and1 OR and2;
  and1 <= A AND NOT S;
END LOLA;