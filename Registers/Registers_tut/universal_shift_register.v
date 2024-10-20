module universal_shift(input [3:0] I_par,input clk,input rst,input s1,input s0,input MSB_in,input LSB_in,output reg [3:0]A_par);
    always @ (posedge clk,negedge rst)begin
        if(rst) A_par<=4'b0000;
        else begin
        case({s1,s0}) 
            2'b00: A_par<=A_par;
            2'b01: A_par<={MSB_in,A_par[3:1]};
            2'b10: A_par<={A_par[2:0],LSB_in};
            2'b11: A_par<=I_par;
        endcase
        end
    end
endmodule
