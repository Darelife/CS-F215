module pe (
  input [3:0] in,
  output [1:0] out,
  output v
);
  wire a;
  and a1 (a, ~in[2], in[1]);
  or o1 (out[0], in[3], a);
  or o2 (out[1], in[2], in[3]);
  or o3 (v, in[0], in[1], in[2], in[3]);
endmodule