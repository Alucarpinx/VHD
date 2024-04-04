library ieee;
USE ieee.std_logic_1164.all;
USe ieee.numeric_std.all;
USe ieee.std_logic_unsigned.all;

entity WashMachine is

  PORT(
			timer             : in  std_logic_vector(3 DownTo 0);
			start             : in  std_logic;
			empty             : in  std_logic;
			full					: in  std_logic;
			CLK, reset_n      : in  std_logic;
			FILL_VALVE        : out std_logic;
			EMPTY_VALVE       : out std_logic;
			DRUM_MOTOR        : out std_logic	
  );  
END WashMachine;  

ARCHITECTURE MAKEUP of WashMachine is 

	TYPE   state_type IS (IDLE, FILL, AGITATE, DRAIN, RINSE, SPIN);
	SIGNAL current_state, next_state : state_type;
	SIGNAL TIMERKEEP : std_logic_vector(3 downto 0);

BEGIN
	
	PROCESS(CLK, reset_n)
	BEGIN 
		If (reset_n = '0') THEN
	     current_state <= IDLE;
		elsif (rising_edge(CLk)) THEN
		  current_state <= next_state;
		END IF;
	END PROCESS;
	BUNGIE:PROCESS(current_state, start, empty, full)
	BEGIN 
	CASE (current_state) IS 
		WHEN IDLE    => 
			IF (START = '0') THEN 
				next_state <= IDLE;
				FILL_VALVE   <= '0';
				DRUM_MOTOR   <= '0';
				EMPTY_VALVE  <= '0';
			ELSE
				next_state <= FILL;
				TIMERKEEP <= "0000";
			END IF;
		WHEN FILL    =>
			IF (FULL = '0') THEN 
				next_state <= FILL;
				FILL_VALVE   <= '1';
				DRUM_MOTOR   <= '0';
				EMPTY_VALVE  <= '0';
			ELSE
				next_state <= AGITATE;
				TIMERKEEP <= "0000";
			END IF;
		WHEN AGITATE =>
			IF (TIMER /= "0111") THEN 
				next_state <= AGITATE;
				FILL_VALVE   <= '0';
				DRUM_MOTOR   <= '1';
				EMPTY_VALVE  <= '0';
			ELSE
				next_state <= DRAIN;
				TIMERKEEP <= "0000";
			END IF;
		WHEN DRAIN   =>
			IF (EMPTY = '0') THEN 
				next_state <= DRAIN;
				FILL_VALVE   <= '0';
				DRUM_MOTOR   <= '0';
				EMPTY_VALVE  <= '1';
			ELSE
				next_state <= RINSE;
				TIMERKEEP <= "0000";
			END IF;
		WHEN RINSE   =>
			IF (FULL = '0') THEN 
				next_state <= RINSE;
				FILL_VALVE   <= '1';
				DRUM_MOTOR   <= '0';
				EMPTY_VALVE  <= '0';
			ELSE
				next_state <= SPIN;
				TIMERKEEP <= "0000";
			END IF;
		WHEN SPIN    =>
			IF ((TIMER = "1010") AND (EMPTY = '1')) THEN 
				next_state <= IDLE;
			ELSE
				next_state <= SPIN;
				TIMERKEEP <= "0000";
				FILL_VALVE   <= '0';
				DRUM_MOTOR   <= '1';
				EMPTY_VALVE  <= '1';
			END IF;
		WHEN OTHERS => 
				next_state <= IDLE;
	END CASE;
	END PROCESS;
END MAKEUP;
