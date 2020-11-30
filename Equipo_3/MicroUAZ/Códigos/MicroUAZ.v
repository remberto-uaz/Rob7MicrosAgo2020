`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2020 19:03:21
// Design Name: 
// Module Name: MicroUAZ
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


module MicroUAZ(
    input [7:0] i_DataInbus,
    input [8:0] i_Instruction,
    input  i_Clk,
    input  i_Reset,
    output [8:0] o_Addressinstruction_Bus,
    output [7:0] o_Dataout_Bus,
    output [7:0] o_Addressdata_Bus,
    output ReadWrite
);

wire [2:0] Sel_Mux;
wire [2:0] Sel_RY;
wire [2:0] Sel_RX;
wire Load_Store;
wire [2:0] w_Sel_Registros;
wire [3:0] Sel_ALU;
wire [1:0] Sel_Salidas;
wire [7:0] Mux_a_Reg;
wire [7:0] R0;
wire [7:0] RY;
wire [7:0] RX;
wire [2:0] Flags;

Mux Multiplexor(
    .i_DataInBus(i_DataInbus),                                  
    .RY(RY),                      
    .RX(RX),                      
    .Num(i_Instruction),             
    .SaveR7(o_Addressinstruction_Bus),                  
    .Sel_Mux(Sel_Mux),                 
    .Mux_a_Reg(Mux_a_Reg)        
);

Modulo_de_Control Control(
    .RX(RX),          
    .Flags(Flags),      
    .i_Instruction(i_Instruction), 
    .i_Clk(i_Clk),
    .i_Reset(i_Reset),
    .Sel_Mux(Sel_Mux),    
    .Sel_RY(Sel_RY),     
    .Sel_RX(Sel_RX),     
    .Load_Store(Load_Store),
    .Sel_ALU(Sel_ALU),   
    .o_Addressinstruction_Bus(o_Addressinstruction_Bus),
    .Sel_Salidas(Sel_Salidas) 
);

Registros Banco_de_Registros(
    .R0(R0),
    .Mux_a_Reg(Mux_a_Reg),  
    .Sel_RY(Sel_RY),    
    .Sel_RX(Sel_RX),    
    .Load_Store(Load_Store),
    .i_Clk(i_Clk),
    .i_Reset(i_Reset),      
    .RY(RY),    
    .RX(RX)    
);

ALU UnidadAL(
    .RY(RX),    
    .RX(RY),   
    .Sel_ALU(Sel_ALU),
    .R0(R0),
    .Flags(Flags)
);

Administrador_de_salidas Salidas(
    .RY(Sel_RY),
    .RX(RX),
    .Num(i_Instruction),   
    .Sel_Salidas(Sel_Salidas),
    .o_Dataout(o_Dataout_Bus),  
    .o_Addressdata(o_Addressdata_Bus),
    .ReadWrite(ReadWrite)  
);
/*
Data Ram(
    .i_DataInbus(o_Addressdata_Bus),
    .o_Addressdata_Bus(i_DataInbus)
);
Instruction Rom(
    .i_Instruction(o_Addressinstruction_Bus), 
    .o_Addressinstruction_Bus(i_Instruction)
);
*/
  
endmodule
