`include "halfAdder.v"
module fullAdder( input A, input B, input Cin, output sum, output Cout );
  wire sum1, carry1, carry2;
  half_adder HA1(.A(A), .B(B), .S(sum1), .C1(carry1));
  half_adder HA2(.A(sum1), .B(Cin), .S(sum), .C1(carry2));
  or o1(Cout, carry1, carry2);
endmodule