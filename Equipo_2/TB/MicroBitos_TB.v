`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.11.2020 10:09:46
// Design Name: 
// Module Name: MicroBitos_TB
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


module MicroBitos_TB;
    reg [7:0] i_DataIn_Bus;
    reg clk;
    reg reset;
    reg [8:0] i_Instruccion;
    wire W_R;
    wire [7:0] o_DataOut_Bus;
    wire [7:0] o_Address_Instruction_Bus;
    wire [7:0] o_Address_Data_Bus;

MicroBitos uut(
     .i_DataIn_Bus(i_DataIn_Bus),
     .clk(clk),
     .reset(reset),
     .i_Instruccion(i_Instruccion),
     .W_R(W_R),
     .o_DataOut_Bus(o_DataOut_Bus),
     .o_Address_Instruction_Bus(o_Address_Instruction_Bus),
     .o_Address_Data_Bus(o_Address_Data_Bus)
);

    initial
       begin
       reset=1;
       clk=0;
       i_DataIn_Bus=4;
       i_Instruccion=9'b111111111; 
       #1
       reset=0;
       #2
       i_Instruccion= 9'b001101000;		// LOAD RX, #NUM
       #2
       i_Instruccion= 9'b001101010;    // LOAD RX, [RY]
       #2
       i_Instruccion= 9'b010101011;		// STORE #NUM
       #2
       i_Instruccion= 9'b011101100;		 // STORE [RX], RY
       #2
       i_Instruccion= 9'b100101001;		// MOVE  RX, RY
       #2
       i_Instruccion= 9'b101000000;		// MATH  RX, OP
       #2
       i_Instruccion= 9'b110101111;		// JMP  RX, COND
       #2
       i_Instruccion= 9'b111111111;		// NOP       
       end
   
   always
       #1 clk = !clk;
   

endmodule