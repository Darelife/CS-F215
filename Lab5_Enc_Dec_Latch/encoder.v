module encoder (
  input [7:0] a,
  input en,
  output reg [2:0] out
);
  always @(en,a) begin
    if (a[7] == 1) out =3'b111;
    else if (a[6] == 1) out =3'b110;
    else if (a[5] == 1) out =3'b101;
    else if (a[4] == 1) out =3'b100;
    else if (a[3] == 1) out =3'b011;
    else if (a[2] == 1) out =3'b010;
    else if (a[1] == 1) out =3'b001;
    else if (a[0] == 1) out =3'b000;
    else out = 3'bxxx;
  end
endmodule