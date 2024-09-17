module mux2 (
  input [1:0] in,
  input select,
  output out
);
  wire a1, a2, n_s;
  not n1(n_s, select);
  and aa1(a1, n_s, in[0]);
  and aa2(a2, select, in[1]);
  or o1(out, a1, a2);
endmodule
