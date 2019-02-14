
library ieee;
use ieee.std_logic_1164.all;

entity xor_2_2 is
	port(
		a,b: in std_logic_vector(0 to 1);
		o: out std_logic_vector(0 to 1)
		);
end xor_2_2;

architecture behav of xor_2_2 is
begin
	o <= a xor b;
end architecture ;