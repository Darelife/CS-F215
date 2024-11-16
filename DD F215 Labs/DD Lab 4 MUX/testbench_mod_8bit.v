`include "mod_8bit.v"
module testbench ();
    //inputs
    reg [7:0] t_number;
    wire [3:0] out;

   mod_8bit m1(t_number,out);
    initial begin
        $dumpfile("mod_8bit.vcd");
        $dumpvars(0,testbench);
          t_number=8'd100;
        #10 t_number=8'd9;
        #10 t_number=8'd19;
        #10 t_number=8'd15;
        #10 t_number=8'd198;    
        #10 t_number=8'd45;
        #10 t_number=8'd160;
        #10 t_number=8'd82;       
        #10 $finish;
    end

    initial begin
        $monitor("time : %0d number = %d  out = %d",$time,t_number,out);
    end
endmodule