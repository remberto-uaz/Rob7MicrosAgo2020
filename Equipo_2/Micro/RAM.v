`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2020 21:15:12
// Design Name: 
// Module Name: RAM
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


module RAM(
    input clk,
    input [7:0] i_Address,
    input [7:0] i_DataIn,
    input i_WR,
    output reg [7:0] o_DataOut
    );
    
    reg [7:0] data [0:255];
    always@(posedge clk)
    if(i_WR)
        data[i_Address] <= i_DataIn;
    else 
        o_DataOut <= data[i_Address];
        
endmodule
