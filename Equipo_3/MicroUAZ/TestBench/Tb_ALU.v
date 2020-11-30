`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2020 19:42:33
// Design Name: 
// Module Name: Tb_ALU
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


module Tb_ALU(

    );
    
    reg[7:0] RY;
    reg[7:0] RX;
    reg[3:0] Sel_ALU;
    wire[7:0] R0;
    wire[2:0] Flags;
    
    
    ALU uut (
        .RY(RY),
        .RX(RX),
        .Sel_ALU(Sel_ALU),
        .R0(R0),
        .Flags(Flags)
    );
    
        initial 
        begin 
        //Inicialización de las entradas
            RY=0; // A
            RX=0; // B 
            Sel_ALU=0;
 
            #2
            RY= 8'd4; 
            RX= 8'd4;
            Sel_ALU=4'b0001;
            #2
            RY= 8'd4; 
            RX= 8'd5;
            Sel_ALU=4'b0001;
            #2
            RY= 8'd255; 
            RX= 8'd1;
            Sel_ALU=4'b0000;
            
            #2
            RY= 8'd4; 
            RX= 8'd3;
            Sel_ALU=4'b0001;
            #2
            RY= 8'd10; 
            RX= 8'd5;
            Sel_ALU=4'b0001;
            #2
            RY= 8'd2; 
            RX= 8'd1;
            Sel_ALU=4'b0000;
        
        end 
   
endmodule
