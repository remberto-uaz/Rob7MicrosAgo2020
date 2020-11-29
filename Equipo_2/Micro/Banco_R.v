`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2020 15:07:58
// Design Name: 
// Module Name: Banco_R
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

module Banco_R(
	input [2:0] AddrR1,
	input [2:0] AddrR2,
	input [2:0] AddrW,
	input [7:0] DataIn,
	input W_R,
	input clk,
	input reset,
	output [7:0] RX,
	output [7:0] RY
	);

	reg [7:0] R[0:7];

	always@(posedge clk)
	begin
		if(reset)
			begin
				R[0] <= 0;
				R[1] <= 0;
				R[2] <= 0;
				R[3] <= 0;
				R[4] <= 0;
				R[5] <= 0;
				R[6] <= 0;
				R[7] <= 0;
			end
		else if(W_R)
			R[AddrW] <= DataIn;
	end
	assign RX = R[AddrR1];
	assign RY = R[AddrR2];

endmodule
