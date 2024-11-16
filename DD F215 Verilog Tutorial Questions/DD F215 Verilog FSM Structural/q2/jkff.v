module jkff(input wire J,input wire K,input wire clk,output reg Q,input wire reset);
always @( posedge clk) //synchronous reset
if(~reset)
begin
case ({J,K})
 2'b00: Q <= Q;
 2'b01: Q <= 1'b0;
 2'b10: Q <= 1'b1;
 2'b11: Q <= !Q;
endcase
end
else Q<=0;
endmodule