
library ieee;
use ieee.std_logic_1164.all;

entity twos_c_2 is
	port(
		a: in std_logic_vector(0 to 1);
		o: out std_logic_vector(0 to 1)
		);
end twos_c_2;

architecture behav of twos_c_2 is

begin
	o(0) <= a(0) xor a(1);
	o(1) <= a(1);
end architecture;