`include "Q1.v" 

module testbench();
    reg clk;
    reg reset;
    reg in;
    wire out;


    FSM f(clk, reset, in, out);
    
    always begin
        #5 clk = ~clk; 
    end

    initial begin
        $dumpfile("out.vcd");
        $dumpvars(0, testbench);
        clk = 0; 
        reset = 1; 
        in = 0;

       
        #10 reset = 0; in = 0;

        #10 in = 1; 

        #10 in = 0; 

        #10 in = 1; 

        #10 in = 1; 

        #10 $finish;
    end

    initial begin
        $monitor("Time = %0t, reset = %b, in = %b, state = %b, out = %b", $time, reset, in, f.state, out);
    end

endmodule
