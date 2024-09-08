//* Make a 4:1 mux using 3 2:1 mux's (AND, NOT, and OR)
//* A0*S' + A1*S

module mux2_1 (
  input [1:0] in, input select, output out
);
  wire a1,a2, n_s;
  not n1(n_s, select);
  and and1(a1, n_s, in[0]);
  and and2(a2, select, in[1]);
  or out1(out, a1,a2);
endmodule