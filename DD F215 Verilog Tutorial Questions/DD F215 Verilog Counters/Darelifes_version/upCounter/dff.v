module dff (
  input clk,
  input reset,
  input d,
  output reg q
);
  always @(negedge clk, negedge reset) begin
    if (!reset) q <= 0;
    else q<=d;
  end
endmodule