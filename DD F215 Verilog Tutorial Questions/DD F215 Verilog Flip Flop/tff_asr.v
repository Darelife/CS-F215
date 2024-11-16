`include "dff_asycr.v"
module tff (
    input clk,
    input reset,
    input t,
    output q
);
    wire d;
    xor x1(d, q, t);
    dff_async_reset dff (clk, reset, d, q);  

endmodule

module tff_behavioral (input clk, 
input reset, 
input t, 
output reg q);

always @(posedge clk or posedge reset) begin
    if (reset)
        q<=1'b0;
    else if (t)
        q<=~q;
end

endmodule