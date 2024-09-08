`timescale 1ns / 1ps
`include "decoder3_8.v"

module tb_decoder3_8;
  reg [2:0] in;
  wire [7:0] out;

  // Instantiate the decoder3_8 module
  decoder3_8 uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Initialize inputs
    in = 3'b000;
    #10; // Wait for 10 time units

    in = 3'b001;
    #10;

    in = 3'b010;
    #10;

    in = 3'b011;
    #10;

    in = 3'b100;
    #10;

    in = 3'b101;
    #10;

    in = 3'b110;
    #10;

    in = 3'b111;
    #10;

    $finish; // End the simulation
  end

  initial begin
    $monitor("time = %0d, in = %b, out = %b", $time, in, out);
  end

  initial begin
    $dumpfile("decoder3_8_tb.vcd");
    $dumpvars(0, tb_decoder3_8);
  end
endmodule