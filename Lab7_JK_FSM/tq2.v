`include "Q2.v"
module tb_Q2;
reg clk;
reg reset;
reg in;
wire out;

// Instantiate the Q2 module
Q2 uut (
  .clk(clk),
  .reset(reset),
  .in(in),
  .out(out)
);

// Clock generation
always #5 clk = ~clk;

initial begin
  // Initialize inputs
  clk = 0;
  reset = 0;
  in = 0;

  // Apply reset
  reset = 1;
  #10;
  reset = 0;

  // Test sequence
  in = 0; #10;
  in = 1; #10;
  in = 0; #10;
  in = 1; #10;
  in = 0; #10;
  in = 1; #10;
  in = 0; #10;
  in = 1; #10;
  in = 0; #10;
  in = 1; #10;

  // Finish simulation
  $finish;
end

// Monitor signal changes
initial begin
  $monitor("At time %t: clk = %b, reset = %b, in = %b, out = %b", $time, clk, reset, in, out);
end

// Dump waveform data
initial begin
  $dumpfile("tb_Q2.vcd");
  $dumpvars(0, tb_Q2);
end
endmodule