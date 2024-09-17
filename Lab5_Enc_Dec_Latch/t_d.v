`include "dlatch.v"
module t_dlatch;
  reg D,enable;
  wire out;
  dLatch d1(.D(D),.enable(enable),.Q(out));
  initial #40 $finish;
  initial
    begin
      enable=1;D=1;
      #10 enable=0;D=1;
      #10 enable=1;D=0;
      #10 enable=0;D=1;
    end
  initial
    begin
      $monitor("Time=%0d enable=%b D=%b Q=%b",$time,enable,D,out);
    end
  
endmodule