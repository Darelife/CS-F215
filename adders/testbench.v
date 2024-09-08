// testbench for fullAdder
`include "adder.v"
module tb_fullAdder;
  reg A, B, Cin;         // Declare inputs as registers
  wire sum, Cout;        // Declare outputs as wires

  // Instantiate the fullAdder module
  fullAdder FA (
    .A(A), 
    .B(B), 
    .Cin(Cin), 
    .sum(sum), 
    .Cout(Cout)
  );

  // Testbench to apply inputs and check the output
  initial begin
    $dumpfile("fullAdder_tb.vcd");
    $dumpvars(0, tb_fullAdder);

    // Test cases
    A = 0; B = 0; Cin = 0; #10;
    A = 0; B = 0; Cin = 1; #10;
    A = 0; B = 1; Cin = 0; #10;
    A = 0; B = 1; Cin = 1; #10;
    A = 1; B = 0; Cin = 0; #10;
    A = 1; B = 0; Cin = 1; #10;
    A = 1; B = 1; Cin = 0; #10;
    A = 1; B = 1; Cin = 1; #10;

    $finish; // End the simulation
  end

  // Monitor block to display results
  initial begin
    $monitor("At time %0t: A = %b, B = %b, Cin = %b -> Sum = %b, Cout = %b", 
             $time, A, B, Cin, sum, Cout);
  end
endmodule
