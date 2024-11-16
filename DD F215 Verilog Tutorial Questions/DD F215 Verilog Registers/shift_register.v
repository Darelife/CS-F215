module shift(input SI,input clk,input clear,output reg[3:0]A);
    always @ (posedge clk) begin
        if(clear) A<=4'b0000;
        else A<={SI,A[3:1]};
    end
endmodule