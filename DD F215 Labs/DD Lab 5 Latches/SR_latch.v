module SR_latch(input S, input R, input enable, output reg Q, output reg Qbar);
// WRITE YOUR CODE HERE
always @ (S, R, enable) begin
    if (enable) begin
        if (S && !R) begin
            Q = 0;
            Qbar = 1;
        end
        else if (!S && R) begin
            Q = 1;
            Qbar = 0;
        end
        else if (S && R) begin
            Q = Q;
            Qbar = Qbar;
        end
        else begin
            Q = 1;
            Qbar = 1;
        end        
    end
end

endmodule