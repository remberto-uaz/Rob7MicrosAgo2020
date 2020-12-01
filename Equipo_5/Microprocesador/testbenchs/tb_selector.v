`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2020 20:09:40
// Design Name: 
// Module Name: tb_selector
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


module tb_selector( );
reg [2:0] c_sel;
reg [7:0] Result;
reg [7:0] Datain_Bus;
reg [7:0] num;
reg [7:0] Adress_Instruction_Bus;
reg [7:0] Ry;
wire [7:0] selector
;

selector uut(
.c_sel(c_sel),
.Result(Result),
.Datain_Bus(Datain_Bus),
.num(num),
.Ry(Ry),
.Adress_Instruction_Bus(Adress_Instruction_Bus),
.selector(selector)
);
initial
begin
c_sel = 3'd0;
Result = 8'd0;
Datain_Bus = 8'd1;
num = 8'd2;
Ry =8'd4;
Adress_Instruction_Bus= 8'd3;


#2
c_sel = 3'd1;
#2
c_sel = 3'd2;
#2
c_sel = 3'd3;
#2
c_sel = 3'd4;
end
endmodule
