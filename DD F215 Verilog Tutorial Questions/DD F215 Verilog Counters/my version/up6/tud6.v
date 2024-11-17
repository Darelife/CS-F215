`include "ud6.v"
module tua;
  reg clk;
  reg reset;
  reg m;
  wire [2:0] q;

  ud6 uuuuuuuuuuu(clk, reset, m, q);

  always #5 clk = ~clk;

  initial begin
    $dumpfile("ud6.vcd");
    $dumpvars(0,tua);
    reset = 0; clk = 0;
    m = 0;
    #10 reset = 1;

    #200
    #10 reset = 0;
    #10 reset = 1;
    m = 1;
    #200

    $finish;
  end

  initial begin
    $monitor("At time t = %t, clk = %b, m = %b, reset = %b, q = %b = %d", $time, clk, m, reset, q, q);
  end

endmodule