`include "jk.v"
module tjk;
  reg J,K,clk,reset;
  wire Q,Qbar;
  jk jk1(J,K,clk,reset,Q,Qbar);

  always #5 clk = ~clk;

  initial begin
    $dumpfile("tjk.vcd");
    $dumpvars(0,tjk);
    J = 0; K = 0; clk = 0; reset = 0;

    reset = 1; #10
    reset = 0; 
    J = 0; K = 0; #10
    J = 0; K = 1; #10
    J = 1; K = 0; #10
    J = 1; K = 1; #10
    J = 1; K = 1; #10
    $finish;
  end

  initial begin
    $monitor("At time %t: J = %b, K = %b, clk = %b, reset = %b, Q = %b, Qbar = %b", $time, J, K, clk, reset, Q, Qbar);
  end
endmodule