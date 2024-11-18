`include "jkff.v"

module r1 (
  input clk,
  input reset,
  output reg [3:0] out,
  output reg tick
);
  wire ta,tb,tc,td;

  always @(negedge clk, negedge reset) begin
    if (!reset) begin out <= 4'b0000; tick <= 0; end 
    else
      case (out)
        4'b0000: begin out <= 4'b0001; end
        4'b0001: out <= 4'b0010;
        4'b0010: out <= 4'b0011;
        4'b0011: out <= 4'b0100;
        4'b0100: out <= 4'b0101;
        4'b0101: out <= 4'b0110;
        4'b0110: out <= 4'b0111;
        4'b0111: out <= 4'b1000;
        4'b1000: begin out <= 4'b1001; tick <= 1; end
        4'b1001: begin out <= 4'b0000; tick <= 0; end// Reset after 9
        default: out <= 4'b0000;
      endcase
  end

endmodule