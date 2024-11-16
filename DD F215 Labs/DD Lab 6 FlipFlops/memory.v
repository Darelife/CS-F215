`include "dff_8bit.v"
`include "mux2_1.v"
module memory (input clk,input reset,input [7:0] user,input userinput,output wire [7:0] q);
    // WRITE YOUR CODE HERE

    wire [7:0]w;

    mux2to1_8bit m1(8'b11111111, user, userinput, w);
    dff_async_8bit d1(clk, reset, w, q);

endmodule