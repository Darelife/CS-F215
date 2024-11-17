`include "ttf.v"
module down(
  input clk,
  input reset,
  output [2:0]q
);

  wire [2:0] t;

  ttf t0(clk, reset,t[0], q[0]);
  ttf t1(clk, reset,t[1], q[1]);
  ttf t2(clk, reset,t[2], q[2]);
  
  assign t[0] = 1;
  assign t[1] = ~q[0];
  assign t[2] = ~q[1]&~q[0];
endmodule