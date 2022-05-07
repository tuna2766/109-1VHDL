library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity Divider is
    GENERIC ( length : INTEGER := 8 ) ;
	port(clk,clear: in std_logic;
		  divisor,dividend: in std_logic_vector(length-1 downto 0);
		  remainder: buffer std_logic_vector(length*2-1 downto 0);
		  quotient: buffer std_logic_vector(length-1 downto 0));
end Divider;

architecture func of Divider is
signal di: std_logic_vector(length*2-1 downto 0);
signal count :INTEGER;
begin
	process(clk,clear)
	begin
		if clear='1' then 
			quotient <= (others=>'0');
			for i in 0 to length-1 loop
				di(i+length) <= divisor(i);
				di(i) <= '0';
				remainder(i) <= dividend(i);
				remainder(i+length) <= '0';
            end loop;
            
		elsif (clk'event and clk='1' )  then
			
			if not(remainder > "0000000000000001" ) then 
				if (remainder>=di  ) then
					remainder <= remainder-di;
					for i in 1 to length-1  loop
						quotient(i) <= quotient(i-1);
						quotient(0) <= '1';
					end loop;
				elsif (remainder<di ) then
					for i in 1 to length-1  loop
						quotient(i) <= quotient(i-1);
						quotient(0) <= '0';
					end loop;
					end if;

					for i in 0 to (length-1)*2  loop
					di(i) <= di(i+1);
					di(2*length-1 ) <= '0';				
					end loop;
			end if;
				
		end if;
	end process;
end func;