`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 11:35:25 AM
// Design Name: 
// Module Name: PC_EXE_Adder
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

module PC_EXE_Adder(
    input wire [31:0] epc4, 
    output reg [31:0] epc8
);
    always @(*)
        begin
            epc8 = epc4 + 32'd4;
        end
endmodule
