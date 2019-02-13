
library ieee;
use ieee.std_logic_1164.all;

entity ones_c_2 is
	port(
		a: in std_logic_vector(0 to 1);
		o: out std_logic_vector(0 to 1)
		);
end ones_c_2;

architecture behav of ones_c_2 is

begin
	o <= not a;
end architecture;