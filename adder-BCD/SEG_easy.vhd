Library ieee;
USE ieee.std_logic_1164.all;
ENTITY SEG_easy IS
PORT (W,X,Y,Z: IN STD_LOGIC;
		a,b,c,d,e,f,g : OUT STD_LOGIC);
END SEG_easy;

ARCHITECTURE LogicFunc OF SEG_easy IS
BEGIN
a <= (not W and not X and not Y and Z) or (X and not Y and not Z) or (W and not X and Y and Z) or (W and X and not Y);
b <=(not W and X and not Y and Z) or (X and Y and not Z) or (W and Y and Z) or (W and X and not Z);
c <= (not W and not X and Y and not Z) or (W and X and not Z) or (W and X and Y);
d <=  (not X and not Y and Z) or (not W and X and not Y and not Z) or (X and Y and Z) or (W and not X and Y and not Z);
e <= (not W and Z) or (not W and X and not Y) or (Z and not X and not Y);
f <=  (not W and not X and Z) or (not W and not X and Y) or (not W and Y and Z) or (W and X and not Y);
g <=  (not W and not X and not Y) or (not W and X and Y and Z);
END LogicFunc;


