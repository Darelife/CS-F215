module tff_asynch_reset(input clk, input reset, input t, output reg q);
    
always @ (posedge clk or posedge reset) begin
    if (reset) q <= 1'b0;
    else begin
        if (t) q <= ~q;
        else q <= q; 
    end
end

endmodule