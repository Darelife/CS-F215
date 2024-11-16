`include "error1.v"
module JK_FlipFlop_tb;
    // Inputs
    reg J;
    reg K;
    reg clk;
    reg reset;

    // Outputs
    wire Q;
    wire Qbar;

    // Instantiate the JK Flip-Flop
    JK_FlipFlop uut (
        .J(J),
        .K(K),
        .clk(clk),
        .reset(reset),
        .Q(Q),
        .Qbar(Qbar)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        // Initialize Inputs
        J = 0;
        K = 0;
        clk = 0;
        reset = 0;

        // Apply reset
        reset = 1;
        #10;
        reset = 0;

        // Test JK inputs
        J = 0; K = 0; // No change
        #10;
        J = 0; K = 1; // Reset
        #10;
        J = 1; K = 0; // Set
        #10;
        J = 1; K = 1; // Toggle
        #10;
        J = 1; K = 1; // Toggle again
        #10;
        // End of test
        $finish;
    end
    // Monitor the outputs
    initial begin
        $monitor("At time %t: J = %b, K = %b, clk = %b, reset = %b, Q = %b", $time, J, K, clk, reset, Q);
    end
endmodule
