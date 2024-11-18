
`timescale 1ns / 1ps
`include "ring.v"

module ring_counter_tb;
  // Testbench signals
  reg clk;
  reg reset;
  wire [3:0] q;

  // Instantiate the ring counter module
  ring_counter uut (
    .clk(clk),
    .reset(reset),
    .q(q)
  );

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

    // Let the counter run for several clock cycles
    #200;

    // End simulation
    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time = %0t | clk = %b | reset = %b | q = %b", $time, clk, reset, q);
  end

endmodule
