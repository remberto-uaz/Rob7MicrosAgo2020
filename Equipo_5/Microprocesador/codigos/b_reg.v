`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2020 20:53:37
// Design Name: 
// Module Name: b_reg
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


module b_reg(
 input Rst,
    input Clk,
    input [5:0]b_sel,
    input  LE_sel,
    input [7:0] Selector,
    output  [7:0] Rx,
    output  [7:0] Ry
    );
    
    reg [7:0] b_regs [7:0];
    
    always @(posedge Clk, posedge Rst) begin
        if(Rst) 
            begin
                b_regs[0]<=0;
                b_regs[1]<=0;
                b_regs[2]<=0;
                b_regs[3]<=0;
                b_regs[4]<=0;
                b_regs[5]<=0;
                b_regs[6]<=0;
                b_regs[7]<=0; 
                
            end
        else
            if (LE_sel)
                
                    b_regs[b_sel[2:0]]<=Selector;
                end
            
               
               assign Rx=b_regs[b_sel[2:0]];
               assign Ry=b_regs[b_sel[5:3]];
               
endmodule
