module r2 (
  input clk,
  input reset,
  output reg [1:0] out,
  output reg tick
);
  // wire ta,tb,tc,td;

  always @(negedge clk, negedge reset) begin
    if (!reset) begin out <= 4'b00; tick <= 0; end
    else
      case (out)
        2'b00:begin out<=2'b01; tick <= 0; end
        2'b01:begin out<=2'b10; tick <= 1; end
        2'b10:begin out<=2'b00; tick <= 0; end
      endcase
  end

endmodule