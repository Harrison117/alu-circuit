library ieee;
use ieee.std_logic_1164.all;

entity parallel_adder_2_2 is
  port(

    a, b: in std_logic_vector(0 to 1);
    o: out std_logic_vector(0 to 1);
    c_out_2: out std_logic
  );
end entity;

architecture struct of parallel_adder_2_2 is
  signal c_out_1: std_logic;
  signal no_c_in: std_logic := '0';
  component full_adder is
    port(
      a,b: in std_logic;
      c_in: in std_logic;
      o, c_out: out std_logic
    );
  end component full_adder;

  begin
    add0: full_adder port map(a(1),b(1),no_c_in, o(1), c_out_1);
    add1: full_adder port map(a(0),b(0), c_out_1, o(0), c_out_2);
end architecture;
