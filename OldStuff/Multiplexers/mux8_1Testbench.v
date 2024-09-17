`include "mux8_1.v"
module testbench();
  // inputs
  reg [7:0] t_in;
  reg [2:0] t_select;

  // output
  wire out;

  mux8_1 m1(t_in, t_select, out);
  initial begin
    $dumpfile("mux4_1testbench.vcd");
    $dumpvars(0, testbench);
        t_in = 8'b00000000; t_select = 3'b000;
    #10 t_in = 8'b00000001; t_select = 2'b010;
    #10 t_in = 8'b00000010; t_select = 2'b001;
    #10 t_in = 8'b00000011; t_select = 2'b000;
    #10 t_in = 8'b00000100; t_select = 2'b010;
    #10 t_in = 8'b00000101; t_select = 2'b001;
    #10 t_in = 8'b00000110; t_select = 2'b011;
    #10 t_in = 8'b00000111; t_select = 2'b010;
    #10 t_in = 8'b00001000; t_select = 2'b001;
    #10 t_in = 8'b00001001; t_select = 2'b010;
    #10 t_in = 8'b00001010; t_select = 2'b010;
    #10 t_in = 8'b00001011; t_select = 2'b001;
    #10 $finish;
  end

  initial begin
    $monitor("t_in=%b, t_select=%b, out=%b", t_in, t_select, out);
  end
endmodule