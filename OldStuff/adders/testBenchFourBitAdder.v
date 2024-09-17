`include "fourBitAdderAndSubtractor.v"
module tb_fourBitAdder;
  reg [3:0] A, B;       // 4-bit input registers
  reg ctrl, Cin;        // Control and carry-in registers
  wire [3:0] S;         // 4-bit sum/difference wire
  wire Cout;            // Carry-out wire
  wire initialCout;

  // Instantiate the fourBitAdder
  fourBitAdder uut (
    .A(A), 
    .B(B), 
    .ctrl(ctrl), 
    // .Cin(ctrl), 
    .S(S), 
    .Cout(Cout),
    .initialCout(initialCout)
  );

  initial begin
    $dumpfile("fourBitAdder_tb.vcd");
    $dumpvars(0, tb_fourBitAdder);

    // Test cases
    A = 4'b0011; B = 4'b0101; ctrl = 0; Cin = 0; #10; // Addition: 3 + 5 = 8
    A = 4'b1100; B = 4'b0011; ctrl = 1; Cin = 1; #10; // Subtraction: 12 - 3 = 9
    A = 4'b1010; B = 4'b0101; ctrl = 0; Cin = 0; #10; // Addition: 10 + 5 = 15
    A = 4'b1111; B = 4'b0001; ctrl = 1; Cin = 1; #10; // Subtraction: 15 - 1 = 14
    // 5-9
    A = 4'b0101; B = 4'b1001; ctrl = 1; Cin = 1; #10;

    $finish;
  end

  initial begin
    $monitor("At time %0t: A = %b, B = %b, ctrl = %b, Cin = %b -> S = %b, Cout = %b, Negative = %b", 
             $time, A, B, ctrl, Cin, S, Cout, initialCout);
  end
endmodule
