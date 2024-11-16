`include "seven_segment.v"
module display(
    input wire [6:0] ss, // seconds
    input wire [5:0] mm, // minutes
    input wire [4:0] hh, // hours
    output wire [6:0] seg1, seg2, seg3, seg4, seg5, seg6
);
wire [3:0]w1 = ss % 10;
wire [3:0]w2 = ss / 10;
wire [3:0]w3 = mm % 10;
wire [3:0]w4 = mm / 10;
wire [3:0]w5 = hh % 10;
wire [3:0]w6 = hh / 10;

seven_segment s1(w1, seg1);
seven_segment s2(w2, seg2);
seven_segment s3(w3, seg3);
seven_segment s4(w4, seg4);
seven_segment s5(w5, seg5);
seven_segment s6(w6, seg6);

endmodule
