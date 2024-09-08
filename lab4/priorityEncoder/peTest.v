`timescale 1ns / 1ps
`include "pe.v"
module tb_pe;
  reg [3:0] in;
  wire [1:0] out;
  wire v;

  // Instantiate the pe module
  pe uut (
    .in(in),
    .out(out),
    .v(v)
  );

  initial begin
    // Initialize inputs
    in = 4'b0000;
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
    $monitor("time = %0d, in = %b, out = %b, v = %b", $time, in, out, v);
  end

  initial begin
    $dumpfile("pe_tb.vcd");
    $dumpvars(0, tb_pe);
  end
endmodule