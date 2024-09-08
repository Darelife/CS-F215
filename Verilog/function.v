module func (out, A, B);

output out;
input A, B;

assign out = (A && (!B)) || ((!A) && B);

endmodule