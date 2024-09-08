`include "adder.v"
module fourBitAdd(input[3:0] A, input[3:0] B, input Cin, output [3:0] S, output Cout);
  wire C1, C2, C3;

  fullAdder adder0 (.A(A[0]), .B(B[0]), .Cin(Cin), .sum(S[0]), .Cout(C1));

  fullAdder adder1 (.A(A[1]), .B(B[1]), .Cin(C1), .sum(S[1]), .Cout(C2));

  fullAdder adder2 (.A(A[2]), .B(B[2]), .Cin(C2), .sum(S[2]), .Cout(C3));

  fullAdder adder3 (.A(A[3]), .B(B[3]), .Cin(C3), .sum(S[3]), .Cout(Cout));
endmodule