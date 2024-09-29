module Q1 (
  input x,
  input reset,
  input clk,
  output reg y
);
  reg [1:0] state;
  reg [1:0] nextstate;
  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;

  always @(posedge clk, posedge reset) begin
    if (reset) state <= S0;
    else state <= nextstate;
  end

  always @(state, x) begin
    case (state)
      S0: begin
        if (!x) begin nextstate = S0; y = 1; end
        else begin nextstate = S1; y = 0; end
      end
      S1: begin
        if (!x) begin nextstate = S1; y = 0; end
        else begin nextstate = S2; y = 0; end
      end
      S2: begin
        if (!x) begin nextstate = S2; y = 0; end
        else begin nextstate = S0; y = 1; end
      end
    endcase
  end
endmodule