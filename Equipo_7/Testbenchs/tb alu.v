`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2020 22:12:24
// Design Name: 
// Module Name: tb_alu_micro
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


module tb_alu_micro;
    reg [7:0] Rx;
    reg [7:0] Ry;
    reg [2:0] Sel_op;
    wire[7:0] R0;
    wire [2:0] Ban
    ;
    
    alu_micro uut
    (
       .Rx(Rx),    
       .Ry(Ry),    
       .Sel_op(Sel_op),
       .R0(R0),    
       .Ban(Ban)
     );
     
     initial
        begin
            Rx = 76;
            Ry = 44;
            Sel_op = 0;
        #4
            Rx = 76;
            Ry = 76;
            Sel_op = 1;
        #4
            Rx = 76;
            Ry = 80;
            Sel_op = 1;
        #6
            Rx = 76;
            Ry = 44;
            Sel_op = 3;
        #10
            Rx = 76;
            Ry = 44;
            Sel_op = 4;
        #4
            Rx = 76;
            Ry = 44;
            Sel_op = 5;
        #4
            Rx = 76;
            Ry = 44;
            Sel_op = 6;
        #4
            Rx = 76;
            Ry = 44;
            Sel_op = 7;
        end
        
endmodule
