`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.11.2020 15:42:38
// Design Name: 
// Module Name: control
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


module control(


  
    input [7:0] DataOut_Bus, 
    input [8:0] ms_m, 
    input [2:0] band,
    output LE_sel, 
    output [5:0] b_sel,
    output [1:0] outbus,
    output [2:0] fun, 
    output [7:0] Address_Instruction_Bus,
    output [2:0] c_sel,  
    input Clk,
    input Rst
    );
    
    wire [3:0]cond; //Cable interno que une al Jump 
    reg [2:0] band2; //Regidtro para  las banderas 
    
    deco deco(
        .ms_m(ms_m),
        .cond(cond),
        .LE_sel(LE_sel),
        .b_sel(b_sel),
        .outbus(outbus),
        .fun(fun),
        .c_sel(c_sel)
    );
    
    jump jump(
        .band(band2),
        .DataOut_Bus(DataOut_Bus),
        .cond(cond),
        .Clk(Clk),
        .Rst(Rst),
        .Address_Instruction_Bus(Address_Instruction_Bus)
        );
        
        
        always @(posedge Clk, posedge Rst) begin
                if(Rst) 
                    begin
                        band2<=0;
                    end
                else
                    if (ms_m[8:6]==3'b101)
                        band2<=band;
            end
endmodule