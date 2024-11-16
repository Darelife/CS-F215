`include "FSM.v"
module tb_fsm;
    reg clk;
    reg reset;
    reg X;
    wire Y;
    FSM fsm (X,clk,Y,reset);
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        reset = 1;
        X = 0;

        #10 reset = 0; 

        // Apply bit stream: '0010010'
        #10 X = 0; 
        #10 X = 0;
        #10 X = 1;  // Detected '1' (start of pattern)
        #10 X = 0;  // Detected '0' (pattern '10')
        #10 X = 0;  
        #10 X = 1;  // Detected '1' (start of pattern)
        #10 X = 0;  // Detected '0' (pattern '10')
        #10 $finish;
    end
    initial begin
        $monitor("At time %0t: X = %b, Y = %b", $time, X, Y);
    end
endmodule
