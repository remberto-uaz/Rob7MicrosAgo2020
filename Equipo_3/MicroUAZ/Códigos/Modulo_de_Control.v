`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2020 19:03:20
// Design Name: 
// Module Name: Modulo_de_Control
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

module Modulo_de_Control(
    input [7:0] RX,
    input [2:0] Flags ,
    input [8:0] i_Instruction,
    input i_Clk,
    input i_Reset,
    output [2:0] Sel_Mux,
    output [2:0] Sel_RY,
    output [2:0] Sel_RX,
    output Load_Store,
    output [2:0] Sel_Registros,
    output [3:0] Sel_ALU,
    output [8:0] o_Addressinstruction_Bus,
    output [1:0] Sel_Salidas 
);

wire [2:0] ControlJump;

Jump Brinco(
   .ControlJump(ControlJump),
   .RX(RX),
   .Flags(Flags),
   .i_Clk(i_Clk),
   .i_Reset(i_Reset),
   .o_Addressinstruction_Bus(o_Addressinstruction_Bus)
);

Decov2 Decodificador(
    .i_Instruction(i_Instruction),
    .Sel_Mux(Sel_Mux),   
    .Sel_RY(Sel_RY),  
    .Sel_RX(Sel_RX),   
    .Load_Store(Load_Store),
    .Sel_ALU(Sel_ALU),   
    .Sel_Salidas(Sel_Salidas),
    .ControlJump(ControlJump)
);

endmodule
