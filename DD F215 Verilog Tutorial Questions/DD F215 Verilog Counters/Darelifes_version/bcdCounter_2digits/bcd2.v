`include "bcd.v"

module bcd2 (
  input clk,
  input reset,
  output [7:0] q
);
  wire cin,co;

  bcd bcd1 (clk, reset, q[3:0], cin);
  bcd bcd2 (cin, reset,q[7:4],co);
  
endmodule