module mod10_counter (
    input wire clk,
    input wire rst,
    output reg [3:0] count
);
    always @(negedge clk or negedge rst) begin
        if (!rst) begin
            
            count <= 4'b0000;
        end
        else begin
            
            if (count == 4'b1001)
                count <= 4'b0000;
            else
                count <= count + 1'b1;
        end
    end
    
endmodule