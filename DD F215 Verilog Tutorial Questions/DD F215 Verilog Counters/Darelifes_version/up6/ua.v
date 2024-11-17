module ua (
  input clk,
  input reset,
  output reg [2:0] q
);
  //async -> 6

  always @(negedge clk, negedge reset) begin
    if (!reset) q<=0;
    else if (q == 5) q<=0;
    else q<=q+1;
  end 
endmodule