`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 11:47:54 AM
// Design Name: 
// Module Name: alu_b_mux
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

module alu_b_mux(
    input [31:0] eqb,
    input [31:0] eimm32,
    input ealuimm,
    output reg [31:0] b
);
   always @(*)
       begin
          if(ealuimm == 0)
            begin
                b = eqb;
            end
          if(ealuimm == 1)
            begin
                b = eimm32;
            end
        end
endmodule
