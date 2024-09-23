// `include "dff_async.v"
// module tt_dff_async;
//   reg clk, reset, d;
//   wire q;

//   dff_asycr d1(clk, reset, d, q);

//   // always #5 clk = ~clk;



//   initial begin
//     $monitor("%t, d = %b, q = %b reset = %b", $time, d, q, reset);
//   end
// endmodule

`include "dff_async.v"
module dff_async_reset_tb;
    reg clk, reset, d;
    wire q;

    dff_asycr dut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;
    initial begin
      $dumpfile("out.vcd");
      $dumpvars(0,dff_async_reset_tb);

      clk = 0;
      reset = 0;
      d = 0;

      #10 d = 1;
      #10 d = 0;
      #10 d = 1;

      #7 reset = 1;
      #6 reset = 0;
      
      #10 d = 0;
      #10 d = 1;

      #20 $finish;
    end


    initial begin
        $monitor("%t, d = %b, q = %b reset = %b", $time, d, q, reset);
    end
endmodule