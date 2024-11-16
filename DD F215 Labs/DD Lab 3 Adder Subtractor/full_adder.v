`include "half_adder.v"
module full_adder (input A,input B,input Cin,output Sum,output Cout);
//Write your code here
wire w1, w2, w3;

half_adder h1(A, B, w1, w2);
half_adder h2(w2, Cin, w3, Sum);
or o1(Cout, w3, w1);

endmodule