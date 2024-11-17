`include "dff.v"
module up_counter (
  input clk,        // Clock signal
  input reset,      // Asynchronous reset signal
  output [3:0] q    // 4-bit counter output
);

  wire [3:0] d;   // D inputs for each flip-flop

  // Instantiate 4 D flip-flops to create a 4-bit counter
  dff dff0 (
    .clk(clk),
    .reset(reset),
    .d(d[0]),
    .q(q[0])
  );

  dff dff1 (
    .clk(clk),
    .reset(reset),
    .d(d[1]),
    .q(q[1])
  );

  dff dff2 (
    .clk(clk),
    .reset(reset),
    .d(d[2]),
    .q(q[2])
  );

  dff dff3 (
    .clk(clk),
    .reset(reset),
    .d(d[3]),
    .q(q[3])
  );

  // Logic to increment the counter
  assign d[0] = ~q[0]; // Toggle the least significant bit on each clock cycle
  assign d[1] = q[0] ^ q[1]; // Carry-over logic for the second bit
  assign d[2] = (q[0] & q[1]) ^ q[2]; // Carry-over logic for the third bit
  assign d[3] = (q[0] & q[1] & q[2]) ^ q[3]; // Carry-over logic for the fourth bit

endmodule
