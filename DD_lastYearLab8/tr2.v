`timescale 1ns / 1ps
`include "r2.v"

module r1_tb;
  // Testbench signals
  reg clk;
  reg reset;
  wire [1:0] out;
  wire tick;

  // Instantiate the counter module
  r2 uut (
    .clk(clk),
    .reset(reset),
    .out(out),
    .tick(tick)
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

    // Let the counter run for 20 clock cycles
    #200;

    // End simulation
    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time = %0t | clk = %b | reset = %b | out = %b | tick = %b", $time, clk, reset, out, tick);
  end

endmodule
