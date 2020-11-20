`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.10.2020 15:38:27
// Design Name: 
// Module Name: tb_Contro_unit
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


module tb_Contro_unit;
    reg Rst;
    reg Clk;
    reg [8:0] i_Instruction;
    reg [7:0] i_Rx;
    reg [2:0] Flags;
    wire [2:0] Sel_OP;
    wire [5:0] SelR;
    wire RW;
    wire [1:0] Sel_Op_OutBus;
    wire [2:0] Sel_DW;
    wire [7:0] o_Addres_Instr_Bus;
    
    Control_unit uut(
    .Rst(Rst),
    .Clk(Clk),
    .i_Instruction(i_Instruction),
    .i_Rx(i_Rx),
    .Flags(Flags),
    .Sel_OP(Sel_OP),
    .SelR(SelR),
    .RW(RW),
    .Sel_Op_OutBus(Sel_Op_OutBus),
    .Sel_DW(Sel_DW),
    .o_Addres_Instr_Bus(o_Addres_Instr_Bus)
    );
    
    initial
        begin
        Rst=1;
        Clk=0;
        i_Instruction=0;
        i_Rx=0;
        Flags=0;
        
        #1 Rst=0; i_Instruction=9'b000_001_100; //load Rx Num
        #2 i_Instruction=9'b001_010_001; // load Rx [Ry]
        #2 i_Instruction=9'b010_011_010; // store [Rx] Num
        #2 i_Instruction=9'b011_111_110; // store [Rx] Ry
        #2 i_Instruction=9'b100_001_010; // move Rx Ry
        #2 i_Instruction=9'b101_011_001; // Math Rx OP
        #2 i_Instruction=9'b110_100_001; // Jump [Rx] Cond
        #2 i_Instruction=9'b111_100_001; // Nop
         
        end
    
    always
        #1 Clk = !Clk;
    
endmodule
