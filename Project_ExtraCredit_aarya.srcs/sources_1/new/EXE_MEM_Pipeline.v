`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:22:04 PM
// Design Name: 
// Module Name: EXE_MEM_Pipeline
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

module EXE_MEM_Pipeline(
    input clk,
    input ewreg,
    input em2reg,
    input ewmem,
    input [4:0] edestReg2,
    input [31:0] ealu,
    input [31:0] eqb,
    output reg mwreg,
    output reg mm2reg,
    output reg mwmem,
    output reg [4:0] mdestReg,
    output reg [31:0] mr,
    output reg [31:0] mqb
);
always @(posedge clk)
    begin
        mwreg <= ewreg;
        mm2reg <= em2reg;
        mwmem <= ewmem;
        mdestReg <= edestReg2;
        mr <= ealu;
        mqb <= eqb;
    end
endmodule
