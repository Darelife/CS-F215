`include "dff.v"
module reg (
  input clk,
  input reset,
  input [3:0] I,
  output [3:0] A
);
  dff d1(clk, reset, I[0], A[0]);
  dff d1(clk, reset, I[1], A[1]);
  dff d1(clk, reset, I[2], A[2]);
  dff d1(clk, reset, I[3], A[3]);
endmodule