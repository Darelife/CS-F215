module mux_2to1_4bit(input [3:0]in0,input [3:0]in1,input select,output[3:0] out);
 //Write your code here

wire w1;
wire [3:0]a;
wire [3:0]b;

not n1(w1, select);

and a1(a[0], w1, in0[0]);
and a2(a[1], w1, in0[1]);
and a3(a[2], w1, in0[2]);
and a4(a[3], w1, in0[3]);

and a5(b[0], select, in1[0]);
and a6(b[1], select, in1[1]);
and a7(b[2], select, in1[2]);
and a8(b[3], select, in1[3]);

or o1(out[0], a[0], b[0]);
or o2(out[1], a[1], b[1]);
or o3(out[2], a[2], b[2]);
or o4(out[3], a[3], b[3]);

 //End of your code
endmodule