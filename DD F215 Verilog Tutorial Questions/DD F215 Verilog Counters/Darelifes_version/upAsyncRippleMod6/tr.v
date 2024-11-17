`include "ripple.v"
`timescale 1ns/1ps

module tr;
    // Testbench signals
    reg clk;
    reg reset;
    wire [2:0] out;

    // Instantiate the ripple counter
    ripple uut (
        .clk(clk),
        .reset(reset),
        .out(out)
    );

    always #5 clk = ~clk;

    // Test sequence
    initial begin
        clk = 0; reset = 1;
        #10
        reset = 0; 
        #10 reset = 1;

        #200
        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time = %0d, clk = %b, reset = %b, out = %b", $time, clk, reset, out);
    end
endmodule
