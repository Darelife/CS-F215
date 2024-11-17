`include "tff.v"
module rud ( 
  input clk,  
  input reset,
  input m,
  output [2:0] out
);  
  wire q[2:0];

  tff d1(clk, reset, 1'b1, q[0]);
  tff d2((m&~q[0])|(~m&q[0]), reset, 1'b1, q[1]);
  tff d3((m&~q[1])|(~m&q[1]), reset, 1'b1, q[2]);

  assign out = {q[2], q[1], q[0]};
endmodule
