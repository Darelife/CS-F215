`include "lfsr.v"
module tb_lfsr();
    wire [3:0] A;
    reg set;
    reg clk=1'b0;
    lfsr l1(clk,set,A);
    always #5 clk=~clk;
    initial begin
        $dumpfile("lfsr.vcd");
        $dumpvars(0,tb_lfsr);
        set=1'b1;
        #10;
        set=1'b0;
        #50;
        $finish;
    end
    
    initial begin
        $monitor("Time=%0d, Clk=%b, set=%b, A=%b",$time,clk,set,A);
    end
endmodule