`include "mod16_behav.v"

module mod10_counter (
    input wire clk,
    input wire rst,
    output wire [3:0] q
);
    
    wire internal_rst;
    wire count_10;
    wire [3:0] mod16_count;
    
    assign count_10 = (mod16_count[3] & ~mod16_count[2] & mod16_count[1] & ~mod16_count[0]);
    
    assign internal_rst = rst & ~count_10;
    
    
    mod16_counter mod16 (
        .clk(clk),
        .rst(internal_rst),
        .q(mod16_count)
    );
    
    
    assign q = mod16_count;
    
endmodule
