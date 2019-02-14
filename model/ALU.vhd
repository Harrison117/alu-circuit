library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
  port(
    alu_s: in std_logic_vector(0 to 2);
    alu_i, alu_j: in std_logic_vector(0 to 1);
    alu_out: out std_logic_vector(0 to 1);
    alu_c_out: out std_logic
  );
end entity;

architecture struct of ALU is
  signal demux0_res,demux1_res,demux2_res,demux3_res: std_logic_vector(0 to 7);
  component demux_3_8  is
    port (
    s: in std_logic_vector(0 to 2);
    i :in std_logic;
    o: out std_logic_vector(0 to 7)
    );
  end component;
  component parallel_adder_2_2 is
    port(
      a, b: in std_logic_vector(0 to 1);
      o: out std_logic_vector(0 to 1);
      c_out_2: out std_logic
    );
  end component;

  begin
    -- for selecting operation
    demux0: demux_3_8 port map(alu_s, alu_i(0),demux0_res );
    demux1: demux_3_8 port map(alu_s, alu_i(1),demux1_res );
    demux2: demux_3_8 port map(alu_s, alu_j(0),demux2_res );
    demux3: demux_3_8 port map(alu_s, alu_j(1),demux3_res);
    -- mapping demux to operations
    -- 0: and
    -- 1: or
    -- 2: xor
    -- 3: not
    -- 4: add
    add: parallel_adder_2_2 port map(demux0_res(4) & demux1_res(4),demux2_res(4)&demux3_res(4), alu_out, alu_c_out);
    -- 5: sub1
    -- 6: sub2
    -- 7: increment

end architecture;
