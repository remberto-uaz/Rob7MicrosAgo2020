//////////////////////////////////////////////////////////////////////////////////
// Company: Universidad Automona de Zacatecas
// Engineers:
//Agustín Antonio Palafox Molina
//José Alfredo Hernadez Dueñas
//Jesús Francisco Villaseñor Correa
//José Roberto Novoa López
//Julio Angel Pérez Dávila
// Create Date: 09.09.2020 10:37:24
// Design Name: 
// Module Name:deco_bin_7seg
// Project Name: 
//Controlador_display_7segmentos
// Target Devices: 
// Tool Versions: 
// Description: 
//Testbench
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DecoBin_7seg_tb;

    reg [3:0] i_Deco;
    wire [6:0] o_Segmentos;
    
    DecoBin_7seg uut(
        .i_Deco(i_Deco),      
        .o_Segmentos(o_Segmentos)
    );
    
    initial
        begin
            i_Deco = 0;
            
            #2 i_Deco = 1;
            #2 i_Deco = 2;
            #2 i_Deco = 3;
            #2 i_Deco = 4;
            #2 i_Deco = 5;
            #2 i_Deco = 6;
            #2 i_Deco = 7;
            #2 i_Deco = 8;
            #2 i_Deco = 9;
            #2 i_Deco = 10;
            #2 i_Deco = 11;
            #2 i_Deco = 12;
            #2 i_Deco = 13;
            #2 i_Deco = 14;
            #2 i_Deco = 15;         
        end
endmodule