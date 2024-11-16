module Seconds(
    input wire clk,
    input wire reset,
    output reg [6:0] seconds,
    output reg tick
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            seconds <= 7'b0000000;
        end
        else if (seconds == 7'b0111111) begin
            seconds <= 7'b0000000;
        end
        else begin
            seconds <= seconds + 1'b1;
        end

        tick <= 1'b0;

        if (seconds == 7'b0111110) tick <= 1'b1;
    end
endmodule
