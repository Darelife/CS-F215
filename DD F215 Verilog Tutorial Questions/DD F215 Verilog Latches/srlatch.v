module sr_latch(input R,input S,input enable,output reg Q,output reg Q_n);

always @(R, S, enable)
begin
    if (enable)
    begin
        if (R && !S)
        begin
            Q = 0;
            Q_n = 1;
        end
        else if (!R && S)
        begin
            Q = 1;
            Q_n = 0;
        end
    end
end

endmodule