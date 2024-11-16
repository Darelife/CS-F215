`include "full_adder.v"

module adder (input [3:0] A, input [3:0] B, input Cin,output [3:0] S,output Cout);
    // Write your code here
wire w1, w2, w3;

full_adder f1(A[0], B[0], Cin, S[0], w1);
full_adder f2(A[1], B[1], w1, S[1], w2);
full_adder f3(A[2], B[2], w2, S[2], w3);
full_adder f4(A[3], B[3], w3, S[3], Cout);

endmodule