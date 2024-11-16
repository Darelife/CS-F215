module d_latch (output reg Q, input D,input enable);

    always @(D, enable)
    begin
        if (enable == 1) Q = D;
    end


endmodule