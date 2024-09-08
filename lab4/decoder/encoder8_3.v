module encoder8_3 (
  input [7:0] in,
  output [2:0] out
);
  or o1 (out[0], in[1], in[3], in[5], in[7]);
  or o2 (out[1], in[2], in[3], in[6], in[7]);
  or o3 (out[2], in[4], in[5], in[6], in[7]);
endmodule