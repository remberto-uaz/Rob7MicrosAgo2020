`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2020 20:07:00
// Design Name: 
// Module Name: tb_MicroUAZ8Bits2020V02
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


module tb_MicroUAZ8Bits2020V02;
    reg Clk;
    reg Rst;
    reg [8:0] i_Instruction;
    reg [7:0] i_Dato_Bus;
    wire [7:0] o_Addres_Instruction_Bus;
    wire [7:0] o_DataOut_Bus;
    wire [7:0] o_Addres_Data_Bus;
    wire RW;
    
    
    MicroUAZ8Bits2020V02 uut(
        .Clk(Clk),
        .Rst(Rst),
        .i_Instruction(i_Instruction),
        .i_Dato_Bus(i_Dato_Bus),
        .o_Addres_Instruction_Bus(o_Addres_Instruction_Bus),
        .o_DataOut_Bus(o_DataOut_Bus),
        .o_Addres_Data_Bus(o_Addres_Data_Bus),
        .RW(RW)
        );
        
    initial
        begin
        Rst=1;
        Clk=0;
        i_Instruction=0;
        i_Dato_Bus=0;
        
        #1 Rst=0; i_Instruction=9'b000_000_111; //load Rx Num
        #2 i_Instruction=9'b000_001_110; //load Rx Num
        #2 i_Instruction=9'b001_010_000; // load Rx [Ry]
           i_Dato_Bus=10;
        #2 i_Instruction=9'b010_001_010; // store [Rx] Num
        #2 i_Instruction=9'b011_010_000; // store [Rx] Ry
        #2 i_Instruction=9'b100_011_000; // move Rx Ry
        #2 i_Instruction=9'b101_011_001; // Math Rx OP
        #2 i_Instruction=9'b110_100_001; // Jump [Rx] Cond
        #2 i_Instruction=9'b111_100_001; // Nop
        
        end
    
    always
        #1 Clk = !Clk;
endmodule
