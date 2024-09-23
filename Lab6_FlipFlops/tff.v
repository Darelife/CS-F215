`include "dff_async.v"
module tff (
  input clk,
  input reset,
  input t,
  output q
);
  wire d;
  xor x1(d, q, t);
  dff_asycr(clk, reset, d, q);
endmodule