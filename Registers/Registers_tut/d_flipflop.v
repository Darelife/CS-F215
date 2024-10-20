module D_flipflop(input clk,input reset,input D,output reg Q);
    always @ (posedge clk or negedge reset) begin
        if(~reset) Q<=0;
        else Q <= D;
    end 
endmodule 
