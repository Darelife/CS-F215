`include "tff_async_reset.v"
module fsm(input clk,input reset,input x, output reg [1:0] output_code);
    wire [2:0] a;
    wire ta,tb,tc;
    
    assign ta = (a[0] & ~x) | (a[2]) | (a[1] & a[0]);
    assign tb =  (a[1]) | (~a[2] & x);
    assign tc = (~a[2] & ~a[1] & ~a[0]) | (a[0] & x) | (a[2] & a[0]);

    tff_async_reset t1(clk,reset,tc,a[0]);
    tff_async_reset t2(clk,reset,tb,a[1]);
    tff_async_reset t3(clk,reset,ta,a[2]);

    always@(a,x)begin
        output_code[0] = a[1]&~a[0]&x;
        output_code[1] = a[2]&~a[0]&x;
    end

endmodule
