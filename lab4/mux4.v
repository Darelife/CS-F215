`include "mux2.v"

module mux4 (
  input [3:0] in,
  input [1:0] select,
  output out
);  
  wire [1:0] a;
  mux2 m1(in[1:0], select[0], a[0]);
  mux2 m2(in[3:2], select[0], a[1]);
  mux2 m3(a, select[1], out);
endmodule
