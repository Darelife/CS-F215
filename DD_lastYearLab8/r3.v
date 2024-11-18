module r3 (
  input clk,
  input reset,
  output reg out
);
  always @(negedge clk, negedge reset) begin
    if (!reset) out <= 0;
    else out <= ~out;
  end
endmodule