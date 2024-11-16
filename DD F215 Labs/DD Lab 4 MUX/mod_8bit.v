`include "mux_8to1_4bit.v"
module mod_8bit(input [7:0]number,output [3:0]out);
//Write your code here

mux_8to1_4bit m1(4'b1010, 4'b1011, 4'b1100, 4'b1101, 4'b0011, 4'b0111, 4'b1001, 4'b0100, number[2:0], out);

//End of your code
endmodule