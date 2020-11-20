`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2020 14:32:18
// Design Name: 
// Module Name: tb_ALUm
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


module tb_ALU;
    reg [7:0] Rx;
    reg [7:0] Ry;
    reg [2:0] Sel_OP;
    wire [7:0] R0;
    wire [2:0] Flags;
    
    ALU uut(
        .Rx(Rx),
        .Ry(Ry),
        .Sel_OP(Sel_OP),
        .R0(R0),
        .Flags(Flags)
    );
    
    initial
        begin
            Rx = 76;
            Ry = 44;
            Sel_OP = 0;
        #4
            Rx = 76;
            Ry = 76;
            Sel_OP = 1;
        #4
            Rx = 76;
            Ry = 80;
            Sel_OP = 1;
        #6
            Rx = 76;
            Ry = 44;
            Sel_OP = 3;
        #10
            Rx = 76;
            Ry = 44;
            Sel_OP = 4;
        #4
            Rx = 76;
            Ry = 44;
            Sel_OP = 5;
        #4
            Rx = 76;
            Ry = 44;
            Sel_OP = 6;
        #4
            Rx = 76;
            Ry = 44;
            Sel_OP = 7;
        
        end
    
endmodule
