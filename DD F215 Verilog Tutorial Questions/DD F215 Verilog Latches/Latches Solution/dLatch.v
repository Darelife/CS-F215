module d_latch (Q, D, enable);
output Q;
input D, enable;
reg Q;
always @ (enable or D)
if (enable) Q = D; // Same as: if (enable == 1)
endmodule