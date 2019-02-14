library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ALU_tb is
end entity;

architecture test of ALU_tb is
  signal inputs: std_logic_vector(0 to 6);
  signal outputs: std_logic_vector(0 to 1);
  signal c_outs: std_logic;

  component ALU is
    port(
      alu_s: in std_logic_vector(0 to 2);
      alu_i, alu_j: in std_logic_vector(0 to 1);
      alu_out: out std_logic_vector(0 to 1);
      alu_c_out: out std_logic
    );
  end component;

  begin
    uut: ALU port map(inputs(0 to 2), inputs(3 to 4), inputs(5 to 6), outputs, c_outs);
  	process
			variable test_input : std_logic_vector(0 to 6);
			begin
      report "testing addition";
			test_input := "1000000"; -- binary number 0 (2 bits)
      inputs <= test_input;
			-- for loop construct
			for count in 0 to 15 loop
            inputs <= test_input;
          -- a_in(1) <= test_input(3);
          -- a_in(0) <= test_input(2);
          -- b_in(1) <= test_input(1);
          -- b_in(0) <= test_input(0);
          -- report std_logic'image(a_in(0)) &
          -- std_logic'image(a_in(1)) & " + " &
          -- std_logic'image(b_in(0)) &
          -- std_logic'image(b_in(1)) ;
			  --give process some time
			  wait for 10 ns;
        report  integer'image(to_integer(unsigned(inputs(3 to 4)))) &" + "
                & integer'image(to_integer(unsigned(inputs(5 to 6)))) & " = "
                & integer'image(to_integer(unsigned(outputs)));

          -- report  "=" & std_logic'image(c_out1) & " + " &
          -- std_logic'image(o1(0)) & std_logic'image(o1(1));
			  -- test_input := std_logic_vector(unsigned(test_input) + 1);
        test_input := std_logic_vector(unsigned(test_input)  +1);
			end loop;
			wait;
	end process;
end architecture;
