LIBRARY ieee ; 
USE ieee.std_logic_1164.all ;
USE work.fulladd_package.all;
USE work.SEG_easy_package.all;

ENTITY BCD IS 
PORT ( 
		
	
		A:in std_logic_vector(3 downto 0);
		B:in std_logic_vector(3 downto 0);
		
		Seg:out std_logic_vector(13 downto 0);
		CY:Out std_logic
		
		);
		
		
END BCD ;

ARCHITECTURE Structure OF BCD IS 

	SIGNAL C:std_logic_vector(3 downto 0);
	SIGNAL C1:std_logic_vector(3 downto 0);
	SIGNAL S:std_logic_vector(3 downto 0);
	SIGNAL SUM:std_logic_vector(7 downto 0);
	SIGNAL SIX:std_logic_vector(3 downto 0);
	SIGNAL CY1,TEMP:std_logic;

	BEGIN

	stage0: fulladd PORT MAP  ( '0',A(0),B(0),S(0),C(1) );
	stage1: fulladd PORT MAP  ( C(1),A(1),B(1),S(1),C(2) );
	stage2: fulladd PORT MAP  ( C(2),A(2),B(2),S(2),C(3) );
	stage3: fulladd PORT MAP  ( C(3),A(3),B(3),S(3),CY1 );
	TEMP<= CY1 or ( S(3) and S(2) ) or ( S(3) and S(1) );
	SIX<= ('0'&TEMP&TEMP&'0');
	
	stage4: fulladd PORT MAP  ( '0',S(0),SIX(0),SUM(0),C1(0) );
	stage5: fulladd PORT MAP  ( C1(0),S(1),SIX(1),SUM(1),C1(1) );
	stage6: fulladd PORT MAP  ( C1(1),S(2),SIX(2),SUM(2),C1(2) );
	stage7: fulladd PORT MAP  ( C1(2),S(3),SIX(3),SUM(3),SUM(4));
	
	stage8:SEG_easy PORT MAP ( SUM(3),SUM(2),SUM(1),SUM(0),Seg(0),Seg(1),Seg(2),Seg(3),Seg(4),Seg(5),Seg(6) );
	stage9:SEG_easy PORT MAP (SUM(7),SUM(6),SUM(5),TEMP,Seg(7),Seg(8),Seg(9),Seg(10),Seg(11),Seg(12),Seg(13));
	

END Structure ;