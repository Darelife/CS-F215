`include "enc.v"
module tb_enc();
    wire [3:0] A;
    wire out;
    reg set,in;
    reg clk=1'b0;
    encrypter e1(clk,set,in,A,out);
    always #5 clk=~clk;
    initial begin
        $dumpfile("enc.vcd");
        $dumpvars(0,tb_enc);

        //WRITE YOUR CODE HERE 

        set = 1'b1;
        #10 set = 1'b0; in = 1'b1;
        #10 in = 1'b0;
        #10 in = 1'b1;
        #10 in = 1'b1;
        #10 in = 1'b0;

        $finish;
    end
    initial begin
        $monitor("Time=%0d, Clk=%b, set=%b, inp=%b, out=%b",$time,clk,set,in,out);
    end
endmodule