`include "universal_shift_register.v"
module t_shift();
    reg [3:0]I_par;
    reg s1,s0,rst,MSB_in,LSB_in;
    wire [3:0]A_par;
    universal_shift S1(I_par,clk,rst,s1,s0,MSB_in,LSB_in,A_par);
    reg clk=1'b0;
    always #5 clk=~clk;
    initial begin
        $dumpfile("universal_shift.vcd");
        $dumpvars(0,t_shift);
        I_par=4'b1011;MSB_in=1'b1;LSB_in=1'b1;s1=1'b1;s0=1'b0;
        rst=1'b1;
        #15;
        rst=1'b0;
        #10;
        s1=1'b0;s0=1'b0;
        #10;
        s1=1'b0;s0=1'b1;
        #10;
        s1=1'b1;s0=1'b1;
        #10;
        $finish;
        rst=1'b0;
    end
    initial begin
        $monitor("Time=%0d, Clk=%b, Rst=%b, MSB_in=%b, LSB_in=%b, s1=%b, s0=%b, A_par=%b",$time,clk,rst,MSB_in,LSB_in,s1,s0,A_par);
    end
endmodule
