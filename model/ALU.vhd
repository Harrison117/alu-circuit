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
  signal demux_to_op_0,
  demux_to_op_1,
  demux_to_op_2,
  demux_to_op_3,
  demux_to_op_4,
  demux_to_op_5,
  demux_to_op_6,
  demux_to_op_7: std_logic_vector(0 to 3);
  signal  op0_out,
          op1_out,
          op2_out,
          op3_out,
          op4_out,
          op5_out,
          op6_out,
          op7_out : std_logic_vector(0 to 1);
  signal  op0_c_out,
          op1_c_out,
          op2_c_out,
          op3_c_out,
          op4_c_out,
          op5_c_out,
          op6_c_out,
          op7_c_out : std_logic_vector(0 to 1);

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
  component demux_to_op is
    port(
      a,b,c,d: in std_logic;
      o: out std_logic_vector(0 to 3)
    );
  end component;

  begin
    -- for selecting operation
    demux0: demux_3_8 port map(alu_s, alu_i(0),demux0_res );
    demux1: demux_3_8 port map(alu_s, alu_i(1),demux1_res );
    demux2: demux_3_8 port map(alu_s, alu_j(0),demux2_res );
    demux3: demux_3_8 port map(alu_s, alu_j(1),demux3_res);

    demux_to_op0: demux_to_op port map(demux0_res(0), demux1_res(0), demux2_res(0),demux3_res(0));
    demux_to_op1: demux_to_op port map(demux0_res(1), demux1_res(1), demux2_res(1),demux3_res(1));
    demux_to_op2: demux_to_op port map(demux0_res(2), demux1_res(2), demux2_res(2),demux3_res(2));
    demux_to_op3: demux_to_op port map(demux0_res(3), demux1_res(3), demux2_res(3),demux3_res(3));
    demux_to_op4: demux_to_op port map(demux0_res(4), demux1_res(4), demux2_res(4),demux3_res(4));
    demux_to_op5: demux_to_op port map(demux0_res(5), demux1_res(5), demux2_res(5),demux3_res(5));
    demux_to_op6: demux_to_op port map(demux0_res(6), demux1_res(6), demux2_res(6),demux3_res(6));
    demux_to_op7: demux_to_op port map(demux0_res(7), demux1_res(7), demux2_res(7),demux3_res(7));

    -- mapping demux to operations
    -- 0: and
    -- 1: or
    -- 2: xor
    -- 3: not
    -- 4: add
    add: parallel_adder_2_2 port map(demux_to_op_4(0 to 1),demux_to_op_4(2 to 3) , op0_out, op0_c_out);
    -- 5: sub1
    -- 6: sub2
    -- 7: increment

    -- connect to multiplexers
end architecture;
