module mux4_1 (input a, input b, input c,input d, input[1:0] select, output reg out);

// always is used in design block 
// only in Behavioural modeling.

always @ (a,b,c,d,select)
begin
    //if condition
    if(select == 2'b00) begin 
        out = a;
    end
    else if(select == 2'b01) out = b;
    else if(select == 2'b10) out = c;
    else if(select == 2'b11) out = d;
end

endmodule