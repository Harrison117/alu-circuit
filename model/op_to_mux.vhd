library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity op_to_mux is
  port(
    a,b,c,d,e,f,g,h: in std_logic;
    o: out std_logic_vector(0 to 7):="00000000"
  );
end entity;

architecture behav of op_to_mux is
  -- takes 8 std_logic and make it std_logic_vector(0 to 7)
  begin
    process
      begin
      o(0) <= a;
      o(1) <= b;
      o(2) <= c;
      o(3) <= d;
      o(4) <= e;
      o(5) <= f;
      o(6) <= g;
      o(7) <= h;
      wait on a,b,c,d,e,f,g,h;
    end process;
end architecture;
