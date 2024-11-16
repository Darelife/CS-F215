`include "mod10_beh.v"
module mod10_counter_tb;
    reg clk;
    reg rst;
    wire [3:0] count;
    
    // Instantiate the counter
    mod10_counter counter (
        .clk(clk),
        .rst(rst),
        .count(count)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Test stimulus
    initial begin
        // Initialize waveform dump
        $dumpfile("mod10_counter.vcd");
        $dumpvars(0, mod10_counter_tb);
        
        // Initialize signals and test reset
        rst = 0;
        #10;
        
        // Release reset and let it count
        rst = 1;
        #200;
        
        // Test reset in middle of counting
        rst = 0;
        #10;
        rst = 1;
        
        // Let it count more
        #200;
        
        // Display counter values
        $monitor("Time=%0t rst=%b count=%d", $time, rst, count);
        
        // End simulation
        #100 $finish;
    end

    // Optional: Add checking/verification
    always @(posedge clk) begin
        if (count > 9) begin
            $display("Error: Counter exceeded 9!");
            $stop;
        end
    end
endmodule