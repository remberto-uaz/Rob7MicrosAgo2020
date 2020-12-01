`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.11.2020 17:02:18
// Design Name: 
// Module Name: tb_alu
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


module tb_alu;
reg [2:0] fun;
    reg [7:0] Ry;
    reg [7:0] Rx;
    wire [7:0] Result;
    wire [2:0] band;
    
    alu uut(
    .fun(fun),
    .Ry(Ry),
    .Rx(Rx),
    .Result(Result),
    .band(band)
    );
    
    initial
    begin
    Ry=8'b11111111;
    Rx=8'b00000001;
    fun=0;
    
    #2 fun=3'b000;
    #2 fun=3'b001;
    #2 fun=3'b010;
    #2 fun=3'b011;
    #2 fun=3'b100;
    #2 fun=3'b101;
    #2 fun=3'b110;
    #2 fun=3'b111;
    end
endmodule
