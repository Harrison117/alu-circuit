library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ALU_tb is
end entity;

architecture test of ALU_tb is
  signal inputs: std_logic_vector(0 to 6):="0000000";
  signal outputs: std_logic_vector(0 to 1):="00";
  signal c_outs: std_logic:='0';

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

      report "testing and";
      test_input:="0000000";
      inputs <= test_input;
      for count in 0 to 15 loop
        inputs <= test_input;
        wait for 10 ns;
        assert outputs=(inputs(3 to 4) and inputs(5 to 6) )
        report  integer'image(to_integer(unsigned(inputs(3 to 4)))) &" + "
                & integer'image(to_integer(unsigned(inputs(5 to 6)))) & " != "
                & integer'image(to_integer(unsigned(outputs)));
        test_input := std_logic_vector(unsigned(test_input)  +1);
      end loop;

      report "testing or";
      test_input:="0010000";
      inputs <= test_input;
      for count in 0 to 15 loop
        inputs <= test_input;
        wait for 10 ns;
        assert outputs=(inputs(3 to 4) or inputs(5 to 6) )
        report  integer'image(to_integer(unsigned(inputs(3 to 4)))) &" + "
                & integer'image(to_integer(unsigned(inputs(5 to 6)))) & " != "
                & integer'image(to_integer(unsigned(outputs)));
        test_input := std_logic_vector(unsigned(test_input)  +1);
      end loop;

      report "testing xor";
      test_input:="0100000";
      inputs <= test_input;
      for count in 0 to 15 loop
        inputs <= test_input;
        wait for 10 ns;
        assert outputs=(inputs(3 to 4) xor inputs(5 to 6) )
        report  integer'image(to_integer(unsigned(inputs(3 to 4)))) &" + "
                & integer'image(to_integer(unsigned(inputs(5 to 6)))) & " != "
                & integer'image(to_integer(unsigned(outputs)));
        test_input := std_logic_vector(unsigned(test_input)  +1);
      end loop;

      report "testing not";
      test_input:="0110000";
      inputs <= test_input;
      for count in 0 to 15 loop
        inputs <= test_input;
        wait for 10 ns;
        assert outputs=(not (inputs(3 to 4)))
        report "not " &
        std_logic'image(not outputs(0)) & std_logic'image(not outputs(1)) &
        " != " & std_logic'image(not inputs(3)) & std_logic'image(not inputs(4));
        -- integer'image(to_integer(unsigned(inputs(3 to 4)))) &" + "
                -- & integer'image(to_integer(unsigned(inputs(5 to 6)))) & " != "
                -- & integer'image(to_integer(unsigned(outputs)));
        test_input := std_logic_vector(unsigned(test_input)  +1);
      end loop;


      report "testing addition";
			test_input := "1000000"; -- binary number 0 (2 bits)
      inputs <= test_input;
			-- for loop construct
			for count in 0 to 15 loop
            inputs <= test_input;
			  wait for 10 ns;
        assert to_integer(unsigned(outputs))=(to_integer(unsigned(inputs(3 to 4)))+to_integer(unsigned(inputs(5 to 6)))) mod 4
        report  integer'image(to_integer(unsigned(inputs(3 to 4)))) &" + "
                & integer'image(to_integer(unsigned(inputs(5 to 6)))) & " != "
                & integer'image(to_integer(unsigned(outputs)));
        test_input := std_logic_vector(unsigned(test_input)  +1);
			end loop;
			wait;
	end process;
end architecture;
