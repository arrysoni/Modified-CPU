`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:19:24 PM
// Design Name: 
// Module Name: IDEXE_PipelineRegister
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

module ID_EXE_Pipeline(
   input clk,
input  wreg,          output reg ewreg,
input  m2reg,         output reg em2reg,
input  wmem,          output reg ewmem,
input  [3:0] aluc,    output reg [3:0] ealuc,
input  aluimm,        output reg ealuimm,
input [4:0] destReg, output reg [4:0] edestReg,
input [31:0] dqa,     output reg [31:0] eqa,
input [31:0] dqb,     output reg [31:0] eqb,
input [31:0] imm32,  output reg [31:0] eimm32,
input [31:0] dpc4, output reg [31:0] epc4,
input jal, output reg ejal,
input shift, output reg eshift
);
    always @(posedge clk)
       begin
          ewreg <= wreg;
          em2reg <= m2reg;
          ewmem <= wmem;
          ealuc <= aluc;
          ealuimm <= aluimm;
          edestReg <= destReg;
          eqa <= dqa;
          eqb <= dqb;
          eimm32 <= imm32;
          epc4 <= dpc4;
          ejal <= jal;
          eshift <= shift;
    end
endmodule
