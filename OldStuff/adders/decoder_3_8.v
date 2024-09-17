module decoder3to8 (
  input [2:0] A,   // 3-bit input
  output [7:0] Y   // 8-bit output
);

  // Decode logic: Each output line corresponds to one input combination
  assign Y[0] = (~A[2] & ~A[1] & ~A[0]);  // Output Y0 is 1 when A = 000
  assign Y[1] = (~A[2] & ~A[1] &  A[0]);  // Output Y1 is 1 when A = 001
  assign Y[2] = (~A[2] &  A[1] & ~A[0]);  // Output Y2 is 1 when A = 010
  assign Y[3] = (~A[2] &  A[1] &  A[0]);  // Output Y3 is 1 when A = 011
  assign Y[4] = ( A[2] & ~A[1] & ~A[0]);  // Output Y4 is 1 when A = 100
  assign Y[5] = ( A[2] & ~A[1] &  A[0]);  // Output Y5 is 1 when A = 101
  assign Y[6] = ( A[2] &  A[1] & ~A[0]);  // Output Y6 is 1 when A = 110
  assign Y[7] = ( A[2] &  A[1] &  A[0]);  // Output Y7 is 1 when A = 111

endmodule