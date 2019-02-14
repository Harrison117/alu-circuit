
library ieee;
use ieee.std_logic_1164.all;

entity or_2_2 is
	port(
		a,b: in std_logic_vector(0 to 1);
		o: out std_logic_vector(0 to 1)
		);
end or_2_2;

architecture behav of or_2_2 is
begin
	o <= a or b;
end architecture ;