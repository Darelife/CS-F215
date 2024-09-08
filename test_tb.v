//testbench
`include "test.v"
module t_func ;
wire t_out;
reg t_A, t_B, t_C, t_D;
parameter stop_time = 160;

func2 F1(t_out, t_A, t_B, t_C, t_D); // Ensure func2 is used instead of func

initial #stop_time $finish;
  initial begin
    $dumpfile("out.vcd");
    $dumpvars(0, t_func);
      t_A = 0; t_B = 0; t_C = 0; t_D = 0;
    #10  t_A = 0; t_B = 0; t_C = 0; t_D = 1;
    #10  t_A = 0; t_B = 0; t_C = 1; t_D = 0;
    #10  t_A = 0; t_B = 0; t_C = 1; t_D = 1;
    #10  t_A = 0; t_B = 1; t_C = 0; t_D = 0;
    #10  t_A = 0; t_B = 1; t_C = 0; t_D = 1;
    #10  t_A = 0; t_B = 1; t_C = 1; t_D = 0;
    #10  t_A = 0; t_B = 1; t_C = 1; t_D = 1;
    #10  t_A = 1; t_B = 0; t_C = 0; t_D = 0;
    #10  t_A = 1; t_B = 0; t_C = 0; t_D = 1;
    #10  t_A = 1; t_B = 0; t_C = 1; t_D = 0;
    #10  t_A = 1; t_B = 0; t_C = 1; t_D = 1;
    #10  t_A = 1; t_B = 1; t_C = 0; t_D = 0;
    #10  t_A = 1; t_B = 1; t_C = 0; t_D = 1;
    #10  t_A = 1; t_B = 1; t_C = 1; t_D = 0;
    #10  t_A = 1; t_B = 1; t_C = 1; t_D = 1;
  end

  initial begin
    $monitor("time = %0d A = %b B = %b C = %b D = %b OUT = %b", $time, t_A, t_B, t_C, t_D, t_out);
  end
endmodule