`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:20:20 PM
// Design Name: 
// Module Name: ALU_MUX
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


module ALU_Mux(
    input ealuimm,             // Control signal: 0 = use eqb, 1 = use eimm32
    input [31:0] eqb,          // Operand B from register
    input [31:0] eimm32,       // Extended immediate
    output reg [31:0] b        // Output to ALU
);
    always @(*) begin
        if (ealuimm)
            b = eimm32;
        else
            b = eqb;
    end
endmodule