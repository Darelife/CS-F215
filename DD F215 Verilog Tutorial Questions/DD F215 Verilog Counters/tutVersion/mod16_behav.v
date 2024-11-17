module mod16_counter (
    input wire clk,   
    input wire rst,   
    output reg [3:0] q 
);

always @(negedge clk or negedge rst) begin
    if (!rst)
        q <= 4'b0000; 
    else
        q <= q + 1;  
end

endmodule
