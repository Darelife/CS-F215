`include "dff_async.v"

module dff_async_reset_tb;
    reg clk, reset, d;
    wire q;

    //WRITE YOUR CODE HERE
    dff_async_reset d1(clk, reset, d, q);

    always #5 clk = ~clk;

    initial begin
    
    $dumpfile("dff.vcd");
    $dumpvars(0, dff_async_reset_tb);

    clk = 0; reset = 1; d = 0;
    #10 reset = 1; d = 1;
    #10 reset = 1; d = 0;
    #10 reset = 1; d = 1;
    #7 reset = 0; d = 1;
    #6 reset = 1; d = 1;
    #10 reset = 1; d = 0;
    #7 reset = 1; d = 1;
    #10 reset = 1; d = 1;

    #10 $finish;

    end

    // DO NOT EDIT THIS BLOCK
    initial begin
        $monitor("Time: %0d, clk: %b, reset: %b, d: %b, q: %b", $time,clk, reset, d, q);
    end
endmodule
