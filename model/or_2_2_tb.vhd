library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity or_2_2_tb is
end or_2_2_tb;

architecture test of or_2_2_tb is
	signal a_in, b_in: std_logic_vector(0 to 1);
	signal o1: std_logic_vector(0 to 1);

	component or_2_2 is
		port(
			a,b: in std_logic_vector(0 to 1);
			o: out std_logic_vector(0 to 1)
			);	
	end component;

begin
	uut: or_2_2 port map(a_in, b_in, o1);

	main: process
	variable test_input : std_logic_vector(0 to 3);
	begin
		test_input := "0000"; -- binary number 0 (2 bits)

		-- for loop construct
		for count in 0 to 15 loop
			a_in(1) <= test_input(3);
			a_in(0) <= test_input(2);
			b_in(1) <= test_input(1);
			b_in(0) <= test_input(0);
		    wait for 10 ns;

			report std_logic'image(a_in(0)) 
				& std_logic'image(a_in(1)) 
				& " OR " 
				& std_logic'image(b_in(0)) 
				& std_logic'image(b_in(1)) 
				& "=" 
				& std_logic'image(o1(0)) 
				& std_logic'image(o1(1));

			test_input := std_logic_vector(unsigned(test_input) + 1);
		end loop;
		wait;
	end process;
end architecture;