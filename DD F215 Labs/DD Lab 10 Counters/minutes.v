module Minutes(
    input wire clk,
    input wire reset,
    input wire tick_in,    // Tick from Seconds module
    output reg [5:0] minutes,
    output reg tick_out    // Tick to Hours module
);

always @ (posedge clk or posedge reset) begin
    if (reset) begin
        minutes <= 6'b000000;
    end
    else if (minutes == 6'b011111 && tick_in) begin
        minutes <= 6'b000000;
    end
    else if (tick_in) begin
        minutes <= minutes + 1'b1;
    end

    tick_out <= 1'b0;

    if (minutes == 6'b011111) tick_out <= 1'b1;
end

endmodule
