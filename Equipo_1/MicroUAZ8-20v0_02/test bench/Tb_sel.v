`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Universidad Autonoma De Zacatecas
// Engineer: Alfa
// 
// Create Date: 12.10.2020 10:04:47
// Design Name: 
// Module Name: Tb_sel
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Tb_sel;

    reg [2:0] Sel_DW;
    reg [7:0] i_R0;
     reg [7:0] i_Num;
     reg [7:0] i_Dato_Bus;
     reg [7:0] i_Ry;
      reg [7:0] i_Addres_Instr_Bus;
     wire [7:0] o_DW
  ;
  
  Sel uut(
  .Sel_DW(Sel_DW),
    .i_R0(i_R0),
     .i_Num(i_Num),
     .i_Dato_Bus(i_Dato_Bus),
      .i_Ry(i_Ry),
      .i_Addres_Instr_Bus(i_Addres_Instr_Bus),
      .o_DW(o_DW)
      );
initial
begin
Sel_DW = 3'd0;
i_R0 = 8'd0;
i_Num = 8'd2;
i_Dato_Bus = 8'd1;
i_Ry =8'd4;
i_Addres_Instr_Bus = 8'd3;


#2
   Sel_DW = 3'd1;
#2
   Sel_DW = 3'd2;
#2
   Sel_DW = 3'd3;
#2
   Sel_DW = 3'd4;





end

endmodule
