`include "tff.v"

module ud6 (
  input clk,
  input reset,
  input m,
  output [2:0] q
);
  wire ta, tb, tc;

  tff t1(clk, reset, ta, q[2]);
  tff t2(clk, reset, tb, q[1]);
  tff t3(clk, reset, tc, q[0]);

  assign ta = (m&(~q[2]&q[1]&q[0]) | (q[2]&~q[1]&q[0])) | (~m&(~q[1]&~q[0]));
  assign tb = (m&q[0]&~q[2]) | (~m&(~q[2]&q[1]&~q[0] | q[2]&~q[1]&~q[0]));
  assign tc = 1;
endmodule