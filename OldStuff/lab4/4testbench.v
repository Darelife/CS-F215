`timescale 1ns / 1ps
`include "mux4.v"

module tb_mux4;  // Testbench for mux4
  // Testbench signals
  reg [3:0] in;         // 4-bit input to mux4
  reg [1:0] select;     // 2-bit select input to mux4
  wire out;             // Output from mux4

  // Instantiate the mux4 module
  mux4 uut (
    .in(in),
    .select(select),
    .out(out)
  );

  // Testbench stimulus
  initial begin
    // Initialize inputs
    in = 4'b0000;
    select = 2'b00;
    
    // Apply different test cases
    #10 in = 4'b1010; select = 2'b00;  // Test case 1: Select input 0
    #10 in = 4'b1010; select = 2'b01;  // Test case 2: Select input 1
    #10 in = 4'b1010; select = 2'b10;  // Test case 3: Select input 2
    #10 in = 4'b1010; select = 2'b11;  // Test case 4: Select input 3
    
    #10 in = 4'b1100; select = 2'b00;  // Test case 5: Different input
    #10 in = 4'b1100; select = 2'b01;  // Test case 6
    #10 in = 4'b1100; select = 2'b10;  // Test case 7
    #10 in = 4'b1100; select = 2'b11;  // Test case 8
    #10 $finish;  // End simulation
  end

  // Monitor output
  initial begin
    $monitor("Time = %0t, in = %b, select = %b, out = %b", $time, in, select, out);
  end
endmodule
