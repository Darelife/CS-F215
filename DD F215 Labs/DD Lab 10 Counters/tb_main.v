`timescale 1ns / 1ps
`include "main_module.v"
module testbench;

    // Inputs
    reg clk;
    reg reset;

    // Outputs
    wire [6:0] seg1;
    wire [6:0] seg2;
    wire [6:0] seg3;
    wire [6:0] seg4;
    wire [6:0] seg5;
    wire [6:0] seg6;

    // Instantiate the Unit Under Test (UUT)
    main_module uut (
        .clk(clk),
        .reset(reset),
        .seg1(seg1),
        .seg2(seg2),
        .seg3(seg3),
        .seg4(seg4),
        .seg5(seg5),
        .seg6(seg6)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        reset = 0;

        // Apply reset
        reset = 1;
        #10;
        reset = 0;

        // Wait for some time to observe the outputs
        #1000;

        // Finish simulation
        $finish;
    end

    // Clock generation
    always #1 clk = ~clk;

    // Monitor outputs
    initial begin
        $monitor("%b,%b,%b,%b,%b,%b", 
                  seg1, seg2, seg3, seg4, seg5, seg6);
    end

    // Dump file
    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0, testbench);
    end

endmodule