LIBRARY ieee ;
 USE ieee.std_logic_1164.all ;
PACKAGE SEG_easy_package IS 
	COMPONENT SEG_easy IS
		PORT (W,X,Y,Z: IN STD_LOGIC;
		a,b,c,d,e,f,g : OUT STD_LOGIC);
	END COMPONENT ; 
END SEG_easy_package ;