`include "seconds.v"
`include "minutes.v"
`include "hours.v"
module Clock(
    input wire clk,
    input wire reset,
    output wire [6:0] seconds,
    output wire [5:0] minutes,
    output wire [4:0] hours
);

wire tick_sec_out, tick_min_out;

Seconds s1(clk, reset, seconds, tick_sec_out);
Minutes m1(clk, reset, tick_sec_out, minutes, tick_min_out);
Hours h1(clk, reset, tick_min_out, tick_sec_out, hours);

endmodule
