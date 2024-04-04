--*****************************************************************************
--***************************  VHDL Source Code  ******************************
--*****************************************************************************
--
--  DESIGNER NAME:  Hector Gacia
--
--       LAB NAME:  HomeWork #3
--
--      FILE NAME:  Homework#3HexDisplayer_tb.vhd
--
--   DATE CREATED: 9/15/22
--
-------------------------------------------------------------------------------
--
--  DESCRIPTION
--
--  display the hex equivalent of the input
--
--
-------------------------------------------------------------------------------
--
--  REVISION HISTORY
--
--  _______________________________________________________________________
-- |  DATE    | USER | Ver |  Description                                  |
-- |==========+======+=====+================================================
-- |          |      |     |
-- | 9/15/22  | HG   | 1.0 | Created
-- |          |      |     |
--
--*****************************************************************************
--*****************************************************************************

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;           -- need for to_unsigned

ENTITY hex_displayer_tb IS     --this is the test bench entity.
END ENTITY hex_displayer_tb;   --It has a different name than the module you are testing

ARCHITECTURE test OF hex_displayer_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Mankey      --the component name must match your lab4 entity name
        PORT (
            x           : IN  std_logic;  --these port names must match your
            y           : IN  std_logic;  --entity port names exactly
            z           : IN  std_logic;
            w           : IN  std_logic;
            ----------------------------  
            output_case    : OUT std_logic_vector(6 downto 0); 
            output_if      : OUT std_logic_vector(6 downto 0)            
            ); 
    END COMPONENT;


    --Inputs
    SIGNAL inputs : std_logic_vector(3 DOWNTO 0);       --this vector will drive the inputs

    --Outputs
    SIGNAL output_case_tb : std_logic_vector(6 downto 0); 
    SIGNAL output_if_tb   : std_logic_vector(6 downto 0);
    
BEGIN
    -- Instantiate the Unit Under Test (UUT)
	 -- on left of => are the names of your component's ports above
	 -- on the right of => are the signals that they map to
    uut : Mankey PORT MAP(

        w           => inputs(3),       
        x           => inputs(2),
        y           => inputs(1),
        z           => inputs(0),
       
        --
  
        output_case   => output_case_tb,
        output_if     => output_if_tb
        );


    ---------------------------------------------------------------------------
    -- NAME: Stimulus
    --
    -- DESCRIPTION:
    --    This process will apply the  stimulus to the UUT
    ---------------------------------------------------------------------------
    stimulus : PROCESS
    BEGIN
        FOR i IN 0 TO 15 LOOP -- will result in 16 cycles--
            inputs <= std_logic_vector(to_unsigned(i,4));
            WAIT FOR 10 ns; -- time between cycles or runs--
        END LOOP;

        -----------------------------------------------------------------------
        -- needed to prevent the PROCESS
        -- sequence from restarting.
        -----------------------------------------------------------------------
        WAIT;
        
    END PROCESS stimulus;

END ARCHITECTURE test;
