`include "tff.v"
module bcd (
  input clk,
  input reset,
  output [3:0] q,
  output c
);
  wire ta,tb,tc,td;

  tff t1(clk, reset, ta, q[3]);
  tff t2(clk, reset, tb, q[2]);
  tff t3(clk, reset, tc, q[1]);
  tff t4(clk, reset, td, q[0]);

  assign ta = (q[3]&~q[2]&~q[1]&q[0]) | (~q[3]&q[2]&q[1]&q[0]);
  assign tb = (~q[3]&q[1]&q[0]);
  assign tc = (~q[3]&q[0]);
  assign td = 1;

  assign c = (q == 4'b1001);
endmodule