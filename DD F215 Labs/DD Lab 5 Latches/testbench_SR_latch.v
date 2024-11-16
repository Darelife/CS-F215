`include "SR_latch.v"
module testbench_SR_Latch();
reg S, R, enable;
wire Q, Qbar;

//WRITE YOUR CODE HERE
SR_latch s1(S, R, enable, Q, Qbar);

initial begin
    $dumpfile("out.vcd");
    $dumpvars(0, testbench_SR_Latch);
    enable = 1; S = 1; R = 0;
    #5 enable = 1; S = 1; R = 1;
    #5 enable = 0; S = 0; R = 1;
    #5 enable = 1; S = 0; R = 1;
    #5 enable = 1; S = 1; R = 1;
    #5 enable = 0; S = 1; R = 0;
    #5 enable = 1; S = 0; R = 0;
    #1 $finish;
end


// DO NOT EDIT THIS BLOCK
initial begin
    $monitor("Time: %0d, Enable: %b, S: %b, R: %b, Q: %b, Qbar: %b", $time, enable, S, R, Q, Qbar);
end

endmodule