`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2020 20:29:40
// Design Name: 
// Module Name: tb_control
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


module tb_control();
reg Rst;
    reg Clk;
    reg [8:0] ms_m;
    reg [7:0] DataOut_Bus;
    reg [2:0] band;
    wire [2:0] fun;
    wire [5:0] b_sel;
    wire LE_sel;
    wire [1:0] outbus;
    wire [2:0] c_sel;
    wire [7:0] Address_Instruction_Bus
;
control uut(
.Rst(Rst),
.Clk(Clk),
.ms_m(ms_m),
.DataOut_Bus(DataOut_Bus),
.band(band),
.fun(fun),
.b_sel(b_sel),
.LE_sel(LE_sel),
.outbus(outbus),
.c_sel(c_sel),
.Address_Instruction_Bus(Address_Instruction_Bus)
);
initial
begin
 Rst=1;
 #1 Rst=0;
 Clk=0;
 ms_m=0;
 DataOut_Bus=0;
 band=0;
 #2  band=1;
 #2  band=2;
 #2  band=3;
 #1 Rst=0; 
 #1  ms_m=9'b000_001_100;
 #2  ms_m=9'b001_010_001;
 #2  ms_m=9'b010_011_010;
 #2  ms_m=9'b011_111_110;
 #2  ms_m=9'b100_001_010;
 #2  ms_m=9'b101_011_001;
 #2  ms_m=9'b110_100_001;
 #2  ms_m=9'b111_100_001;
 #2  ms_m=9'b111_100_000;
 #2  ms_m=9'b111_100_101;
 #2  ms_m=9'b111_100_111;
end
always
        #1 Clk = !Clk;
endmodule
