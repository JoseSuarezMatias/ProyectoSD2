library ieee;
use ieee.std_logic_1164.all;

entity concatenador_2b is
port( X: in std_logic_vector (6 downto 0);
		Y: out std_logic_vector (8 downto 0));
end concatenador_2b;

architecture desarrollo of concatenador_2b is
begin
	Y <= "00"& X;
end desarrollo;