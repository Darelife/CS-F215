`include "tff.v"
module rd ( 
  input clk,  
  input reset,  
  output [2:0] out
);  
  wire q[2:0];

  // Instantiate T flip-flops
  tff d1(clk, reset, 1'b1, q[0]);
  tff d2(~q[0], reset, 1'b1, q[1]);
  tff d3(~q[1], reset, 1'b1, q[2]);

  assign out = {q[2], q[1], q[0]};
endmodule
