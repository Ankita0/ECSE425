LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_signed.all;

ENTITY IF_mux IS
PORT(
PC_instr_from_EX: IN STD_LOGIC_VECTOR(31 downto 0);
PC_instr_plus4: IN STD_LOGIC_VECTOR(31 downto 0);
mux_control, CLK: IN STD_LOGIC;
PC_instr_to_fetch: OUT STD_LOGIC_VECTOR(31 downto 0)
);
END IF_mux;

ARCHITECTURE behaviour OF IF_mux IS
BEGIN

--Clock synchronized check for mux output as per mux_control input (0/1)
next_or_same: PROCESS (CLK, mux_control, PC_instr_from_EX, PC_instr_plus4)
BEGIN
	--Mux selects pipline dictated instruction count if mux_contol==1
	IF (rising_edge(CLK) AND mux_control= '1') THEN
		PC_instr_to_fetch <= PC_instr_from_EX;

	--Mux selects next program instruction count if mux_contol==0
	ELSIF (rising_edge(CLK) AND mux_control= '0') THEN
		PC_instr_to_fetch <= PC_instr_plus4;
	END IF;

END PROCESS next_or_same;
END behaviour;