LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_signed.all;

ENTITY PC_instruction_counter IS
PORT(
	PC_IN : IN INTEGER;
	INIT : IN STD_LOGIC;
	PC_OUT : OUT INTEGER
);
END PC_instruction_counter;

ARCHITECTURE arch OF PC_instruction_counter IS

BEGIN

--process for updating program counter component. With reset
update_PC: PROCESS(INIT, PC_IN)
BEGIN
	--Reset to initialize PC
	IF (INIT 'event AND INIT='1') THEN
		PC_OUT<= 0;
	ELSIF (INIT ='0') THEN 
		if(PC_IN=0 OR PC_IN=-2147483648) then
		PC_OUT<= 0;
		else
		PC_OUT<= PC_IN;
		end if;
		ELSE 
		PC_OUT<= 0;
	END IF;
	
END PROCESS update_PC;
END arch;