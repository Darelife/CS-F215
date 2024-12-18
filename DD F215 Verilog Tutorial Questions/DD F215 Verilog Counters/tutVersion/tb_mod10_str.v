`include "mod10_dff.v"

module tb_mod10_counter;

    
    reg clk;
    reg rst;

    
    wire [3:0] q;

    
    mod10_counter uut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    
    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, tb_mod10_counter); 
    end
    always #5 clk = ~clk;

    initial begin
        
        clk = 0;
        rst = 0;

        
        #10 rst = 0;
        #10 rst = 1;

        
        #200 $finish;
    end

    initial begin
        $monitor("At time %t, clk = %b, rst = %b, q = %b", $time, clk, rst, q);
    end

endmodule
