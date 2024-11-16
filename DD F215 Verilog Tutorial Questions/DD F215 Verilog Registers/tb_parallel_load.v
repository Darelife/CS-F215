`include "parallel_load.v"
module t_parallel();
    wire [3:0]A;
    reg [3:0]I;
    reg rst,load;

    parallel p1(load,clk,rst,I,A);

    reg clk = 1'b0;

    always #5 clk = ~clk;

    initial begin
        $dumpfile("parallel.vcd");
        $dumpvars(0,t_parallel);

        rst=1'b0; I=4'b0110; load=1;
        #2 rst = 1'b1; load = 0;
        #10 load=1'b1;
        #10 load=1'b0; I=4'b1010;
        #10 load=1'b1;
        #10 load=1'b0;
        $finish; 
    end

    initial begin
        $monitor("Time=%0d, Clk=%b, Rst=%b, Load=%b, I=%b, A=%b",$time,clk,rst,load,I,A);
    end
endmodule