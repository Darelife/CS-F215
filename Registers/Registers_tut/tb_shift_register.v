`include "shift_register.v"
module tb_shift();
    wire [3:0] A;
    reg clear,SI;
    shift s1(SI,clk,clear,A);
    reg clk=1'b0;
    always #5 clk=~clk;
    initial begin
        $dumpfile("simple_shift.vcd");
        $dumpvars(0,tb_shift);
        clear=1'b1;SI=1'b0;
        #10;
        clear=1'b0;SI=1'b1;
        #20;
        $finish;
        clear=1'b0;
    end
    initial begin
        $monitor("Time=%0d, Clk=%b, Clear=%b, SI=%b, A=%b",$time,clk,clear,SI,A);
    end
endmodule