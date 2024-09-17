module priorityencoder_83(input en,input[7:0] inp, output reg[2:0] out);

  always @(en,inp)
  begin
    if(en==1)
      begin
        // priority encoder
        // if condition to choose 
        // output based on priority. 
        if(inp[7]==1) out=3'b111;
        else if(inp[6]==1) out=3'b110;
        else if(inp[5]==1) out=3'b101;
        else if(inp[4]==1) out=3'b100;
        else if(inp[3]==1) out=3'b011;
        else if(inp[2]==1) out=3'b010;
        else if(inp[1]==1) out=3'b001;
        else
        out=3'b000;
      end
     // if enable is zero, there is
     // an high impedance value. 
    else out=3'bzzz;
  end
endmodule