`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2020 21:52:44
// Design Name: 
// Module Name: tb_Banco_Registros
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


module tb_Banco_Registros;
    reg Rst;
    reg Clk;
    reg [5:0] SelR; 
    reg RW; 
    reg [7:0] DW;
    wire [7:0] Rx;
    wire [7:0] Ry;
    
    Banco_Registros uut(
    .Rst(Rst),
    .Clk(Clk),
    .SelR(SelR),
    .RW(RW),
    .DW(DW),
    .Rx(Rx),
    .Ry(Ry));
    
    initial
        begin
            Rst=1;
            Clk=0;
            SelR=0;
            RW=0;
            DW=0;
            #2 Rst=0; SelR=6'b000_000; RW=0; DW=8'b00000000;
            #2 SelR=6'b000000; RW=1; DW=8'b00001010;
            #2 SelR=6'b000001; RW=1; DW=8'b00001011;
            #2 SelR=6'b000010; RW=1; DW=8'b00001100;
            #2 SelR=6'b000011; RW=1; DW=8'b00001101;
            #2 SelR=6'b000100; RW=1; DW=8'b00001110;
            #2 SelR=6'b000101; RW=1; DW=8'b00001111;
            #2 SelR=6'b000110; RW=1; DW=8'b00010000;
            #2 SelR=6'b000111; RW=1; DW=8'b00010001;
            
            #2 SelR=6'b001000; RW=0;
            #2 SelR=6'b011010; RW=0;
            #2 SelR=6'b101100; RW=0;
            #2 SelR=6'b111110; RW=0;
            
        end
       
    always
        #1 Clk = !Clk;
       
endmodule
