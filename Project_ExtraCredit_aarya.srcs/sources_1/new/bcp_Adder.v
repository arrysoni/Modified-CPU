`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 11:33:55 AM
// Design Name: 
// Module Name: BCP_Adder
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

module BCP_Adder(
    input wire [31:0] dpc4,
    input wire [15:0] imm,
    output reg [31:0] bpc
);
    wire [31:0] imm_extended = {{16{imm[15]}}, imm};
    always @(*)
        begin
            bpc = dpc4 + (imm_extended << 2);
        end
endmodule
