`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2020 21:38:14
// Design Name: 
// Module Name: ban_reg_micro
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


module ban_reg_micro
(
    input [5:0] Sel_reg,
    input W,
    input [7:0] DW,
    output [7:0] Rx,
    output [7:0] Ry,
    input rst,
    input clk
    );
    
    reg [7:0] Fnd [0:7];
    
    always@(posedge clk, posedge rst)
     begin
        if(rst) 
            begin
                Fnd[0]<=0;
                Fnd[1]<=0;
                Fnd[2]<=0;
                Fnd[3]<=0;
                Fnd[4]<=0;
                Fnd[5]<=0;
                Fnd[6]<=0;
                Fnd[7]<=0; 
            end
        else
            if (W)
               Fnd[Sel_reg[2:0]]<=DW;
            end
            assign Rx= Fnd[Sel_reg[2:0]];
            assign Ry= Fnd[Sel_reg[5:3]];
endmodule
