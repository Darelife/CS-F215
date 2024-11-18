`timescale 1ns / 1ps
`include "r.v"

module r1_tb;
  // Testbench signals
  reg clk;
  reg reset;
  wire [3:0] out1;
  wire [1:0] out2;
  wire out3;

  // Instantiate the counter module
  r rr(clk, reset, out1, out2, out3);

  // Clock generation: 10ns clock period
  always #5 clk = ~clk;

  // Test procedure
  initial begin
    // Initialize signals
    clk = 0;
    reset = 1;

    // Apply reset
    #10;
    reset = 0;
    #10;
    reset = 1; // Release reset after 10ns

    // Let the counter run for 20 clock cycles
    #400;

    // End simulation
    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time = %0t | clk = %b | reset = %b | out1 = %b | out2 = %b | out3 = %b", $time, clk, reset, out1, out2, out3);
  end

endmodule
