module d_latch (input D,output reg Q,input enable);
  // assign Q_n = ~Q;
  always @(enable or D)
    begin
      // if(enable) Q <= D;
      if(enable) Q = D;
      // both of them have the same output
    end

endmodule