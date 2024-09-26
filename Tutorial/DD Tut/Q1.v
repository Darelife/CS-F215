module FSM (input clk, input reset, input in, output reg out);
    reg [1:0]state;
    reg [1:0]nextstate;
    parameter S0=2'b00, S1=2'b01, S2=2'b10;

    always@(posedge clk, posedge reset) begin
        if(reset) 
            state <= S0;
        else
            state <= nextstate;
    end

    // always @(posedge clk) begin
    always @(*) begin // * means any change in the inputs
        case (state)
              S0: begin
                if(!in) begin nextstate = S0; out = 1'b1; end
                else begin nextstate = S1; out = 1'b0; end
              end
              S1: begin
                if(!in) begin nextstate = S1; out = 1'b0; end
                else begin nextstate = S2; out = 1'b0; end
              end
              S2: begin
                if(!in) begin nextstate = S2; out = 1'b0; end
                else begin nextstate = S0; out = 1'b1; end
              end
        endcase
    end
endmodule