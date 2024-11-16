`include "dff.v"
module dff_tb;
    reg clk, d;
    wire q;

    dff dut (
        .clk(clk),
        .d(d),
        .q(q)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Testbench stimulus
    initial begin
        $dumpfile("dff_tb.vcd");
        $dumpvars(0, dff_tb);

        clk = 0;
        d = 0;

        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;

        #20 $finish;
    end
endmodule