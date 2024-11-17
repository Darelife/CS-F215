`include "bcd2.v"

module tb_two_digit_bcd_counter;
  reg clk;
  reg reset;
  wire [7:0] q;

  // Instantiate the 2-digit BCD counter
  bcd2 uut (
    .clk(clk),
    .reset(reset),
    .q(q)
  );

  // Clock generation
  always #5 clk = ~clk; // Clock with period of 10 time units

  // Test sequence
  initial begin
    // Initialize signals
    clk = 0;
    reset = 0;
    #10 reset = 1;
    
    
    #200

    // Run simulation for 200 time units
    $finish;
  end

  initial begin
    $monitor("At time %t: clk = %b, reset = %b, q = %b (tens = %d, ones = %d)", 
             $time, clk, reset, q, q[7:4], q[3:0]);
  end
endmodule
