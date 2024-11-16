`include "decoder_4to16.v"
module palindrome(input [4:0]in, output out);
// WRITE YOUR CODE HERE
wire [15:0]w1;
wire [3:0]w2;

or o2(w2[3], in[4]);
or o3(w2[2], in[3]);
or o4(w2[1], in[1]);
or o5(w2[0], in[0]);

decoder_4to16 d1(w2, 1'b1, w1);

or o1(out, w1[15], w1[9], w1[6], w1[0]);

endmodule