`include "mux2_1.v"
`include "mux4_1.v"

module mux8_1 (
  input [7:0] in;
  input [2:0] select;
  output out;
);
  wire out1, out2;
  mux4_1(in[3:0], .select[1:0], out1);
  mux4_1(in[7:4], .select[3:2], out2);
  mux2_1(out1,out2, out);


endmodule