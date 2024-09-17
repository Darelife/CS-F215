module demux(
  input [1:0] s,
  input in,
  output [3:0] out
);
  wire s1_not, s0_not;

  not n1 (s1_not, s[1]);
  not n2 (s0_not, s[0]);

  and a1 (out[0], s1_not, s0_not, in);
  and a2 (out[1], s1_not, s[0], in);
  and a3 (out[2], s[1], s0_not, in);
  and a4 (out[3], s[1], s[0], in);
endmodule