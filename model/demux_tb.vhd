library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity demux_tb is
end entity;

architecture behav of demux_tb is
  signal test_s: std_logic_vector(0 to 2);
  signal test_i: std_logic;
  signal test_o: std_logic_vector(0 to 7);

  component demux_3_8  is
    port (
    s: in std_logic_vector(0 to 2);
    i :in std_logic;
    o: out std_logic_vector(0 to 7)
    );
  end component;

  begin
    uut: demux_3_8 port map(test_s,test_i, test_o );
    main: process
      variable test_s_fill : std_logic_vector(0 to 2);
      begin
        test_s_fill := "000";
        for count in 0 to 7 loop
          test_s <= test_s_fill;
          test_i <= '0';
          wait for 10 ns;
          test_i <= '1';
          wait for 10 ns;
          -- update
          test_s_fill := std_logic_vector(unsigned(test_s_fill) + 1);
        end loop;
        wait;
    end process;
end architecture;
