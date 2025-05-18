`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:17:01 PM
// Design Name: 
// Module Name: ImmediateExtender
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

module Immediate_Extender(
   input wire [15:0] imm, 
   input wire sext, 
   output reg [31:0] imm32
   );

    always @(*)
        begin
            if (sext)
                imm32 = {{16{imm[15]}}, imm};
            else
                imm32 = {16'b0, imm};
         end
endmodule
