`include "clock.v"
`include "display.v"
module main_module (
    input wire clk,
    input wire reset,
    output wire [6:0] seg1, seg2, seg3, seg4, seg5, seg6
);

wire [6:0]seconds;
wire [5:0]minutes;
wire [4:0]hours;

Clock c1(clk, reset, seconds, minutes, hours);
display d1(seconds, minutes, hours, seg1, seg2, seg3, seg4, seg5, seg6);

endmodule