`timescale 1ns / 1ps
`include "decoder4_16.v"

module tb_decoder4_16;
  reg [3:0] in;
  reg enable;
  wire [15:0] out;

  // Instantiate the decoder4_16 module
  decoder4_16 uut (
    .in(in),
    .enable(enable),
    .out(out)
  );

  initial begin
    // Initialize inputs
    in = 4'b0000;
    enable = 1'b1;
    #10; // Wait for 10 time units

    in = 4'b0001;
    #10;

    in = 4'b0010;
    #10;

    in = 4'b0011;
    #10;

    in = 4'b0100;
    #10;

    in = 4'b0101;
    #10;

    in = 4'b0110;
    #10;

    in = 4'b0111;
    #10;

    in = 4'b1000;
    #10;

    in = 4'b1001;
    #10;

    in = 4'b1010;
    #10;

    in = 4'b1011;
    #10;

    in = 4'b1100;
    #10;

    in = 4'b1101;
    #10;

    in = 4'b1110;
    #10;

    in = 4'b1111;
    #10;

    $finish; // End the simulation
  end

  initial begin
    $monitor("time = %0d, in = %b, enable = %b, out = %b", $time, in, enable, out);
  end

  initial begin
    $dumpfile("decoder4_16_tb.vcd");
    $dumpvars(0, tb_decoder4_16);
  end
endmodule