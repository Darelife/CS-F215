`include "mux2_1.v"    

module mux2to1_8bit_tb;
    reg [7:0] D0, D1; 
    reg S;
    wire [7:0] Y;

    //WRITE YOUR CODE HERE
    mux2to1_8bit m1(D0, D1, S, Y);

    initial begin
        $dumpfile("mux_2to1.vcd");
        $dumpvars(0, mux2to1_8bit_tb);

        D0 = 8'b00000000; D1 = 8'b11111111; S = 1'b0;
        #10 D0 = 8'b10101010; D1 = 8'b01010101; S = 1'b0;
        #10 D0 = 8'b10101010; D1 = 8'b01010101; S = 1'b1;
        #10 D0 = 8'b00011101; D1 = 8'b11100010; S = 1'b0;
        #10 D0 = 8'b00011101; D1 = 8'b11100010; S = 1'b1;
        #10 D0 = 8'B11001100; D1 = 8'b00110011; S = 1'b0;
        #10 D0 = 8'b11001100; D1 = 8'b00110011; S = 1'b1;
        #10 D0 = 8'b11111111; D1 = 8'b00000000; S = 1'b0;
        #10 D0 = 8'b11111111; D1 = 8'b00000000; S = 1'b1;

        #10 $finish;
    end

    // DO NOT EDIT THIS BLOCK
    initial begin
        $monitor("Time: %0d, S: %b, D0: %8b, D1: %8b, Y: %8b", $time, S, D0, D1, Y);
    end
endmodule
