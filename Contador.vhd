library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Contador is
	generic ( n: integer :=4);--<------- nbits
	port(
		Clk,resetn,en,ld: in std_logic;
		D: in std_logic_vector(n-1 downto 0);
		q: buffer std_logic_vector(n-1 downto 0));
end Contador;


architecture solve of Contador is
	begin
	process(resetn,clk)
		begin
			if resetn='1' then
				q<=(others => '0');
			elsif clk'event and clk='1' then
				if en='1' and ld='0' then
					q<=q+1;
				elsif en='1' and ld='1' then
					q<= D;
				end if;
			end if;
	end process;
end solve;