`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2020 09:32:14
// Design Name: 
// Module Name: micro_mem
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


module Computadora(
    input Clk,
    input Rst
    );
    
    wire [8:0] i_Instruction;
    wire [7:0] i_Dato_Bus;
    wire [7:0] o_Addres_Instruction_Bus;
    wire [7:0] o_DataOut_Bus;
    wire [7:0] o_Addres_Data_Bus;
    wire RW;
    
   MicroUAZ8Bits2020V02 micro(
    .Clk(Clk),
    .Rst(Rst),
    .i_Instruction(i_Instruction),
    .i_Dato_Bus(i_Dato_Bus),
    .o_Addres_Instruction_Bus(o_Addres_Instruction_Bus),
    .o_DataOut_Bus(o_DataOut_Bus),
    .o_Addres_Data_Bus(o_Addres_Data_Bus),
    .RW(RW)
    ); 
    
    memoria_ROM  #(256,8,9) memIns(
    .addr(o_Addres_Instruction_Bus),
    .d_out(i_Instruction)
    );
    
    memoria_RAM #(256,8,8) memDatos(
    .d_in(o_DataOut_Bus),
    .addr(o_Addres_Data_Bus),
    .RW(RW),
    .d_out(i_Dato_Bus)
    );
endmodule
