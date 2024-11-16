module vending_machine(input clk, input reset, input input_code, output reg [1:0] output_code);

reg [2:0]state;
reg [2:0]nextstate;
parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

always @ (posedge clk or posedge reset) begin
    if (reset) state <= S0;
    else state <= nextstate;
end

always @ (state, input_code) begin
    
    case(state)
        S0: begin
            if (input_code) begin
                nextstate <= S1;
                output_code <= 2'b00;
            end
            else begin
                nextstate <= S2;
                output_code <= 2'b00;
            end
        end

        S1: begin
            if (input_code) begin
                nextstate <= S3;
                output_code <= 2'b00;
            end
            else begin
                nextstate <= S5;
                output_code <= 2'b00;
            end
        end

        S2: begin
            if (input_code) begin
                nextstate <= S4;
                output_code <= 2'b00;
            end
            else begin
                nextstate <= S5;
                output_code <= 2'b00;
            end
        end

        S3: begin
            if (input_code) begin
                nextstate <= S0;
                output_code <= 2'b10;
            end
            else begin
                nextstate <= S0;
                output_code <= 2'b00;
            end
        end

        S4: begin
            if (input_code) begin
                nextstate <= S0;
                output_code <= 2'b01;
            end
            else begin
                nextstate <= S0;
                output_code <= 2'b00;
            end
        end

        S5: begin
            if (input_code) begin
                nextstate <= S0;
                output_code <= 2'b00;
            end
            else begin
                nextstate <= S0;
                output_code <= 2'b00;
            end
        end
    endcase
end
endmodule
