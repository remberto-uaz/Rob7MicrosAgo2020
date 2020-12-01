`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// José Alfredo Hernadez Dueñas
//Jesús Francisco Villaseñor Correa
// Create Date: 16.11.2020 15:35:33
// Design Name: 
// Module Name: tb_jump
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


module tb_jump( );
reg Rst;
reg Clk;
reg [5:0] cond;
reg [7:0] DataOut_Bus;
reg [2:0]band;
wire [7:0] Addres_Instruction_Bus;

jump uut(
.Rst(Rst),
.Clk(Clk),
.cond(cond),
.DataOut_Bus(DataOut_Bus),
.band(band),
.Addres_Instruction_Bus(Addres_Instruction_Bus)
);
 
initial 
begin
band=3'b001;
DataOut_Bus=8'b00000011;
cond=4'b1010;
Clk=0;
Rst=1;
Rst=0;
#2 band=3'b100;
cond=4'b1011;
DataOut_Bus=8'b00001011;
#2 band=3'b010;
cond=4'b1011; 
DataOut_Bus=8'b00100011;
 end
always
        #1 Clk = !Clk;
endmodule
