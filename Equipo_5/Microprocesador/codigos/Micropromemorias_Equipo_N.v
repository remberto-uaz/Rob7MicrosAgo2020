`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// José Alfredo Hernadez Dueñas
//Jesús Francisco Villaseñor Correa
// Create Date: 18.11.2020 19:04:11
// Design Name: 
// Module Name: Micropromemorias_Equipo_N
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


module Micropromemorias_Equipo_N(
 input Clk,
    input Rst
    );
    
      wire [8:0] Instruction;
      wire [7:0] DataIn_Bus;
      wire [7:0] Address_Instruction_Bus;
      wire [7:0] DataOut_Bus;
      wire [7:0] Address_Data_Bus;
      wire LE;
      
     Microprocesador_Equipo_N  Micro(
      .Clk(Clk),
      .Rst(Rst),
      .Instruction(Instruction),
      .DataIn_Bus(DataIn_Bus),
      .Address_Instruction_Bus(Address_Instruction_Bus),
      .DataOut_Bus(DataOut_Bus),
      .Address_Data_Bus(Address_Data_Bus),
      .LE(LE)
      );
      
      memoriaROM #(256,8,9) InstructionMem(
      .address(Address_Instruction_Bus),
      .d_out(Instruction)
      );
      
      memoriaRam #(256,8,9) DataMem(
      .LE(LE),
      .i_data(DataOut_Bus),
      .address_data(Address_Data_Bus),
      .o_data(DataIn_Bus)
      );
    
endmodule
