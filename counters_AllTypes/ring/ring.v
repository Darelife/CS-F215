module ring_counter (
    input clk,
    input reset,
    output reg [3:0] q
);

  // On the rising edge of the clock or reset
  always @(negedge clk or negedge reset) begin
    if (!reset)
      q <= 4'b0001;
    else
      q <= {q[2:0], q[3]};  // Shift left
  end

endmodule
