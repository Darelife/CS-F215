`include "fourBitAdder.v"
module tb_fourBitAdd;
  reg [3:0] A, B;        // 4-bit input registers for A and B
  reg Cin;               // Carry-in register
  wire [3:0] S;          // 4-bit output wire for the sum
  wire Cout;             // Carry-out wire

  // Instantiate the fourBitAdd module
  fourBitAdd uut (
    .A(A), 
    .B(B), 
    .Cin(Cin), 
    .S(S), 
    .Cout(Cout)
  );

  initial begin
    $dumpfile("fourBitAdd_tb.vcd"); // Create dump file for GTKWave
    $dumpvars(0, tb_fourBitAdd);    // Dump all variables

    // Apply different test cases
    A = 4'b0000; B = 4'b0000; Cin = 0; #10;  // Test case 1: 0 + 0
    A = 4'b0001; B = 4'b0001; Cin = 0; #10;  // Test case 2: 1 + 1
    A = 4'b0010; B = 4'b0011; Cin = 0; #10;  // Test case 3: 2 + 3
    A = 4'b0101; B = 4'b0101; Cin = 0; #10;  // Test case 4: 5 + 5
    A = 4'b0111; B = 4'b0001; Cin = 1; #10;  // Test case 5: 7 + 1 + carry-in
    A = 4'b1000; B = 4'b1000; Cin = 0; #10;  // Test case 6: 8 + 8
    A = 4'b1111; B = 4'b1111; Cin = 1; #10;  // Test case 7: 15 + 15 + carry-in
    A = 4'b1010; B = 4'b0101; Cin = 0; #10;  // Test case 8: 10 + 5

    $finish; // End the simulation
  end

  // Monitor block to display results
  initial begin
    $monitor("At time %0t: A = %b, B = %b, Cin = %b -> S = %b, Cout = %b", 
             $time, A, B, Cin, S, Cout);
  end
endmodule
