`include "ud.v"
module tud;
  reg clk;
  reg reset;
  reg m;
  wire [2:0] q;

  // Instantiate the down module
  ud ud1 (
    .clk(clk),
    .reset(reset),
    .m(m),
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
    m = 0;

    #10 reset = 1;

    #200

    m = 1;

    #200

    $finish;
  end

  // Monitor the values of signals
  initial begin
    $monitor("At time %t, clk = %b, m = %b, q = %b, reset = %b", $time, clk, m, q, reset);
  end
endmodule
