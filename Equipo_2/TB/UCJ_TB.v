`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:11:07 10/21/2020 
// Design Name: 
// Module Name:    UCJ_TB 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module UCJ_TB(
    );
  reg[3:0]cond;
  reg clk,rst;
  reg [7:0]Rx;
  reg [2:0]F;
  wire[7:0] o_Address_Instruction_Bus;
  
  UCJ uut(
  .cond(cond),
  .clk(clk),
  .rst(rst),
  .Rx(Rx),
  .F(F),
  .o_Address_Instruction_Bus(o_Address_Instruction_Bus)
  );
  initial
  begin
  clk<=0;
  rst<=1;
  F<=3'b111;
  Rx<=8'hF0;
  cond<=4'b1000;
  #10 rst<=0;
  cond<=4'b0000;
  #10 cond<=4'b0001;
  #10 cond<=4'b0010;
  #10 cond<=4'b0011;
  #10 cond<=4'b0100;
  #10 cond<=4'b0101;
  #10 cond<=4'b0110;
  #10 cond<=4'b0111;
  F<=3'b011;
  Rx<=8'hFA;

  
  end
  always@(clk)
  #5 clk<=~clk;
endmodule
