`include "register.v"
module t_reg();
    wire [3:0] A_par;
    reg [3:0] I_par;
    reg rst;

    register r1(clk,rst,I_par,A_par);

    reg clk=1'b0;

    always #5 clk=~clk;

    initial begin
        $dumpfile("register.vcd");
        $dumpvars(0,t_reg);

        rst=1'b1; 
        #2  rst = 1'b0; I_par = 4'b0010;
        #2 rst = 1'b1;
        #10 rst = 1'b1; I_par = 4'b1000;
        #10 I_par = 4'b1100;
        #10 I_par = 4'b1010;
        #10;
        $finish;
    end

    initial begin
        $monitor("Time=%0d, Clk=%b, Rst=%b, I_par=%b, A_par=%b",$time,clk,rst,I_par,A_par);
    end
endmodule