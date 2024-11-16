`include "mux_4to1_4bit.v"
module testbench ();
    reg [3:0] t_in0, t_in1, t_in2, t_in3;
    reg [1:0] t_select;
    wire [3:0] out;

    mux_4to1_4bit m1(t_in0,t_in1,t_in2,t_in3,t_select,out);

    initial begin
        $dumpfile("mux_4to1_4bit.vcd");
        $dumpvars(0,testbench);
        t_in0 = 4'b1101; t_in1 = 4'b0011; t_in2 = 4'b1010; t_in3 = 4'b0101; t_select = 2'b00;
        #10;
        t_in0 = 4'b1101; t_in1 = 4'b0011; t_in2 = 4'b1010; t_in3 = 4'b0101; t_select = 2'b01;
        #10;
        t_in0 = 4'b1101; t_in1 = 4'b0011; t_in2 = 4'b1010; t_in3 = 4'b0101; t_select = 2'b10;
        #10;
        t_in0 = 4'b1101; t_in1 = 4'b0011; t_in2 = 4'b1010; t_in3 = 4'b0101; t_select = 2'b11;
        #10;
        $finish;
    end

    initial begin
        $monitor("time : %0d in0 = %b in1 = %b in2 = %b in3 = %b select = %b out = %b", $time, t_in0, t_in1, t_in2, t_in3, t_select, out);
    end
endmodule
