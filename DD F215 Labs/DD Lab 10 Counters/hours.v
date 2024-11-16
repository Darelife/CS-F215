module Hours(
    input wire clk,
    input wire reset,
    input wire tick_in_min,    // Tick from Minutes module
    input wire tick_in_sec,    // Tick from Minutes module
    output reg [4:0] hours
);

always @ (posedge clk or posedge reset) begin
    if (reset) begin
        hours <= 5'b00000;
    end
    else if (hours == 5'b01111 && tick_in_min && tick_in_sec) begin
        hours <= 5'b00000;
    end
    else if (tick_in_min && tick_in_sec) begin
        hours <= hours + 1'b1;
    end
end

endmodule
