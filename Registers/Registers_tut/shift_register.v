module shift(input SI,input clk,input clear,output reg[3:0]A);
    always @ (posedge clk,negedge clear) begin
        if(~clear) A<=4'b0000;
        // shift right reg
        else A<={SI,A[3:1]};
    end
endmodule


// Doubt:
// negedge clear -> active low reset
// shouldn't it make A = 0000, when clear is 0 then??

// yeah, so there's a mistake in the code, it should be
// if(~clear) A<=4'b0000;