`include "bcd.v"

module tbcd;
  reg clk;
  reg reset;
  wire [3:0]q;

  bcd b1(clk, reset, q);

  always #5 clk = ~clk;

  initial begin
    clk = 0; reset = 0;
    #10 reset = 1;

    #200

    $finish;
  end

  initial begin
    $monitor("At time t = %t, clk = %b, reset = %b, q = %b", $time, clk, reset, q);
  end
endmodule