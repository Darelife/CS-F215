module parallel(input load,input clk,input rst,input [3:0] I,output reg [3:0]A);
    always @ (posedge clk,negedge rst) begin
        if(~rst) A<=4'b0000;
        else begin
            case(load)
                1'b0: A<=A;
                1'b1: A<=I;
            endcase
        end
    end
endmodule
