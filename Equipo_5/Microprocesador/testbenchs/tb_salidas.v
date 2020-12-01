`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2020 23:11:44
// Design Name: 
// Module Name: tb_salidas
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


module tb_salidas;

  reg Rst;
    reg Clk;
    reg [7:0] Rx;
    reg [7:0] Ry;
    reg [7:0] num;
    reg [1:0] outbus;
    wire [7:0] DataOut_Bus;
    wire [7:0] Addres_Data_Bus;
    wire LE;
    
    salidas uut(
    .Rst(Rst),
    .Clk(Clk),
    .Rx(Rx),
    .Ry(Ry),
    .num(num),
    .outbus(outbus),
    .DataOut_Bus(DataOut_Bus),
    .Addres_Data_Bus(Addres_Data_Bus),
    .LE(LE)
    );
    
    initial
        begin
        Rst=1;
        Clk=0;
        Rx=0;
        Ry=0;
        num=0;
        outbus=0;
        
        #2 Rst=0; Rx=8'd5; Ry=8'd6; num=8'd2; outbus=0;
        #2 outbus=2'b01;
        #2 outbus=2'b10;
        #2 outbus=2'b11;
        end
    
    always
        #1 Clk = !Clk;
endmodule
