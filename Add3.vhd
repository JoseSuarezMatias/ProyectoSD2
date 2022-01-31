

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity Add3 is
	generic ( n: integer :=4);
	port(
		A,B,C: in std_logic_vector(n-1 downto 0);
		S: out std_logic_vector(n+1 downto 0));
end Add3;

architecture solve of Add3 is
	
	begin
		s<=("00"&A)+("00"&B)+("00"&C);
		
end solve;