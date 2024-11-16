module sr_latch(input R,input S,input enable,output reg  Q,output reg  Q_n);

always@(R or S or enable)
begin  
if(enable) 
  begin
  if (R && !S)  // If R is active (1) and S is inactive (0)
        begin
            assign Q = 0;   // Q is reset (0)
            assign Q_n = 1;  // Q' is set (1)
        end
 else if (!R && S)  // If R is inactive (0) and S is active (1)
        begin
            Q <= 1;   // Q is set (1)
            Q_n <= 0;  // Q' is reset (0)
        end
 else  // If both R and S are active or both are inactive
        begin
            Q <= Q;   // Q retains its previous value
            Q_n <= Q_n; // Q' retains its previous value
        end
  end
end

endmodule
