module encrypter(input clk,input set, input in, output reg[3:0]A, output reg out);
    //WRITE YOUR CODE HERE
    
    reg A_prev;

    always @ (posedge clk) begin
    
    if (set) begin
    A = 4'b1101;
    end

    else begin
    
    out = (in ^ A[0]);

    A_prev = A[3];

    A[3] = (A_prev ^ A[0]);
    A[0] = A[1];
    A[1] = A[2];
    A[2] = A_prev;
    
    end
    
    end

endmodule