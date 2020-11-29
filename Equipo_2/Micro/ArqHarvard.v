`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2020 22:08:05
// Design Name: 
// Module Name: ArqHarvard
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


module ArqHarvard(
    input clk,
    input reset
    );
    
    
    wire [8:0] instructions;
    wire [7:0] address_instructions, address_data, dataMem, dataMicro;
    wire wr;
    RAM P1(
    .clk(clk),
    .i_Address(address_data),
    .i_DataIn(dataMem),
    .i_WR(wr),
    .o_DataOut(dataMicro)
    );
    
    ROM P2(
    .i_Address(address_instructions),
    .o_Instruction(instructions)
    );
    
    MicroBitos P3(
    .i_DataIn_Bus(dataMicro),
    .clk(clk),
    .reset(reset),
    .i_Instruccion(instructions),
    .W_R(wr),
    .o_DataOut_Bus(dataMem),
    .o_Address_Instruction_Bus(address_instructions),
    .o_Address_Data_Bus(address_data)
    );
endmodule
