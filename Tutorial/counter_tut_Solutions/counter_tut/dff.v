module dff_negedge_reset (
    input wire clk,   
    input wire rst,   
    input wire d,    
    output reg q      
);

always @(negedge clk or negedge rst) begin
    if (!rst)
        q <= 0;
    else
        q <= d;
end

endmodule
