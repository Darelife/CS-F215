`include "clock.v"
module tb_clock;

    // Inputs
    reg clk;
    reg reset;

    // Outputs
    wire [6:0] seconds;
    wire [5:0] minutes;
    wire [4:0] hours;

    // Instantiate the Clock module
    Clock uut (
        .clk(clk),
        .reset(reset),
        .seconds(seconds),
        .minutes(minutes),
        .hours(hours)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #1 clk = ~clk; // 100 MHz clock
    end
    initial begin
        $dumpfile("clock.vcd");
        $dumpvars(0, tb_clock);
    end
    // Test sequence
    initial begin
        // Initialize inputs
        
        reset = 1;
        #10;
        reset = 0;

        // Monitor the outputs
        $monitor("Time: %0t | Hours: %0d | Minutes: %0d | Seconds: %0d", $time, hours, minutes, seconds);

        // Run the simulation for a certain period
        #200; // Adjust the simulation time as needed
        $finish;
    end

endmodule