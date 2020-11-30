`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2020 16:37:29
// Design Name: 
// Module Name: Microcontrolador
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


module Microcontrolador(
    input  i_Clk,
    input  i_Reset,
    output [7:0] o_Dataout_Bus
    );
    wire [7:0] i_DataInbus;
    wire [8:0] i_Instruction;
    wire [8:0] o_Addressinstruction_Bus;
    wire [7:0] o_Addressdata_Bus;
    wire ReadWrite;
    
MicroUAZ Micro(
   .i_DataInbus(i_DataInbus),
   .i_Instruction(i_Instruction),
   .i_Clk(i_Clk),
   .i_Reset(i_Reset),
   .o_Addressinstruction_Bus(o_Addressinstruction_Bus),
   .o_Dataout_Bus(o_Dataout_Bus),
   .o_Addressdata_Bus(o_Addressdata_Bus),
   .ReadWrite(ReadWrite)
);

Data Ram(
    .i_DataInbus(o_Addressdata_Bus),
    .o_Dataout(o_Dataout_Bus),
    .o_Addressdata_Bus(i_DataInbus),
    .ReadWrite(ReadWrite)
);

Instruction Rom(
    .i_Instruction(o_Addressinstruction_Bus), 
    .o_Addressinstruction_Bus(i_Instruction)
);

endmodule
