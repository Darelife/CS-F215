`include "register.v"
module parallel_struc(input load, input clk, input rst, input [3:0] I, output [3:0]A);
    wire [3:0] I_new;

    assign I_new[0] = load & I[0] | ~load & A[0];
    assign I_new[1] = load & I[1] | ~load & A[1];
    assign I_new[2] = load & I[2] | ~load & A[2];
    assign I_new[3] = load & I[3] | ~load & A[3];

    register r(clk,rst,I_new,A);
endmodule