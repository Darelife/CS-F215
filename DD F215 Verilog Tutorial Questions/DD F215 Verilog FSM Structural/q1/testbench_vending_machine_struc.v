`include "vending_machine_struc.v"

module tb_vending_machine_struc;

    reg clk;
    reg reset;
    reg input_code;
    wire [1:0] output_code;

    vending_machine_struc v1(clk, reset, input_code, output_code);

    always #5 clk = ~clk;  

    initial begin
        
        $dumpfile("out_vending_machine_struc.vcd");
        $dumpvars(0, tb_vending_machine_struc);
        clk = 0;
        reset = 1;
        input_code = 0;
        
        #10 reset = 0; input_code = 0;  // 10ns

        #10 input_code = 0;  // 20ns
 
        #10 input_code = 1;  // 30ns

        #10 input_code = 1;  // 40ns

        #10 input_code = 1;  // 50ns

        #15 input_code = 0;  // 65ns

        #10 input_code = 1;  // 75ns
        
        #20 input_code = 1;  // 95ns

        #10 input_code = 1;  // 105ns

        #10 input_code = 0;  // 115ns

        
    end

    initial begin
        #135 $finish; // 135ns
    end

    initial begin
        $monitor("Time: %0t, reset: %b, input_code: %b, output_code: %b", 
                 $time, reset, input_code, output_code);
    end

endmodule
