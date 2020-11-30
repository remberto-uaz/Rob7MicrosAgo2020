module Control_micro
(
    input [8:0] i_instruccion,
    input [7:0] Rx,
    input [2:0] Ban,
    output [2:0] Sel_op,
    output [5:0] Sel_reg,
    output W,
    output [1:0] Sel_outbus,
    output [2:0] Sel_DW,
    output [7:0] o_direccion_instruccion,
    input rst,
    input clk
    );
    
    wire [3:0] cable_condJ;
    reg [2:0] RBan;
    
    deco C_deco
    (
        .i_instruccion(i_instruccion),
        .condJ(cable_condJ),
        .Sel_op(Sel_op),
        .Sel_reg(Sel_reg),
        .W(W),
        .Sel_outbus(Sel_outbus),
        .Sel_DW(Sel_DW),
        .rst(rst),
        .clk(clk)
        );
        
    jump C_jump
    (
        .condJ(cable_condJ),
        .Rx(Rx),
        .Ban(RBan),
        .o_direccion_instruccion(o_direccion_instruccion),
        .rst(rst),
        .clk(clk)
        );
          
    always @(posedge clk, posedge rst)
        begin
            if(rst) 
                begin
                    RBan<=0;
            end
        else
            if (i_instruccion[8:6]==3'b101)
                RBan<=Ban;
    end
    
endmodule
