`include "decoder3_8.v"

module decoder4_16 (
  input [3:0] in,
  input enable,
  output [15:0] out
);
  wire n_w;
  not not_1(n_w, in[3]);  
  decoder3_8 uut1 (
    .in(in[2:0]),
    .enable(n_w),
    .out(out[7:0])
  );
  decoder3_8 uut2 (
    .in(in[2:0]),
    .enable(in[3]),
    .out(out[15:8])
  );
endmodule