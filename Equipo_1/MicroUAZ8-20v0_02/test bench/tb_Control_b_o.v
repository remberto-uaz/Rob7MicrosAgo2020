`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2020 20:16:52
// Design Name: 
// Module Name: tb_Control_b_o
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


module tb_Control_b_o;
    reg Rst;
    reg Clk;
    reg [7:0] Rx;
    reg [7:0] Ry;
    reg [7:0] NUM;
    reg [1:0] Sel_Op_OutBus;
    wire [7:0] o_DataOut_Bus;
    wire [7:0] o_Addres_Data_Bus;
    wire RW;
    
    Control_b_o uut(
    .Rst(Rst),
    .Clk(Clk),
    .Rx(Rx),
    .Ry(Ry),
    .NUM(NUM),
    .Sel_Op_OutBus(Sel_Op_OutBus),
    .o_DataOut_Bus(o_DataOut_Bus),
    .o_Addres_Data_Bus(o_Addres_Data_Bus),
    .RW(RW)
    );
    
    initial
        begin
        Rst=1;
        Clk=0;
        Rx=0;
        Ry=0;
        NUM=0;
        Sel_Op_OutBus=0;
        
        #2 Rst=0; Rx=8'd5; Ry=8'd6; NUM=8'd2; Sel_Op_OutBus=0;
        #2 Sel_Op_OutBus=2'b01;
        #2 Sel_Op_OutBus=2'b10;
        #2 Sel_Op_OutBus=2'b11;
        end
    
    always
        #1 Clk = !Clk;
    
endmodule
