`include "srlatch.v"
module t_sr;
  reg S,R,enable;
  wire Q,Q_n;

  srLatch sr1(S,R,enable,Q,Q_n);

  initial #80 $finish;
  initial begin
        enable=1;R=0;S=1;
    #10 enable=0;R=0;S=1;
    #10 enable=1; R=0;S=0;
    #10 enable=0; R=0;S=0;
    #10 enable=1; R=1;S=0;
    #10 enable=0; R=1;S=0;
    #10 enable=1; R=0;S=0;
    #10 enable=0; R=0;S=0;
  end
  initial begin
    $monitor("time=%0d enable=%b R=%b S=%b Q=%b Q_n=%b", $time, enable,R,S,Q,Q_n);
  end
  
endmodule