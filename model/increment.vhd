
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
	component parallel_adder_2_2 is
		port(
			a, b: in std_logic_vector(0 to 1);
			o: out std_logic_vector(0 to 1):="00";
			c_out_2: out std_logic:='0'
			);
	end component;

begin
	inc: parallel_adder_2_2 port map(a,"01",o);
	c_out <= a(0) and a(1);
end architecture;