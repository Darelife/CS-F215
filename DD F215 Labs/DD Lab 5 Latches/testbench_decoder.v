`include "decoder_4to16.v"

module testbench_decoder();
    reg [3:0] A;
    reg enable;
    wire [15:0] out;

    //WRITE YOUR CODE HERE
    decoder_4to16 d1(A, enable, out);
    initial begin
        $dumpfile("out.vcd");
        $dumpvars(0, testbench_decoder);
    enable = 0; A = 4'b0000;
    #5 enable = 1; A = 4'b0000;
    #5 enable = 1; A = 4'b0010;
    #5 enable = 1; A = 4'b0100;
    #5 enable = 1; A = 4'b0111;
    #5 enable = 0; A = 4'b1001;
    #5 enable = 1; A = 4'b1001;
    #5 enable = 1; A = 4'b1110;
    #5 enable = 0; A = 4'b1010;
    #1 $finish;
    end




    // DO NOT EDIT THIS BLOCK
    initial begin
        $monitor("Time: %0d, Enable: %d, A: %4b, Output: %16b", $time, enable, A, out);
    end
endmodule
