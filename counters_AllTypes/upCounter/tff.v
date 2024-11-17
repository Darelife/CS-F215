module ttf (
  input clk,
  input reset,
  input t,
  output reg q
);
  always @(negedge clk, negedge reset) begin
    if (!reset) q <= 0;
    else if (t) q<=~q;
  end
endmodule