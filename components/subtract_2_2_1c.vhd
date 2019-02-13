
library ieee;
use ieee.std_logic_1164.all;

entity subtract_2_2_1c is
	port(
		a,b: in std_logic_vector(0 to 1);
		o: out std_logic_vector(0 to 1);
		c_out_2: out std_logic
		);
end subtract_2_2_1c;

architecture behav of subtract_2_2_1c is
	signal complement: std_logic_vector(0 to 1);
	
	component ones_c_2 is
		port(
			a: in std_logic_vector(0 to 1);
			o: out std_logic_vector(0 to 1)
			);
	end component;

	component parallel_adder_2_2 is
		port(
			a, b: in std_logic_vector(0 to 1);
			o: out std_logic_vector(0 to 1);
			c_out_2: out std_logic
			);
	end component;

begin
	comp: ones_c_2 port map(b, complement);
	sub0: parallel_adder_2_2 port map(a, complement, o, c_out_2);
end architecture;