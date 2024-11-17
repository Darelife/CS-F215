`include "upc.v"
`timescale 1ns / 1ps

module tb_up_counter;

  // Inputs
  reg clk;
  reg reset;

  // Outputs
  wire [3:0] q;

  // Instantiate the Unit Under Test (UUT)
  up_counter uut (
    .clk(clk),
    .reset(reset),
    .q(q)
  );

  // Clock generation (period = 10 ns)
  always #5 clk = ~clk;

  initial begin
    // Initialize Inputs
    clk = 0;
    reset = 0;
    #10 reset = 1;

    #200

    $finish;
  end

  // Monitor output
  initial begin
    $monitor("Time = %0d, clk = %b, reset = %b, q = %b", $time, clk, reset, q);
  end

endmodule
