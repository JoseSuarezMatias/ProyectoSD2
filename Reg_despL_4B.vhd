--> 4-bit left shift register <--
--By: Jose Suarez and Luis Baque

--Block in charge of uniting 4-bit data in a single word of K bits,
--throug input N[3..0]. With the help of the enabler(En) that will shift
--the output Q 4 bits to the left to concatenate the data N into the 
--4 least significant bits of Q. 

library ieee;
use ieee.std_logic_1164.all;

--Entity
Entity Reg_despL_4B is
	generic (k: integer:= 40); --<----k bits 
	port (resetn, clock, En, Ld : in std_logic;
			N    : in std_logic_vector(3 downto 0);
		   Ent  : in std_logic_vector(k-1 downto 0);
			Q	  : buffer std_logic_vector (k-1 downto 0));
end Reg_despL_4B;

--Architecture
Architecture func of Reg_despL_4B is
begin 
	--Start the process
	process (Resetn, clock)
	begin 
		--Initializes the variable Q with zero
		if Resetn='1' then
			Q <= (others =>'0');
		elsif (clock'event and clock = '1')then
		
			--Load in parallel from Ent to Q
			if (En='1' and Ld='1') then Q<= ent;
			
			--Shift output Q 4 bits to the left
			elsif (En='1' and Ld='0') then
				Q(k-1 downto 4)<=Q(k-5 downto 0);
				
				--Place input N in the least significant 4 bits of Q
				Q(3 downto 0)<=N;
			end if;
		end if;
	end process;
end func;