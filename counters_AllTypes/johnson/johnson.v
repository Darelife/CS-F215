module johnson (
    input clk,
    input reset,
    output reg [3:0] q
);

  // On the rising edge of the clock or reset
  always @(negedge clk, negedge reset) begin
    if (!reset)
      q <= 4'b0000;
    else
      q <= {~q[3], q[3:1]};  // Shift right
  end

endmodule
