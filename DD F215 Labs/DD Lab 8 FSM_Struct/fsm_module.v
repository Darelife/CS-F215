`include "jkff_async_reset.v"
module fsm (input clk, input reset, input input_signal, output output_signal);
//WRITE YOUR CODE HERE

wire [1:0]state;
wire ja, ka, jb, kb;

assign ja = state[0];
assign ka = state[0];

assign jb = (!state[1] & input_signal) | (state[1] & !input_signal);
assign kb = (!state[1] & input_signal) | (state[1] & !input_signal);

JK f1 (ja, ka, clk, reset, state[1]);
JK f2 (jb, kb, clk, reset, state[0]);

assign output_signal = (state[1] & !state[0] & !input_signal) | (state[1] & state[0] & input_signal);

endmodule
