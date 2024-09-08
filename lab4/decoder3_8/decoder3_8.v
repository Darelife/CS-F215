module decoder3_8 (
  input [2:0] in,
  output [7:0] out
);
  // wire d0,d1,d2,d3,d4,d5,d6,d7;
  wire n2,n1,n0;

  not no0 (n0, in[0]);
  not no1 (n1, in[1]);
  not no2 (n2, in[2]);

  and a0 (out[0], n2, n1, n0);
  and a1 (out[1], n2, n1, in[0]);
  and a2 (out[2], n2, in[1], n0);
  and a3 (out[3], n2, in[1], in[0]);
  and a4 (out[4], in[2], n1, n0);
  and a5 (out[5], in[2], n1, in[0]);
  and a6 (out[6], in[2], in[1], n0);
  and a7 (out[7], in[2], in[1], in[0]);
endmodule