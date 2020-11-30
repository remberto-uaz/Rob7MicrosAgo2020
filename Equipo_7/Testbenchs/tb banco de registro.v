`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.11.2020 22:11:18
// Design Name: 
// Module Name: tb_ban_reg_micro
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


module tb_ban_reg_micro;
     reg [5:0] Sel_reg;
     reg W;
     reg [7:0] DW;
     wire [7:0] Rx;
     wire [7:0] Ry;
     reg rst;
     reg clk
    ;
    
    ban_reg_micro uut
        (
           .Sel_reg(Sel_reg),
           .W(W),
           .DW(DW),
           .Rx(Rx),
           .Ry(Ry),
           .rst(rst),
           .clk(clk)
         );
           
    initial
        begin
            rst = 1;
            clk = 0;
            Sel_reg = 0;
            W = 0 ;
            DW = 0;
            
            #2 rst = 0; Sel_reg = 6'b000_000; W = 0; DW = 8'b00000000;
            #2 Sel_reg = 6'b000000; W = 1; DW = 8'b00001010;
            #2 Sel_reg = 6'b000001; W = 1; DW = 8'b00001011;
            #2 Sel_reg = 6'b000010; W = 1; DW = 8'b00001100;
            #2 Sel_reg = 6'b000011; W = 1; DW = 8'b00001101;
            #2 Sel_reg = 6'b000100; W = 1; DW = 8'b00001110;
            #2 Sel_reg = 6'b000101; W = 1; DW = 8'b00001111;
            #2 Sel_reg = 6'b000110; W = 1; DW = 8'b00010000;
            #2 Sel_reg = 6'b000111; W = 1; DW = 8'b00010001;
            
            #2 Sel_reg = 6'b001000; W = 0;
            #2 Sel_reg = 6'b011010; W = 0;
            #2 Sel_reg = 6'b101100; W = 0;
            #2 Sel_reg = 6'b111110; W = 0;
            
            #3 Sel_reg = 6'b000000; W = 1; DW = 8'b00000001;
            #2 Sel_reg = 6'b000001; W = 1; DW = 8'b00000011;
            #2 Sel_reg = 6'b001000; W = 1; DW = 8'b00000100;
        end
       
   always
        #1 clk = !clk;   
endmodule
