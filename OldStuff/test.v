// module func(out,A,B);
// output out;
// input A, B;
// assign out = (A && (!B)) || ((!A) && B);
// endmodule

// A'B'C + CD'AB + AB
module func2(out, A,B,C,D);
  output out;
  input A,B,C,D;
  wire w1,w2,w3;
  and a1(w1, !A, !B, C);
  and a2(w2, C, !D, A, B);
  and a3(w3, A, B);
  or o1(out, w1,w2,w3);
endmodule