
library ieee;
use ieee.std_logic_1164.all;


entity increment is
	port(
		a,b: in std_logic_vector(0 to 1);
		o: out std_logic_vector(0 to 1);
		c_out: out std_logic
		);
end increment;

architecture behav of increment is
	component twos_c_2 is
		port(
			a: in std_logic_vector(0 to 1);
			o: out std_logic_vector(0 to 1)
			);
	end component;

begin
	inc: twos_c_2 port map(a,o);
	c_out <= a(0) and a(1);
end architecture;