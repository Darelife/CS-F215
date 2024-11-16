`include "tff_asynch_reset.v"
module t_flip_flop_tb;
 
    reg clk;
    reg reset;
    reg t;
    wire q;

    tff_asynch_reset uut (
        .clk(clk), 
        .reset(reset), 
        .t(t), 
        .q(q)
    );

    always #5 clk = ~clk;  

    
    initial begin
        $dumpfile("out_tff_asynch_reset.vcd");
        $dumpvars(0, t_flip_flop_tb);
        clk = 0;
        reset = 1;
        t = 0;

        #10;
        reset = 0;

        // Test case 1: T = 0
        #10 t = 0;
        #10 t = 0;

        // Test case 2: T = 1
        #10 t = 1;
        #10 t = 1;

        // Test case 3: Alternating T
        #10 t = 0;
        #10 t = 1;
        #10 t = 0;
        #10 t = 1;

        // Test case 4: Reset during operation
        #10 t = 1;
        #5 reset = 1;
        #5 reset = 0;


        #20 $finish;
    end

    initial begin
        $monitor("Time: %0t, reset: %b, t: %b, q: %b", $time, reset, t, q);
    end

endmodule