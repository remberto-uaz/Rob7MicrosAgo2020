`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:04 10/20/2020 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
      input [7:0] A,
      input [7:0] B,
		input [3:0] OP,
		output [2:0] F,
		output [7:0] R
      
    );

     reg [8:0] Rx,Rt;
	  always@(*)
	  begin 
			case(OP)
				0: Rx <= A+B;
				1: Rx <= A-B;
				2: Rx <= A<<B;
				3: Rx <= A>>B;
				4: Rx <= A&B;
				5: Rx <= A|B;
				6: Rx <= A^B;
				7: Rx <= ~A;
				default Rx<=Rx;
				endcase
				
			end
        assign R = Rx[7:0];
		assign F[0] = &(Rx);
		assign F[1] = Rx[8];
		assign F[2] = Rx[7];
	  
endmodule

