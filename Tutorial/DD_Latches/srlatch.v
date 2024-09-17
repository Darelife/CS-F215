module sr_latch (
  input S,R, enable,
  output reg Q, Q_n
);

  always @(R or S or enable) begin if (enable) begin
      // if (R && !S) begin Q <= S; Q_n <= R; end 
      // else if (!R && S) begin Q <= S; Q_n <= R; end
      // else if (R && S) begin Q <= !S; Q_n <= !R; end
      // else begin Q <= Q; Q_n <= Q_n; end end end
      case ({R,S})
        2'b00: begin Q = Q; Q_n = Q_n; end
        2'b01: begin Q = 1; Q_n = 0; end
        2'b10: begin Q = 0; Q_n = 1; end
        2'b11: begin Q = Q; Q_n = Q_n; end
      endcase end end

endmodule