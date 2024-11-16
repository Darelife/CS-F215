module decoder24_behaviour(input en,input a,input b,output reg[3:0]out);

   always @(en,a,b)
     begin
       // using condition if statement 
       // implement the 2:4 truth table
       if(en==1)
         begin
           if(a==1'b0 && b==1'b0) out=4'b0001;
           else if(a==1'b0 && b==1'b1) out=4'b0010;
           else if(a==1'b1 && b==1'b0) out=4'b0100;
           else if(a==1'b1 && b==1'b1) out=4'b1000;
           else out=4'bxxxx;
         end
       else
        out=4'b0000;
     end
endmodule