library ieee;
use ieee.std_logic_1164.all;

entity FSM is 
PORT (w,reset,clock :in std_logic;
        s: out std_logic_vector(2 downto 0));
end FSM;

ARCHITECTURE Behavior OF FSM IS 
    TYPE State_type IS (Start, S1, S2a,S2b,S3,S4) ; 
    SIGNAL y_present, y_next : State_type ; 
	 SIGNAL temp :std_logic_vector(2 downto 0);
BEGIN 
    PROCESS ( w, y_present ) 
    BEGIN 
    if clock='1' then
		IF reset = '1' THEN 
           		y_next <= Start;
			temp<="000";
      END IF ; 
			
        CASE y_present IS 
            WHEN Start=> 
                IF w = '0' THEN 
                    y_next <= Start;
		    temp<="000";
                ELSE 
                    y_next <= S1 ;
		    temp<="001";
                END IF ; 
            WHEN S1 => 
                IF w = '0' THEN 
                    y_next <= S2a; 
		    temp<="010";
                ELSE 
                    y_next <= S2b ; 
		    temp<="011";
                END IF ;
            WHEN S2a=> 
                IF w = '0' THEN 
                    y_next <= S3;
		    temp<="100";
                ELSE 
                    y_next <= S3 ;
		    temp<="100";
                END IF ; 
            WHEN S2b => 
                IF w = '0' THEN 
                    y_next <= S3; 
		    temp<="100";
                ELSE 
                    y_next <= S3 ; 
		    temp<="100";
                END IF ;
            WHEN S3=> 
                IF w = '0' THEN 
                    y_next <= S1;
		    temp<="001";
                ELSE 
                    y_next <= S4 ;
		    temp<="101";
                END IF ;  
	    WHEN S4=> 
                IF w = '0' THEN 
                    y_next <= S4;
		    temp<="101";
                ELSE 
                    y_next <= S4 ;
		    temp<="101";
                END IF ;  
		 END CASE ;
	 END IF ;  
    end process;
    s<=temp;
end Behavior;
    
