`include "mod16_behav.v"

module mod10_counter (
    input wire clk,
    input wire rst,
    output wire [3:0] q
);

wire count10, internal_reset;

assign count10 = (q[3] & ~q[2] & q[1] & q[0]);
assign internal_reset = rst | ~count10;

mod16_counter counter(clk, internal_reset, q);
    
endmodule
