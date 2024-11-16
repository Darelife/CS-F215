`include "vending_machine.v"

module tb_vending_machine;

    reg clk, reset, input_code;
    wire [1:0]output_code;

    vending_machine v1(clk, reset, input_code, output_code);

    always #5 clk = ~clk;

    initial begin
        $dumpfile("out.vcd");
        $dumpvars(0, tb_vending_machine);

        clk = 0; reset = 1; input_code = 0;

        #10 reset = 0; input_code = 0;
        #10 input_code = 0;
        #10 input_code = 1;
        #10 input_code = 1;
        #10 input_code = 1;
        #15 input_code = 0;
        #10 input_code = 1;
        #20 input_code = 1;
        #10 input_code = 1;
        #10 input_code = 0;
    end

    // DO NOT MODIFY 
    initial begin
        #135 $finish;
    end
    // DO NOT MODIFY
    initial begin
        $monitor("Time: %0t, reset: %b, input_code: %b, output_code: %b", 
                 $time, reset, input_code, output_code);
    end

endmodule
