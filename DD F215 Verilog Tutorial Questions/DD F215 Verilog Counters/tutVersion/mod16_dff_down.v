`include "dff.v"
module mod16_counter (
    input wire clk,   
    input wire rst,   
    output wire [3:0] q 
);


wire [3:0] d;

dff_negedge_reset dff0 (.clk(clk), .rst(rst), .d(d[0]), .q(q[0]));
dff_negedge_reset dff1 (.clk(~q[0]), .rst(rst), .d(d[1]), .q(q[1]));
dff_negedge_reset dff2 (.clk(~q[1]), .rst(rst), .d(d[2]), .q(q[2]));
dff_negedge_reset dff3 (.clk(~q[2]), .rst(rst), .d(d[3]), .q(q[3]));


assign d[0] = ~q[0];
assign d[1] = ~q[1];
assign d[2] = ~q[2];
assign d[3] = ~q[3];

endmodule