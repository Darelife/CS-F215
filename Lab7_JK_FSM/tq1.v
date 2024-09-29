`include "q1.v"
module tq1;
  reg x, reset, clk;
  wire y;
  Q1 q11(x, reset, clk, y);

  always #5 clk = ~clk;

  initial begin
    clk = 0; reset = 1; x = 0;
    #10 reset = 0;

    x = 0; #10
    x = 1; #10
    x = 0; #10
    x = 1; #10
    x = 1; #10
    $finish;
  end

  initial $monitor("clk = %b, reset = %b, x = %b, y = %b", clk, reset, x, y);
endmodule