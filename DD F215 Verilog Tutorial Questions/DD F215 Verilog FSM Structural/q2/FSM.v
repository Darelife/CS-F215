`include "jkff.v"
module FSM(input x,input clk, output reg y,input reset);
wire Q,out;
wire J,K;
assign J=x;
assign K=~x;
jkff ff1(J,K,clk,Q,reset);
//y is register so can't assign it outside always block
always@(Q,x) y=Q&~x;
endmodule
