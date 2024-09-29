module jk (
  input J,
  input K,
  input clk,
  input reset,
  output reg Q,
  output reg Qbar
);
  
  always @(posedge clk or posedge reset) begin
    if (reset) begin Q <= 0; Qbar <= 1; end
    else begin
      case ({J,K})
        2'b00: begin Q<=Q; Qbar<=Qbar; end
        2'b11: begin Q<=~Q; Qbar<=~Qbar; end
        // default case
        default: begin Q<=J; Qbar<=K; end
      endcase
    end
  end

endmodule