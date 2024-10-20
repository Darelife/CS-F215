module dff (
  input clk,
  input reset,
  input D,
  output Q
);
// active low reset
  always @(posedge clk, negedge reset) begin
    if (~reset) Q<=0;
    else Q<=D;
  end
endmodule