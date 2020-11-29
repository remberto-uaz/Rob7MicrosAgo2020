`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2020 21:15:12
// Design Name: 
// Module Name: ROM
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


module ROM(
    input [7:0] i_Address,
    output [8:0]o_Instruction
    );
    
    reg [8:0] inst [0:255];
    initial begin
	   inst[0] <= 9'b111111111; //nop	
	   inst[1] <= 9'b000001010; //load r1, 2	
	   inst[2] <= 9'b000010011; //load r2, 3	
	   inst[3] <= 9'b000100001; //load r4, 1
	   inst[4] <= 9'b000101101; //load r5, 5 
	   inst[5] <= 9'b101001000;  //math r1 suma = r0=0+2 r0=2, r0=2+2 r0=4, r0=4+2 r0=6 loop
	   inst[6] <= 9'b100011000;   // move r3, r0 
	   inst[7] <= 9'b100000010; // move r0, r2
	   inst[8] <= 9'b101100001; //math r4, resta r0=3-1 primer r3=2, segunda 2-1 1, tercera 1-1 0
	   inst[9] <= 9'b100010000; // move r2, r0
	   inst[10] <= 9'b100000011;   //move r0,r3
	   inst[11] <= 9'b110101011;  //jump 101 011
	   inst[12] <= 9'b000001001; //load r1,1
	   inst[13] <= 9'b011001000; //store r1, r0
	   
//	   inst[0] <= 9'b000001110;  //load r1, 3
//	   inst[1] <= 9'b000010010;  //load r2, 2
//	   inst[2] <= 9'b000100001; //load r4, 1
//	   inst[3] <= 9'b000101100;  //load r5, 4
//	   inst[4] <= 9'b101100000;  //math r4,suma r0=0+1 r0=1,r0=1+1 r0=2, r0=2+1 r0=3
//	   inst[5] <= 9'b100011000;  //mov r3,r0
//	   inst[6] <= 9'b100000001;  //mov r0,r1
//	   inst[7] <= 9'b101010001;  //math r2,resta r0=6-2 primer r0=4, r0=4-2 r0=2, r0=2-2, r0=0
//	   inst[8] <= 9'b100001000;  //mov r1,r0
//	   inst[9] <= 9'b100000011;  //move r0,r3
//	   inst[10] <= 9'b110101111;  //jump si el valor de r0 = 0 N=0
//	   inst[11] <= 9'b000001111; //load r1,7
//	   inst[12] <= 9'b011110000;  //store r6,r0


	end

    assign o_Instruction = inst[i_Address];
endmodule
