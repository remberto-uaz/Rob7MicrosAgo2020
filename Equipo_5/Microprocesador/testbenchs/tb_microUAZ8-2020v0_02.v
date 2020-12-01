`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// José Alfredo Hernadez Dueñas
//Jesús Francisco Villaseñor Correa
// Create Date: 16.11.2020 18:23:36
// Design Name: 
// Module Name: tb_microUAZ8-2020v0_02
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


module tb_microUAZ8_2020v0_02( );
reg [8:0] Instruction;
reg [7:0] Datain_Bus;
wire [7:0] Address_Instruction_Bus;
wire [7:0] DataOut_Bus;
wire [7:0] Addres_Data_Bus;
wire LE;
reg Clk;
reg Rst;

Microprocesador_Equipo_N uut(
.Instruction(Instruction),
.Datain_Bus(Datain_Bus),
.Address_Instruction_Bus(Address_Instruction_Bus),
.DataOut_Bus(DataOut_Bus),
.LE(LE),
.Clk(Clk),
.Rst(Rst)
);

initial 
    begin
     Instruction=0;
    Rst=1;
Clk=0;
     
    Datain_Bus=8'b0010110;
    #2 Instruction=9'b000_010_010;
    #2 Instruction=9'b001_110_001;
    #2 Instruction=9'b010_011_011;
    #2 Instruction=9'b011_010_110;
    #2 Instruction=9'b100_000_011;
    #2 Instruction=9'b101_010_000;
    #2 Instruction=9'b110_000_000;
    #2 Instruction=9'b111_100_100;
    end
    always
        #1 Clk = !Clk;
endmodule
