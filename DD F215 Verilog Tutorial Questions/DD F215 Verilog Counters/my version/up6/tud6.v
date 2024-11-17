`include "ud6.v"
module tua;
  reg clk;
  reg reset;
  reg m;
  wire [2:0] q;

  ud6 uuuuuuuuuuu(clk, reset, m, q);

  always #5 clk = ~clk;

  initial begin
    reset = 0; clk = 0;
    m = 1;
    #10 reset = 1;

    #200
    m = 0;
    #200

    $finish;
  end

  initial begin
    $monitor("At time t = %t, clk = %b, m = %b, reset = %b, q = %b = %d", $time, clk, m, reset, q, q);
  end

endmodule