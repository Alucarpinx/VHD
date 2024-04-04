library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

ENTITY LAB6BB IS 
	PORT(
			innit                  : in STD_LOGIC_VECTOR(7 DownTo 0);
			HEX0, HEX1, HEX2, HEX3 : out STD_LOGIC_VECTOR(6 DownTo 0)
);
END LAB6BB;
ARCHITECTURE mandy OF LAB6BB IS 

COMPONENT IsNegBB   
	PORT(
			InNum      : in  STD_LOGIC_VECTOR(7 DownTo 0);
			OutNum     : out STD_LOGIC_VECTOR(6 DownTo 0)
	);
END COMPONENT;
COMPONENT ABS_NumBB   
	PORT(
			In_Num      : in  STD_LOGIC_VECTOR(7 DownTo 0);
			Out_Num     : out STD_LOGIC_VECTOR(7 DownTo 0)
	
);
END COMPONENT;
COMPONENT ToDisplayHunBB   
	PORT(
			InPUTS      : in  STD_LOGIC_VECTOR(7 DownTo 0);
			outputs     : out STD_LOGIC_VECTOR(6 DownTo 0)
);
END COMPONENT;
	SIGNAL Hundreds, Tens, Ones : unsigned(7 downto 0); 
   SIGNAL BEAN                 : STD_LOGIC_VECTOR(7 DownTo 0);
	SIGNAL HunUn                : STD_LOGIC_VECTOR(7 DownTo 0);
	SIGNAL TenUn                : STD_LOGIC_VECTOR(7 DownTo 0);
	SIGNAL OneUn                : STD_LOGIC_VECTOR(7 DownTo 0);
	
	
BEGIN 
   
	Ones     <= unsigned(BEAN) rem 10;
	Tens     <= (unsigned(BEAN) rem 100) / 10 ;
	Hundreds <= unsigned(BEAN) / 100;
	
	HunUn  <=  STD_LOGIC_VEctor(Hundreds);
	TenUn  <=  STD_LOGIC_VECTOR(Tens);
	OneUn  <=  STD_LOGIC_VECTOR(Ones);
	
U1: IsNegBB PORT MAp (
							InNum    => innit,
							OutNum   => HEX3
);

U2: ABS_NumBB PORT MAP (
							 In_Num  => innit,
							 Out_Num => BEAN
);

U3: ToDisplayHunBB PORT MAP (
							InPUTS  => HunUn,
							outputs => HEX2
);
U4: ToDisplayHunBB PORT MAP (
							InPUTS  => TenUn,
							outputs => HEX1
);
U5: ToDisplayHunBB PORT MAP (
							InPUTS  => OneUn,
							outputs => HEX0
);
END;    