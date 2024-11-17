`include "rud.v"
`timescale 1ns/1ps

module tr;
    // Testbench signals
    reg clk;
    reg reset;
    reg m;
    wire [2:0] out;

    // Instantiate the ripple counter
    rud uut (
        .clk(clk),
        .reset(reset),
        .m(m),
        .out(out)
    );

    always #5 clk = ~clk;

    // Test sequence
    initial begin
        clk = 0; reset = 1; m = 0;
        #10
        reset = 0; 
        #10 reset = 1;

        #200

        m = 1;
        #200
        $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time = %0d, clk = %b, m = %b, reset = %b, out = %b", $time, clk, m, reset, out);
    end
endmodule
