library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_8_3  is
  port (
  s: in std_logic_vector(0 to 2);
  i: in std_logic_vector(0 to 7);
  o :out std_logic
  );
end entity;

architecture behav of mux_8_3 is
  signal outs: std_logic_vector(0 to 7);
  begin
    main: process
      begin
        outs(7) <= i(7) and (not s(0)) and (not s(1)) and (not s(2));
        outs(6) <= i(6) and (not s(0)) and (not s(1)) and (s(2));
        outs(5) <= i(5) and (not s(0)) and (s(1)) and (not s(2));
        outs(4) <= i(4) and (not s(0)) and (s(1)) and (s(2));
        outs(3) <= i(3) and (s(0)) and (not s(1)) and (not s(2));
        outs(2) <= i(2) and (s(0)) and (not s(1)) and (s(2));
        outs(1) <= i(1) and (s(0)) and (s(1)) and (not s(2));
        outs(0) <= i(0) and (s(0)) and (s(1)) and (s(2));
        o <= outs(7) or outs(6)  or outs(5) or outs(4) or outs(3) or outs(2) or outs(1) or outs(0);
        wait on s,i;
      end process;
end architecture;
