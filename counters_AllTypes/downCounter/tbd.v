`include "d.v"
module down_tb;
  reg clk;
  reg reset;
  wire [2:0] q;

  // Instantiate the down module
  down uut (
    .clk(clk),
    .reset(reset),
    .q(q)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Toggle clock every 5 time units
  end

  // Initial block to apply test cases
  initial begin
    // Initialize signals
    clk = 0;
    reset = 0;

    #10 reset = 1;

    #200

    $finish;
  end

  // Monitor the values of signals
  initial begin
    $monitor("At time %t, clk = %b, q = %b, reset = %b", $time, clk, q, reset);
  end
endmodule
