module seven_segment (
    input [3:0] digit,
    output reg [6:0] segments
);

always @(digit) begin
    case (digit)
    4'b0000: segments <= 7'b0111111;
    4'b0001: segments <= 7'b0000110;
    4'b0010: segments <= 7'b1011011;
    4'b0011: segments <= 7'b1001111;
    4'b0100: segments <= 7'b1100110;
    4'b0101: segments <= 7'b1101101;
    4'b0110: segments <= 7'b1111101;
    4'b0111: segments <= 7'b0000111;
    4'b1000: segments <= 7'b1111111;
    4'b1001: segments <= 7'b1101111;
    endcase
end

endmodule