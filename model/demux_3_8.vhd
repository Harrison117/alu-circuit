library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity demux_3_8  is
  port (
  s: in std_logic_vector(0 to 2);
  i :in std_logic;
  o: out std_logic_vector(0 to 7)
  );
end entity;

architecture behav of demux_3_8 is
  begin
    main: process
      begin
        o(7) <= i and (not s(0)) and (not s(1)) and (not s(2));
        o(6) <= i and (not s(0)) and (not s(1)) and (s(2));
        o(5) <= i and (not s(0)) and (s(1)) and (not s(2));
        o(4) <= i and (not s(0)) and (s(1)) and (s(2));
        o(3) <= i and (s(0)) and (not s(1)) and (not s(2));
        o(2) <= i and (s(0)) and (not s(1)) and (s(2));
        o(1) <= i and (s(0)) and (s(1)) and (not s(2));
        o(0) <= i and (s(0)) and (s(1)) and (s(2));
        wait on s,i;
      end process;
end architecture;
