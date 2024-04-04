-------------------------------------------------------------------------------
-- Hector Garcia
-- HW_2 
-------------------------------------------------------------------------------
 
 -- Libraries 
library ieee;
USE ieee.std_logic_1164.all;

entity beans is
  port (
    A1, A0, B1, B0 : in  std_logic; 
    GT          : out std_logic
  );  
END beans;  

--architecture status of beans  is
--  BEGIN
--  GT <= (A1 AND NOT B1) OR (A0 AND NOT B1 AND NOT B0) OR (A1 AND A0 AND B1 AND NOT B0);

--END status;
architecture quartus of beans  is
  BEGIN
  GT <= (NOT A1 AND (NOT B1 AND (A0 AND NOT B0))) OR (A1 AND ((NOT B1) OR ((A0 AND NOT B0))));
END quartus;
