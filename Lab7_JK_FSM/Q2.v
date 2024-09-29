module Q2(input clk, input reset, input in, output reg out);
reg[2:0] state;
reg[2:0] nextstate;
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S7 = 3'b101, S8 = 3'b110;

always @(posedge clk or posedge reset) begin
    if(reset) state <= S0;
    else state <= nextstate; end

always @(state, in) begin
    case(state)
        S0: begin
            if(!in) begin nextstate = S1; out = 1'b0; end
            else begin nextstate = S4; out = 1'b0; end end
        S1: begin
            if(!in) begin nextstate = S7; out = 1'b0; end
            else begin nextstate = S2; out = 1'b0; end end
        S2: begin
            if(!in) begin nextstate = S8; out = 1'b0; end
            else begin nextstate = S3; out = 1'b0; end end
        S3: begin
            if(!in) begin nextstate = S0; out = 1'b1; end
            else begin nextstate = S4; out = 1'b0; end end
        S4: begin
            if(!in) begin nextstate = S1; out = 1'b0; end
            else begin nextstate = S7; out = 1'b0; end end
        S7: begin
            if(!in) begin nextstate = S8; out = 1'b0; end
            else begin nextstate = S2; out = 1'b0; end end
        S8: begin
            if(!in) begin nextstate = S3; out = 1'b0; end
            else begin nextstate = S0; out = 1'b1; end end
        default: begin nextstate = S0; out = 1'b0; end
    endcase
end
endmodule