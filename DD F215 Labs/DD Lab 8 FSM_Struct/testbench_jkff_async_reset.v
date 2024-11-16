`include "jkff_async_reset.v"
module tb;
wire Q;
reg reset,J,K;
reg clk=1'b0;
JK f1(J,K,clk,reset,Q);

always #10 clk=~clk;
initial begin 
    $dumpfile("JKflipflop.vcd");
    $dumpvars(0,tb);
    reset=1'b1;J=1'b0;K=1'b0;
#10 reset=1'b0;J=1'b0;K=1'b1;
#10 reset=1'b0;J=1'b1;K=1'b0;
#10 reset=1'b0;J=1'b1;K=1'b1;
#10 reset=1'b0;J=1'b0;K=1'b0;
#10 reset=1'b1;
#10 $finish;

end
initial begin
    $monitor("Time=%0d, Clk=%b, Reset=%b, J=%b, K=%b, Q=%b",$time,clk,reset,J,K,Q);
end
endmodule