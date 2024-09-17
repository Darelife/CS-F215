`include "encoder.v"
module t_enc;

  reg [7:0] a;
  reg en;
  wire [2:0] out;

  encoder enc(a,en,out);

  initial
    begin
      // $dumpfile("out.vcd");
      // $dumpvars(0, t_enc);
         en=1;a=8'bxxxxxxxx;
      #5 en=1;a=8'b00000001;
      #5 en=1;a=8'b00000010;
      #5 en=1;a=8'b00000100;
      #5 en=1;a=8'b00001000;
      #5 en=1;a=8'b00010000;
      #5 en=1;a=8'b00100000;
      #5 en=1;a=8'b01000000;
      #5 en=1;a=8'b10000000;
      $finish;
    end
  initial
    begin
      $monitor("time=%0d en=%b a=%b out=%b",$time,en,a,out);
    end


endmodule