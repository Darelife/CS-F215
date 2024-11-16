module half_adder(input A,input B,output Cout,output Sum);
//Write your code here

xor x1(Sum, A, B);
and a1(Cout, A, B);

endmodule