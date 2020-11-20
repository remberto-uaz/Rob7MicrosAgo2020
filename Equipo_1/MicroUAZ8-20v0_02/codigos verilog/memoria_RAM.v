`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: uaz
// Engineer: team alfa
// 
// Create Date: 25.10.2020 21:30:25
// Design Name: 
// Module Name: memoria_RAM
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


module memoria_RAM #(parameter nAddr = 256, AW = 8, DW= 8)(
    input [DW-1:0] d_in,
    input [AW-1:0] addr,
    input RW,
    output reg [DW-1:0] d_out
    );
    
    reg [(DW-1):0]mem[0:(nAddr-1)];
    
    initial
        begin
            $readmemh("RAM.mem",mem);
        end    
//    (addr,d_in,RW)
    always @* begin
        if(RW) 
            begin
                mem[addr]<=d_in;
                d_out<=mem[addr];
            end
        else
            d_out<=mem[addr];
    end
    
endmodule
