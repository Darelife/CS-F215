`include "decoder.v"
module t_dec;
  reg [1:0] a;
  reg en;

  wire [3:0] out;

  decoder dec(a,en,out);

  initial
    begin
      $dumpfile("out.vcd");
      $dumpvars(0,t_dec);
        en=0;a=2'bxx;
      #5 en=1;a=2'b00;
      #5 en=1;a=2'b01;
      #5 en=1;a=2'b10;
      #5 en=1;a=2'b11;
      $finish;
    end

  initial
    begin
      $monitor("time=%0d en=%b a=%b out=%b",$time,en,a,out);
    end
endmodule