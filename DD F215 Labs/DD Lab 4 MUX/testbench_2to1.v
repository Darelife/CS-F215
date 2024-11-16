`include "mux_2to1_4bit.v"
module testbench ();
    //inputs
    reg [3:0] t_in0,t_in1;
    reg t_select;

    //outputs
    wire[3:0]out;

    mux_2to1_4bit m1(t_in0,t_in1,t_select,out);
    initial begin
        $dumpfile("mux_2to1_4bit.vcd");
        $dumpvars(0,testbench);
                t_in0 = 4'b1101;t_in1=4'b0011 ;t_select = 1'b0;
            #10 t_in0 = 4'b0010;t_in1=4'b1100; t_select = 1'b1;  
        #10 $finish;
    end

    initial begin
        $monitor("time : %0d in0 = %b in1=%b select = %b  out = %b",$time,t_in0,t_in1,t_select,out);
    end
endmodule