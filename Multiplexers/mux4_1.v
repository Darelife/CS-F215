`include "mux2_1.v"

module mux4_1 (
  input [3:0] in,
  input [1:0] select,
  output out);

  wire [1:0] out1;
  mux2_1 mux1(.in(in[3:2]), .select(select[0]), .out(out1[1]));
  mux2_1 mux2(.in(in[1:0]), .select(select[0]), .out(out1[0]));
  mux2_1 mux3(.in(out1[1:0]), .select(select[1]), .out(out));

  // wire a[1:0];
  // mux2_1 m1(.out(a[0]), in[0:1], select[0]);
  // mux2_1 m2(a[1], in[2:3], select[0]);
  // mux2_1 m3(out, a, select[1]);

endmodule