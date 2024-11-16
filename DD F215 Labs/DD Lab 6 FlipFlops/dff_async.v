module dff_async_reset (input clk,input reset,input d,output reg q);
    // WRITE YOUR CODE HERE

    always @ (posedge clk or negedge reset) begin
        if (!reset) q <= 0;
        else q <= d;
    end

endmodule