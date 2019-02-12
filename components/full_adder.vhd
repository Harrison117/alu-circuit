library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
  port(
    a,b: in std_logic;
    c_in: in std_logic;
    o, c_out: out std_logic
  );
end entity;

architecture behav of full_adder is
  signal sum_1: std_logic;
  begin
    main: process
      begin
        o <= (a xor b) xor c_in;
        c_out <= (a and b) or ((a xor b) and c_in);
        wait on a,b, c_in;
      end process;
end architecture;
