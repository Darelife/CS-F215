module ua (
  input clk,
  input reset,
  input m,
  output reg [2:0] q
);
  //async -> 6
  // m -> up
  always @(negedge clk, negedge reset) begin
    if (!reset) q<=0;
    else if (q == 5 & m == 1) q<=0;
    else if (q == 0 & m == 0) q<=5;
    else if (m == 1) q<=q+1;
    else if (m == 0) q<=q-1;
  end 
endmodule