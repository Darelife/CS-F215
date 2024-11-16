`include "adder_4bit.v"

module adder_subtract (input [3:0]A, input[3:0]B, input CTR,output [3:0]S, output sign,output c1);
    // Write your code here
wire [3:0]W;
wire [3:0]Z;
wire k;

xor x1(W[0], CTR, B[0]);
xor x2(W[1], CTR, B[1]);
xor x3(W[2], CTR, B[2]);
xor x4(W[3], CTR, B[3]);

adder A1(A, W, CTR, Z, k);

wire w1, w2, w3;

not n1(w1, CTR);
not n2(w2, k);

and a1(c1, k, w1);
and a2(sign, CTR, w2);

wire [3:0]X;

xor x1(X[0], sign, Z[0]);
xor x2(X[1], sign, Z[1]);
xor x3(X[2], sign, Z[2]);
xor x4(X[3], sign, Z[3]);

adder A2(X, 4'b0000, sign, S, w3);

endmodule