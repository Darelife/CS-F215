module decoder (
  input [1:0] a,
  input en,
  output reg [3:0] out
);
  always@(en,a) begin
    if (en) begin
      if (a == 2'b00) out = 4'b0001;
      else if (a == 2'b01) out = 4'b0010;
      else if (a == 2'b10) out = 4'b0100;
      else if (a == 2'b11) out = 4'b1000;
      else out = 4'bxxxx;
    end
    else out = 4'bxxxx;
  end
endmodule