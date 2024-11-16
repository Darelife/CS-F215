module mux2to1_8bit (input [7:0] D0,input [7:0] D1,input S,output reg [7:0] Y);
    // WRITE YOUR CODE HERE
    always @(D0 or D1 or S) begin
        if (S) Y = D1;
        else Y = D0;
    end
endmodule
