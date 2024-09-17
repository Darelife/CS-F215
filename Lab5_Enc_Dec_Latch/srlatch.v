module srLatch (
  input S,R, enable,
  output reg Q, Q_n
);
  always @(R or S or enable) begin
    if (enable) begin
      if (R && S) begin Q <= !S; Q_n <= !R; end
      else if (!R && !S) begin Q<=Q; Q_n <= Q_n; end
      else begin Q<=S; Q_n <= R; end
    end    
  end
endmodule