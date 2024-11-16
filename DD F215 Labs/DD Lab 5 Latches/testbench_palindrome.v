`include "palindrome.v"
module testbench_palindrome();
reg [4:0]A;
wire out;

//WRITE YOUR CODE HERE

palindrome p1(A, out);

initial begin
        $dumpfile("out.vcd");
        $dumpvars(0, testbench_palindrome);
    A = 5'b00000;
    #5 A = 5'b01100;
    #5 A = 5'b00100;
    #5 A = 5'b01010;
    #5 A = 5'b01110;
    #5 A = 5'b11001;
    #5 A = 5'b10101;
    #5 A = 5'b11011;
    #5 A = 5'b11111;
    #5 A = 5'b10010;
    #5 A = 5'b10110;
    #5 A = 5'b01101;
    #1 $finish;

end




// DO NOT EDIT THIS BLOCK
initial begin
    $monitor("Time: %0d, Input: %5b, Output: %b", $time, A, out);
end

endmodule