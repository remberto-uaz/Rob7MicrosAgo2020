`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2020 21:07:10
// Design Name: 
// Module Name: deco
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


module deco(

    input [8:0] ms_m,
    output reg[2:0] fun,
    output reg[5:0] b_sel,
    output reg[3:0] cond,
    output reg LE_sel,
    output reg[1:0] outbus,
    output reg[2:0] c_sel
    );
    always @(ms_m) 
    begin
    case (ms_m [8:6])
    3'b001: begin
    fun<=0; b_sel<={3'b000,ms_m[5:3]}; LE_sel<=1; outbus<=2'b00; c_sel<=3'b010; cond<=4'b0001; end
    3'b010: begin
    fun<=0; b_sel<={ms_m[2:0],ms_m[5:3]}; LE_sel<=1; outbus<=2'b01; c_sel<=3'b001; cond<=4'b0001; end
    3'b011: begin
    fun<=0; b_sel<={3'b000,ms_m[5:3]}; LE_sel<=0; outbus<=2'b10; c_sel<=3'b010; cond<=4'b0001; end
    3'b100: begin
    fun<=0; b_sel<={ms_m[2:0],ms_m[5:3]}; LE_sel<=0; outbus<=2'b11; c_sel<=3'b100; cond<=4'b0001; end
    3'b101: begin
    fun<=0; b_sel<={ms_m[2:0],ms_m[5:3]}; LE_sel<=1; outbus<=2'b00; c_sel<=3'b100; cond<=4'b0001; end
    3'b110: begin
    fun<=ms_m[2:0]; b_sel<={3'b000,ms_m[5:3]}; LE_sel<=1; outbus<=2'b00; c_sel<=3'b000; cond<=4'b0001; end
    3'b111: begin
    if(ms_m[2:0]==3'b001)
    begin
    c_sel<=3'b011;
    LE_sel<=1;fun<=0; b_sel<={3'b000,ms_m[5:3]};  outbus<=2'b00;  cond<={1'b0,ms_m[2:0]};
    end
    else
    begin
    c_sel<=3'd0;
    LE_sel<=0;fun<=0; b_sel<={3'b000,ms_m[5:3]};  outbus<=2'b00;  cond<={1'b0,ms_m[2:0]};
    end
    end
    3'b000: begin
    fun<=0; b_sel<=0; LE_sel<=0; outbus<=2'b00; c_sel<=3'b000; cond<=4'b0001; end
    endcase
    end
endmodule
