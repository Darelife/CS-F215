module lfsr(input clk,input set,output reg[3:0]A);
    //WRITE YOUR CODE HERE
    reg A_prev;

    always @ (posedge clk) begin
    
    if (set) A <= 4'b1001;
    else begin
        A_prev = A[3];
        A[3] = (A[2] ^ A[0]);
        A[0] = A[1];
        A[1] = A[2];
        A[2] = A_prev;
    end
    
    end
    
endmodule