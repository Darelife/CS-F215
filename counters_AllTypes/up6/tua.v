`include "ua.v"
module tua;
  reg clk;
  reg reset;
  wire [2:0] q;

  ua uuuuuuuuuuu(clk, reset, q);

  always #5 clk = ~clk;

  initial begin
    reset = 0; clk = 0;
    #10 reset = 1;

    #200

    $finish;
  end

  initial begin
    $monitor("At time t = %t, clk = %b, reset = %b, q = %b = %d", $time, clk, reset, q, q);
  end

endmodule