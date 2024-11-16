`include "fsm_module.v"
module tb_fsm;

    reg clk, reset, input_signal;
    wire output_signal;

    fsm f1 (clk, reset, input_signal, output_signal);

    always #5 clk = ~clk;
    //DON'T MODIFY THE FOLLOWING LINES
    initial begin
        $dumpfile("tb_fsm.vcd");
        $dumpvars(0, tb_fsm);
        #120 $finish;
    end

    initial begin
    
        clk = 0; reset = 1'b1; input_signal = 1'b0;
        #10 reset = 1'b0;
        #10 input_signal = 1'b1;
        #25 input_signal = 1'b0;
        #10 input_signal = 1'b1;
        #10 input_signal = 1'b0;
        #10 input_signal = 1'b1;
        #10 input_signal = 1'b1;
        #10 input_signal = 1'b0;
        #10 input_signal = 1'b0;
    
    end

    //DON'T MODIFY THE FOLLOWING LINES
    initial begin
        $monitor("Time=%0d, reset=%b, input_signal=%b, output_signal=%b", $time, reset, input_signal, output_signal);
    end

endmodule