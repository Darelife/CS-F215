`include "tff_asynch_reset.v"
module vending_machine_struc(input clk,input reset,input input_code, output reg [1:0] output_code);
    wire [2:0] cur_state;
    wire ta,tb,tc;
    
    assign ta = (cur_state[0] & ~input_code) | (cur_state[2]) | (cur_state[1] & cur_state[0]);
    assign tb =  (cur_state[1]) | (~cur_state[2] & input_code);
    assign tc = (~cur_state[2] & ~cur_state[1] & ~cur_state[0]) | (cur_state[0] & input_code) | (cur_state[2] & cur_state[0]);
    
    tff_asynch_reset t1(clk,reset,tc,cur_state[0]);
    tff_asynch_reset t2(clk,reset,tb,cur_state[1]);
    tff_asynch_reset t3(clk,reset,ta,cur_state[2]);

    always@(cur_state,input_code)begin
        output_code[0] = ~cur_state[2] & cur_state[1] & ~cur_state[0] & input_code;
        output_code[1] = cur_state[2] & ~cur_state[1] & ~cur_state[0] & input_code;
    end

endmodule
