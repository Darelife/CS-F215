`include "d_flipflop.v"
module register(input clk,input rst,input [3:0] I_par,output [3:0]A_par);
    D_flipflop d1(clk,rst,I_par[3],A_par[3]);
    D_flipflop d2(clk,rst,I_par[2],A_par[2]);
    D_flipflop d3(clk,rst,I_par[1],A_par[1]);
    D_flipflop d4(clk,rst,I_par[0],A_par[0]);
endmodule