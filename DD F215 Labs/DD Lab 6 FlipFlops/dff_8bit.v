`include "dff_async.v"
module dff_async_8bit (input clk,input reset,input [7:0] d,output wire [7:0] q);
    // WRITE YOUR CODE HERE
    dff_async_reset d1(clk, reset, d[0], q[0]);
    dff_async_reset d2(clk, reset, d[1], q[1]);
    dff_async_reset d3(clk, reset, d[2], q[2]);
    dff_async_reset d4(clk, reset, d[3], q[3]);
    dff_async_reset d5(clk, reset, d[4], q[4]);
    dff_async_reset d6(clk, reset, d[5], q[5]);
    dff_async_reset d7(clk, reset, d[6], q[6]);
    dff_async_reset d8(clk, reset, d[7], q[7]);
endmodule
