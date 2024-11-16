module sr_latch(input R, input S, input enable, output reg Q, output reg Q_n);
  always @(R or S or enable) // Use '*' to automatically include all inputs in the sensitivity list
  begin
    if (enable) 
    begin
      case ({R,S}) // Concatenating R and S directly inside the case statement
        2'b10: begin
          Q <= 0;    // Q is reset (0)
          Q_n <= 1;  // Q' is set (1)
        end

        2'b01: begin
          Q <= 1;    // Q is set (1)
          Q_n <= 0;  // Q' is reset (0)
        end

        default: begin
          Q <= Q;    // Q retains its previous value
          Q_n <= Q_n; // Q' retains its previous value
        end
      endcase
    end
  end
endmodule
