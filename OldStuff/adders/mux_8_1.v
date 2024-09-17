module mux8to1 (
  input [7:0] D,     // 8 data inputs
  input [2:0] sel,   // 3-bit select line
  output Y           // Output
);

  assign Y = (sel == 3'b000) ? D[0] :
             (sel == 3'b001) ? D[1] :
             (sel == 3'b010) ? D[2] :
             (sel == 3'b011) ? D[3] :
             (sel == 3'b100) ? D[4] :
             (sel == 3'b101) ? D[5] :
             (sel == 3'b110) ? D[6] :
                               D[7];

endmodule