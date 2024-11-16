module JK_FlipFlop (
    input J,
    input K,
    input clk,
    input reset,
    output reg Q,
    output reg Qbar
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        Q <= 0;  // Reset the flip-flop
        Qbar <= 1;
    end
    else begin
        case ({J, K})
        //Non-blocking assignments
            2'b00: begin
                Q <= Q;
                Qbar <= Qbar;
            end     // No change
            2'b01: begin
                Q <= 0;
                Q <= 0;
                Qbar <= 1;
            end     // Reset
            2'b10: begin 
            Q <= 1;
            Qbar <= 0;                
            end  // Set
            2'b11: begin
            Q <= ~Q;
            Qbar <= ~Qbar;    // Toggle
            end
        endcase
    end
end
endmodule