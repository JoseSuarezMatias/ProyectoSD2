library ieee;
use ieee.std_logic_1164.all; 
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;

entity RAM_Pacientes is 
	generic(n: integer:=52;-- n-bits per data
	m: integer:=5); -- m-bits of addresses
	port(
		clk: in std_logic; 
		addr : in std_logic_vector(m-1 downto 0); 
		Dout : out std_logic_vector(n-1 downto 0)); 
end RAM_Pacientes;

architecture solve of RAM_Pacientes is	
	type ram_type is array (0 to (2**m)-1) of std_logic_vector(n-1 downto 0); 
	signal tmp_ram: ram_type; 
	attribute ram_init_file: string;
	attribute ram_init_file of tmp_ram: signal is "Pacientes.mif";
	begin
	process(clk)
		begin 
			if (clk'event and clk='1') then
				Dout <= tmp_ram(conv_integer(addr)); 
			end if; 
	end process; 
end solve;