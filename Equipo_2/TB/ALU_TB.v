`timescale 1ns / 1ps

module ALU_TB();

    reg [7:0] A;
    reg [7:0] B;
    reg [3:0] OP;
    wire [7:0] R;
    wire [2:0] F;
    
    ALU uut(
    .A(A),
    .B(B),
    .OP(OP),
    .R(R),
    .F(F)
    );
    
    initial
        begin
        A<="00001111";
        B<="00001111";
        OP<="0000";
        #2
        OP<="0001";
        #2
        B<="00000011";
        OP<="0010";
        #2
        OP<="0100";
        end
         
endmodule