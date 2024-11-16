`include "tff_asr.v"

module tff_async_reset_tb;

    reg clk;
    reg reset;
    reg t;
    wire q;

    tff uut (
        .clk(clk),
        .reset(reset),
        .t(t),
        .q(q)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0; reset = 0; t = 0;
        $dumpfile("tff_async_reset_tb.vcd");
        $dumpvars(0, tff_async_reset_tb);

        reset = 1; t = 1;#20; reset = 0;

        t = 1; #40;
        t = 0; #40;
        t = 1; #40;

        reset = 1; #20; reset = 0;

        t = 1; #40;

        $finish;
    end

    initial begin
        $monitor("Time: %0t | clk: %b | reset: %b | t: %b | q: %b", $time, clk, reset, t, q);
    end

endmodule
