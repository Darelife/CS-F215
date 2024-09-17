`include "fourBitAdder.v"

module fourBitAdder(input [3:0] A, B, input ctrl, output [3:0] S, output Cout, output initialCout);
  wire [3:0] B_xor_ctrl;
  // wire C1, C2, C3;

  assign B_xor_ctrl = B ^ {4{ctrl}};

  wire [3:0] tempAns;
  wire tempCout;

  fourBitAdd add1(.A(A), .B(B_xor_ctrl), .Cin(ctrl), .Cout(tempCout), .S(tempAns));
  wire tempCout1;
  and and1(tempCout1, !tempCout, ctrl);
  wire [3:0] B_xor_final;
  assign B_xor_final = tempAns^{4{tempCout1}};
  wire [3:0] A_new;
  assign initialCout = tempCout1;
  // assign A_new = {4{0}};
  fourBitAdd add2(.A(4'b0000), .B(B_xor_final), .Cin(tempCout1), .Cout(Cout), .S(S));

  // fullAdder adder0 (.A(A[0]), .B(B_xor_ctrl[0]), .Cin(ctrl), .sum(S[0]), .Cout(C1));

  // fullAdder adder1 (.A(A[1]), .B(B_xor_ctrl[1]), .Cin(C1), .sum(S[1]), .Cout(C2));

  // fullAdder adder2 (.A(A[2]), .B(B_xor_ctrl[2]), .Cin(C2), .sum(S[2]), .Cout(C3));

  // fullAdder adder3 (.A(A[3]), .B(B_xor_ctrl[3]), .Cin(C3), .sum(S[3]), .Cout(Cout));

endmodule
