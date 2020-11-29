`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2020 23:53:04
// Design Name: 
// Module Name: tb_BIU
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


module tb_BIU;
   reg [2:0] NUM;
   reg [7:0] RX;
   reg [7:0] RY;
   reg [1:0] SEL_BIU;
   reg reset;
   reg clk;
   
   wire [7:0] o_Address_Data_Bus;
   wire [7:0] o_DataOut_Bus;
   wire W_R;
   
   BIU uut(
   .NUM(NUM),
   .RX(RX),
   .RY(RY),
   .SEL_BIU(SEL_BIU),
   .reset(reset),
   .clk(clk),
   
   .o_Address_Data_Bus(o_Address_Data_Bus),
   .o_DataOut_Bus(o_DataOut_Bus),
   .W_R(W_R)
   );
   
   initial
       begin
       reset=1;
       clk=0;
       RX=0;
       RY=0;
       NUM=0;
       SEL_BIU=3;
       
       #2 reset=0; RX=8'd7; RY=8'd6; NUM=3'd2; SEL_BIU=3;
       #2 SEL_BIU=2'b00;
       #2 SEL_BIU=2'b01;
       #2 SEL_BIU=2'b10;
       end
   
   always
       #1 clk = !clk;
   

endmodule
