`include "mux_2to1_4bit.v"
module mux_4to1_4bit(input [3:0]in0,input [3:0]in1,input [3:0]in2,input [3:0]in3,input [1:0] select,output[3:0] out);
//Write your code here

wire [3:0]w1;
wire [3:0]w2;

mux_2to1_4bit m1(in0, in1, select[0], w1);
mux_2to1_4bit m2(in2, in3, select[0], w2);

mux_2to1_4bit m3(w1, w2, select[1], out);

//End of your code
endmodule