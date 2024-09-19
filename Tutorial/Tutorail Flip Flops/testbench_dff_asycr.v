`include "dff_asycr.v"
module dff_async_reset_tb;
    reg clk, reset, d;
    wire q;

    dff_async_reset dut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Testbench stimulus
    initial begin
        $dumpfile("dff_async_reset_tb.vcd");
        $dumpvars(0, dff_async_reset_tb);

        clk = 0;
        reset = 0;
        d = 0;

        #10 d = 1;
        #10 d = 0;
        #10 d = 1;

        #7 reset = 1;  // Asynchronous reset
        #6 reset = 0;

        #10 d = 0;
        #10 d = 1;

        #20 $finish;
    end
endmodule