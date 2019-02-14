
library ieee;
use ieee.std_logic_1164.all;

entity and_2_2 is
	port(
		a,b: in std_logic_vector(0 to 1);
		o: out std_logic_vector(0 to 1)
		);
end and_2_2;

architecture behav of and_2_2 is
begin
	o <= a and b;
end architecture ;