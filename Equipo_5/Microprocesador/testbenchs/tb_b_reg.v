`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.10.2020 21:10:16
// Design Name: 
// Module Name: tb_b_reg
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


module tb_b_reg;
reg Rst;
reg Clk;
reg[5:0]b_sel;
reg LE_sel;
reg[7:0] Selector;
wire [7:0] Rx;
wire [7:0] Ry;

b_reg uut(
.Rst(Rst),
.Clk(Clk),
.b_sel(b_sel),
.LE_sel(LE_sel),
.Selector(Selector),
.Rx(Rx),
.Ry(Ry)
); 
initial
begin
Rst=1;
Clk=0;
b_sel=0;
LE_sel=0;
Selector=0;
#2 Rst=0; b_sel=6'b000_000; LE_sel=0; LE_sel=8'b00000000;
#2 b_sel=6'b000000; LE_sel=1; Selector=8'b00000001;
#2 b_sel=6'b000001; LE_sel=1; Selector=8'b00000010;
#2 b_sel=6'b000010; LE_sel=1; Selector=8'b00000011;
#2 b_sel=6'b000011; LE_sel=1; Selector=8'b00000100;
#2 b_sel=6'b000100; LE_sel=1; Selector=8'b00000101;
#2 b_sel=6'b000101; LE_sel=1; Selector=8'b00000110;
#2 b_sel=6'b000110; LE_sel=1; Selector=8'b00000111;
#2 b_sel=6'b000111; LE_sel=1; Selector=8'b00001000;

#2 b_sel=6'b001000; LE_sel=0;
#2 b_sel=6'b011010; LE_sel=0;
#2 b_sel=6'b101100; LE_sel=0;
#2 b_sel=6'b111110; LE_sel=0;

end
 always
        #1 Clk = !Clk;
endmodule
