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
  signal demux0_res,demux1_res,demux2_res,demux3_res: std_logic_vector(0 to 7):="00000000";
  signal   demux_to_op_0,
          demux_to_op_1,
          demux_to_op_2,
          demux_to_op_3,
          demux_to_op_4,
          demux_to_op_5,
          demux_to_op_6,
          demux_to_op_7: std_logic_vector(0 to 3):= "0000";
  signal  op0_out,
          op1_out,
          op2_out,
          op3_out,
          op4_out,
          op5_out,
          op6_out,
          op7_out : std_logic_vector(0 to 1):= "00";
  signal  op0_c_out,
          op1_c_out,
          op2_c_out,
          op3_c_out,
          op4_c_out,
          op5_c_out,
          op6_c_out,
          op7_c_out : std_logic:='0';
  signal  op_to_mux_0,
          op_to_mux_1,
          op_to_mux_2: std_logic_vector(0 to 7) := "00000000";

  component op_to_mux is
    port(
      a,b,c,d,e,f,g,h: in std_logic;
      o: out std_logic_vector(0 to 7)
    );
  end component;
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
  component mux_8_3  is
    port (
    s: in std_logic_vector(0 to 2); --selectors
    i: in std_logic_vector(0 to 7); --input bits
    o :out std_logic --output
    );
  end component;

  component and_2_2 is
    port(
      a,b: in std_logic_vector(0 to 1);
      o: out std_logic_vector(0 to 1)
      );

  end component;

  component or_2_2 is
    port(
      a,b: in std_logic_vector(0 to 1);
      o: out std_logic_vector(0 to 1)
      );
  end component;

  component ones_c_2 is
    port(
      a: in std_logic_vector(0 to 1);
      o: out std_logic_vector(0 to 1)
      );
  end component;

  component xor_2_2 is
    port(
      a,b: in std_logic_vector(0 to 1);
      o: out std_logic_vector(0 to 1)
      );
  end component;

  component increment is
  	port(
  		a,b: in std_logic_vector(0 to 1);
  		o: out std_logic_vector(0 to 1);
  		c_out: out std_logic
  		);
  end component;
  component subtract_2_2_1c is
  	port(
  		a,b: in std_logic_vector(0 to 1);
  		o: out std_logic_vector(0 to 1);
  		c_out_2: out std_logic
  		);
  end component;
  component subtract_2_2_2c is
  	port(
  		a,b: in std_logic_vector(0 to 1);
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

    demux_to_op0: demux_to_op port map(demux0_res(0), demux1_res(0), demux2_res(0),demux3_res(0),demux_to_op_0);
    demux_to_op1: demux_to_op port map(demux0_res(1), demux1_res(1), demux2_res(1),demux3_res(1),demux_to_op_1);
    demux_to_op2: demux_to_op port map(demux0_res(2), demux1_res(2), demux2_res(2),demux3_res(2),demux_to_op_2);
    demux_to_op3: demux_to_op port map(demux0_res(3), demux1_res(3), demux2_res(3),demux3_res(3),demux_to_op_3);
    demux_to_op4: demux_to_op port map(demux0_res(4), demux1_res(4), demux2_res(4),demux3_res(4),demux_to_op_4);
    demux_to_op5: demux_to_op port map(demux0_res(5), demux1_res(5), demux2_res(5),demux3_res(5),demux_to_op_5);
    demux_to_op6: demux_to_op port map(demux0_res(6), demux1_res(6), demux2_res(6),demux3_res(6),demux_to_op_6);
    demux_to_op7: demux_to_op port map(demux0_res(7), demux1_res(7), demux2_res(7),demux3_res(7),demux_to_op_7);

    -- mapping demux to operations
    -- 0: and
    and2: and_2_2 port map(demux_to_op_4(0 to 1),demux_to_op_4(2 to 3) , op4_out);
    -- 1: or
    or2: or_2_2 port map(demux_to_op_4(0 to 1),demux_to_op_4(2 to 3) , op4_out);
    -- 2: xor
    xor2: xor_2_2 port map(demux_to_op_4(0 to 1),demux_to_op_4(2 to 3) , op4_out);
    -- 3: not
    not2: ones_c_2 port map(demux_to_op_4(0 to 1), op4_out);
    -- 4: add
    add: parallel_adder_2_2 port map(demux_to_op_4(0 to 1),demux_to_op_4(2 to 3) , op4_out, op4_c_out);
    -- 5: sub1
    sub_1c: subtract_2_2_1c port map(demux_to_op_5(0 to 1),demux_to_op_5(2 to 3) , op5_out, op5_c_out);
    -- 6: sub2
    sub_2c: subtract_2_2_2c port map(demux_to_op_6(0 to 1),demux_to_op_6(2 to 3) , op6_out, op6_c_out);
    -- 7: increment
    inc: increment port map(demux_to_op_7(0 to 1),demux_to_op_7(2 to 3) , op7_out, op7_c_out);

    -- multiplexer connectors
    op_to_mux0: op_to_mux port map(op0_out(0), op1_out(0), op2_out(0), op3_out(0), op4_out(0), op5_out(0), op6_out(0), op7_out(0),op_to_mux_0 );
    op_to_mux1: op_to_mux port map(op0_out(1), op1_out(1), op2_out(1), op3_out(1), op4_out(1), op5_out(1), op6_out(1), op7_out(1),op_to_mux_1);
    op_to_mux2: op_to_mux port map(op0_c_out, op1_c_out, op2_c_out, op3_c_out, op4_c_out, op5_c_out, op6_c_out, op7_c_out, op_to_mux_2);

    -- multiplexers
    mux0: mux_8_3 port map(alu_s, op_to_mux_0, alu_out(0));
    mux1: mux_8_3 port map(alu_s, op_to_mux_1, alu_out(1));
    mux2: mux_8_3 port map(alu_s, op_to_mux_2, alu_c_out);



end architecture;
