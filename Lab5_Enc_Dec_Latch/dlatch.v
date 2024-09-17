module dLatch (
  input D, enable,
  output reg Q
);
  always@(D or enable) begin
    if (enable) begin Q <= D; end
  end
endmodule