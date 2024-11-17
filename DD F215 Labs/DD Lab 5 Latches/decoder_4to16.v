module decoder_4to16(input [3:0]A, input enable, output reg [15:0]out);
// WRITE YOUR CODE HERE

always @ (A, enable) begin
    if (enable) begin
        if (A == 4'b0000) begin
            out = 16'b0000000000000001;
        end
        else if (A == 4'b0001) begin
            out = 16'b0000000000000010;
        end
        else if (A == 4'b0010) begin
            out = 16'b0000000000000100;
        end
        else if (A == 4'b0011) begin
            out = 16'b0000000000001000;
        end
        else if (A == 4'b0100) begin
            out = 16'b0000000000010000;
        end
        else if (A == 4'b0101) begin
            out = 16'b0000000000100000;
        end
        else if (A == 4'b0110) begin
            out = 16'b0000000001000000;
        end
        else if (A == 4'b0111) begin
            out = 16'b0000000010000000;
        end
        else if (A == 4'b1000) begin
            out = 16'b0000000100000000;
        end
        else if (A == 4'b1001) begin
            out = 16'b0000001000000000;
        end
        else if (A == 4'b1010) begin
            out = 16'b0000010000000000;
        end
        else if (A == 4'b1011) begin
            out = 16'b0000100000000000;
        end
        else if (A == 4'b1100) begin
            out = 16'b0001000000000000;
        end
        else if (A == 4'b1101) begin
            out = 16'b0010000000000000;
        end
        else if (A == 4'b1110) begin
            out = 16'b0100000000000000;
        end
        else begin
            out = 16'b1000000000000000;
        end
    end
    else begin
        out = 16'b0000000000000000;
    end
end

endmodule