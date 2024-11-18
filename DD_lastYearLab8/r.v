`include "r1.v"
`include "r2.v"
`include "r3.v"

module r (
  input clk,
  input reset,
  output [3:0] o1,
  output [1:0] o2,
  output o3
);
  wire t1,t2;
  r1 rr1(clk, reset, o1, t1);
  r2 rr2(t1, reset, o2, t2);
  r3 rr3(t2|t1, reset, o3);
endmodule