`include "mux4_1.v"
module testbench();
  // inputs
  reg [3:0] t_in;
  reg [1:0] t_select;

  // output
  wire out;

  mux4_1 m1(t_in, t_select, out);
  initial begin
    $dumpfile("mux4_1testbench.vcd");
    $dumpvars(0, testbench);
        t_in = 4'b0000; t_select = 2'b00;
    #10 t_in = 4'b0001; t_select = 2'b10;
    #10 t_in = 4'b0010; t_select = 2'b01;
    #10 t_in = 4'b0011; t_select = 2'b00;
    #10 t_in = 4'b0100; t_select = 2'b10;
    #10 t_in = 4'b0101; t_select = 2'b01;
    #10 t_in = 4'b0110; t_select = 2'b11;
    #10 t_in = 4'b0111; t_select = 2'b10;
    #10 t_in = 4'b1000; t_select = 2'b01;
    #10 t_in = 4'b1001; t_select = 2'b10;
    #10 t_in = 4'b1010; t_select = 2'b10;
    #10 t_in = 4'b1011; t_select = 2'b01;
    #10 t_in = 4'b1100; t_select = 2'b00;
    #10 t_in = 4'b1101; t_select = 2'b10;
    #10 t_in = 4'b1110; t_select = 2'b00;
    #10 t_in = 4'b1111; t_select = 2'b00;
    #10 $finish;
  end

  initial begin
    $monitor("t_in=%b, t_select=%b, out=%b", t_in, t_select, out);
  end
endmodule