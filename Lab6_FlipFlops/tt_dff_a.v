`include "dff.v"
module tt_dff_a;
  reg clk, d;
  wire q;

  dff dff1(.clk(clk),.d(d),.q(q));

  always #5 clk = ~clk;

  initial begin
    $dumpfile("out.vcd");
    $dumpvars(0,tt_dff_a);
    
    clk = 1;
    d = 0;

    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 0;

    #20 $finish;
  end

  initial begin
    $monitor("At time %t, d = %b, q = %b", $time, d, q);
  end
endmodule