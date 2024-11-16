`include "mux_8to1_4bit.v"
module testbench ();
    reg [3:0] t_in0, t_in1, t_in2, t_in3, t_in4, t_in5, t_in6, t_in7;
    reg [2:0] t_select;
    wire [3:0] out;

    mux_8to1_4bit m1 (t_in0,t_in1,t_in2,t_in3,t_in4,t_in5,t_in6,t_in7,t_select,out);

    initial begin
        $dumpfile("mux_8to1_4bit.vcd");
        $dumpvars(0,testbench);
        t_in0 = 4'b0001; t_in1 = 4'b0010; t_in2 = 4'b0011; t_in3 = 4'b0100; 
        t_in4 = 4'b0101; t_in5 = 4'b0110; t_in6 = 4'b0111; t_in7 = 4'b1000; t_select = 3'b000;
        #10;
        t_in0 = 4'b0001; t_in1 = 4'b0010; t_in2 = 4'b0011; t_in3 = 4'b0100; 
        t_in4 = 4'b0101; t_in5 = 4'b0110; t_in6 = 4'b0111; t_in7 = 4'b1000; t_select = 3'b001;
        #10;
        t_in0 = 4'b0001; t_in1 = 4'b0010; t_in2 = 4'b0011; t_in3 = 4'b0100; 
        t_in4 = 4'b0101; t_in5 = 4'b0110; t_in6 = 4'b0111; t_in7 = 4'b1000; t_select = 3'b010;
        #10;
        t_in0 = 4'b0001; t_in1 = 4'b0010; t_in2 = 4'b0011; t_in3 = 4'b0100; 
        t_in4 = 4'b0101; t_in5 = 4'b0110; t_in6 = 4'b0111; t_in7 = 4'b1000; t_select = 3'b011;
        #10;
        t_in0 = 4'b0001; t_in1 = 4'b0010; t_in2 = 4'b0011; t_in3 = 4'b0100; 
        t_in4 = 4'b0101; t_in5 = 4'b0110; t_in6 = 4'b0111; t_in7 = 4'b1000; t_select = 3'b100;
        #10;
        t_in0 = 4'b0001; t_in1 = 4'b0010; t_in2 = 4'b0011; t_in3 = 4'b0100; 
        t_in4 = 4'b0101; t_in5 = 4'b0110; t_in6 = 4'b0111; t_in7 = 4'b1000; t_select = 3'b101;
        #10;
        t_in0 = 4'b0001; t_in1 = 4'b0010; t_in2 = 4'b0011; t_in3 = 4'b0100; 
        t_in4 = 4'b0101; t_in5 = 4'b0110; t_in6 = 4'b0111; t_in7 = 4'b1000; t_select = 3'b110;
        #10;
        t_in0 = 4'b0001; t_in1 = 4'b0010; t_in2 = 4'b0011; t_in3 = 4'b0100; 
        t_in4 = 4'b0101; t_in5 = 4'b0110; t_in6 = 4'b0111; t_in7 = 4'b1000; t_select = 3'b111;
        #10;
        $finish;
    end

    initial begin
        $monitor("time : %0d in0 = %b in1 = %b in2 = %b in3 = %b in4 = %b in5 = %b in6 = %b in7 = %b select = %b out = %b", 
                 $time, t_in0, t_in1, t_in2, t_in3, t_in4, t_in5, t_in6, t_in7, t_select, out);
    end
endmodule
