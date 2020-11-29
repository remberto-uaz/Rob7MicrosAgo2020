`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2020 09:16:00
// Design Name: 
// Module Name: Banco_R_tb
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

module Banco_R_tb;

	reg [2:0]AddrR1;
	reg [2:0]AddrR2;
	reg [2:0]AddrW;
	reg [7:0]DataIn;
	reg W_R;
	reg clk;
	reg reset;
	wire [7:0] RX;
	wire [7:0] RY;

	Banco_R uut(
		.AddrR1(AddrR1),
		.AddrR2(AddrR2),
		.AddrW(AddrW),
		.DataIn(DataIn),
		.W_R(W_R),
		.clk(clk),
		.reset(reset),
		.RX(RX),
		.RY(RY)
	);

	initial
		begin
			reset<=1;
			clk<=0;
			AddrR1 <=5;
			AddrR2 <=6;
			AddrW <=0;
			DataIn <=8'hFD;
			W_R <= 0;
			#10
			reset<=0;
			W_R <= 1;
			#10 AddrW <= AddrW+1;
			DataIn <=8'hFE;
        	#10 AddrW <= AddrW+1;
        	DataIn <=8'hAD;
        	#10 AddrW <= AddrW+1;
        	DataIn <=8'hFF;
       		#10 AddrW <= AddrW+1;
        	#10 AddrW <= AddrW+1;
        	DataIn <=8'h7;
        	#10 AddrW <= AddrW+1;
        	DataIn <=8'h6;
        	#10 AddrW <= AddrW+1;
        	DataIn <=8'h0A;
        	#10 AddrW <= AddrW+1;
	
		end
	always@(clk)
        #5 clk <= ~clk;
       endmodule
