`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Universidad Autonoma De Zacatecas
// Engineer: Alfa
// 
// Create Date: 10.10.2020 21:54:34
// Design Name: 
// Module Name: Sel
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


module Sel(
    input [2:0] Sel_DW,
    input [7:0] i_R0,
     input [7:0] i_Num,
     input [7:0] i_Dato_Bus,
     input [7:0] i_Ry,
      input [7:0] i_Addres_Instr_Bus,
    output reg [7:0] o_DW
    );
    
   
    
    always@*
       begin
       case (Sel_DW)
       3'b000 :begin o_DW<=i_R0;end
       3'b001 :begin  o_DW<=i_Dato_Bus;end
       3'b010 :begin  o_DW<=i_Num;end
       3'b011 :begin  o_DW<=i_Addres_Instr_Bus;end
       3'b100 :begin  o_DW<=i_Ry;end
       default: begin  o_DW<=0;end       
       endcase
       
    end   

endmodule
