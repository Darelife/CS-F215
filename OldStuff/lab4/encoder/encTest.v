`timescale 1ns / 1ps
`include "encoder8_3.v"

module tb_encoder8_3;
  reg [7:0] in;
  wire [2:0] out;

  // Instantiate the encoder8_3 module
  encoder8_3 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Initialize inputs
    in = 8'b00000001;
    #10; // Wait for 10 time units

    in = 8'b00000010;
    #10;

    in = 8'b00000100;
    #10;

    in = 8'b00001000;
    #10;

    in = 8'b00010000;
    #10;

    in = 8'b00100000;
    #10;

    in = 8'b01000000;
    #10;

    in = 8'b10000000;
    #10;

    $finish; // End the simulation
  end

  initial begin
    $monitor("time = %0d, in = %b, out = %b", $time, in, out);
  end

  initial begin
    $dumpfile("encoder8_3_tb.vcd");
    $dumpvars(0, tb_encoder8_3);
  end
endmodule