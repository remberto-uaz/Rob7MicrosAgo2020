`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2020 09:54:21
// Design Name: 
// Module Name: MicroBitos
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

module MicroBitos(
    input [7:0] i_DataIn_Bus,
    input clk,
    input reset,
    input [8:0] i_Instruccion,
    output W_R,
    output [7:0] o_DataOut_Bus,
    output [7:0] o_Address_Instruction_Bus,
    output [7:0] o_Address_Data_Bus
    );
    
    wire [7:0] RX,RY, DataIn_Registro, Resultado_ALU;
    wire [2:0] AddrR1,AddrR2,AddrW,F,Data_SELECTOR;
    wire Write_Read_Register;
    wire [3:0] COND,SEL_ALU;
    wire [1:0] SEL_BIU;

    Banco_R B1(
        .AddrR1(AddrR1),
        .AddrR2(AddrR2),
	    .AddrW(AddrW),
        .DataIn(DataIn_Registro),
        .clk(clk),
        .reset(reset),
        .W_R(Write_Read_Register),
        .RX(RX),
        .RY(RY)
    );
    
    ALU B2(
        .A(RX),
        .B(RY),
        .OP(SEL_ALU),
        .R(Resultado_ALU),
        .F(F)
    );
    
    UCJ B3(
        .cond(COND),
        .clk(clk),
        .rst(reset),
        .Rx(RX),
        .F(F),
        .o_Address_Instruction_Bus(o_Address_Instruction_Bus)
    );
    
    BIU B4(
        .reset(reset),
        .clk(clk),
        .SEL_BIU(SEL_BIU),
        .NUM(i_Instruccion[2:0]),
        .RX(RX),
        .RY(RY),
        .o_Address_Data_Bus(o_Address_Data_Bus),
        .o_DataOut_Bus(o_DataOut_Bus),
        .W_R(W_R)
    );
    
    Data_Sel B5(
        .DataIn(i_DataIn_Bus),
        .Resultado(Resultado_ALU),
        .Direccion(o_Address_Instruction_Bus),
        .RY(RY),
        .SEL(Data_SELECTOR),
        .NUM(i_Instruccion[2:0]),
        .Dato_Registro(DataIn_Registro)
    );
    
    Deco B6(
        .i_Instruction(i_Instruccion),
        .o_AddrR1(AddrR1),
        .o_AddrR2(AddrR2),
        .o_AddrW(AddrW),
        .o_R_W(Write_Read_Register),
        .o_SEL_ALU(SEL_ALU),
        .o_COND(COND),
        .o_SEL_BIU(SEL_BIU),
        .o_Data_SEL(Data_SELECTOR)
    );
endmodule

