`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2020 23:39:22
// Design Name: 
// Module Name: memoria_ROM
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


module memoria_ROM #(parameter nAddr = 256, AW = 8, DW= 9)(
    input [AW-1:0] addr,
    output reg [DW-1:0] d_out
    );
    
    reg [(DW-1):0]mem[0:(nAddr-1)];
    
    initial
        begin
//            $readmemb("ROM.mem",mem);
            $readmemb("Multi_Program_V2.mem",mem);
        end    
    
    always @(addr) begin
        d_out<=mem[addr];
    end
endmodule
