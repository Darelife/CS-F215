module JK(input J,input K,input clk,input reset,output reg Q);
//WRITE YOUR CODE HERE

always @ (posedge clk or posedge reset) begin
    if (reset) Q <= 1'b0;
    else begin
        if (!J && K) Q <= 1'b0;
        else if (J && !K) Q <= 1'b1;
        else if (J && K) Q <= ~Q;
        else Q <= Q;
    end
end

endmodule