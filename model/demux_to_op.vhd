library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity demux_to_op is
  port(
    a,b,c,d: in std_logic;
    o: out std_logic_vector(0 to 3)
  );
end entity;

architecture behav of demux_to_op is
  begin
    process
      begin
      o(0) <= a;
      o(1) <= b;
      o(2) <= c;
      o(3) <= d;
      wait on a, b, c,d;
    end process;
end architecture;
