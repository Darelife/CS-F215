// `include "tff.v"
// module ripple ( 
//   input clk,  
//   input reset,  
//   output [2:0] out
// );  
//   wire q[2:0];
//   // wire r;

//   // wire rr;
//   assign rr = reset;

//   tff d1(clk, rr, 1, q[0]);
//   tff d2(q[0], rr, 1, q[1]);
//   tff d3(q[1], rr, 1, q[2]);

//   // assign r = q[2]&q[1];

//   assign out = {q[2],q[1],q[0]};
// endmodule

`include "tff.v"
module ripple ( 
  input clk,  
  input reset,  
  output [2:0] out
);  
  wire q[2:0];
  wire r;

  assign r = q[1] & q[2];

  wire rr = reset & ~r;

  // Instantiate T flip-flops
  tff d1(clk, rr, 1'b1, q[0]);
  tff d2(q[0], rr, 1'b1, q[1]);
  tff d3(q[1], rr, 1'b1, q[2]);

  assign out = {q[2], q[1], q[0]};
endmodule
