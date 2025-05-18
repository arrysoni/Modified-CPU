`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:06:11 PM
// Design Name: 
// Module Name: ProgramCounter
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


module ProgramCounter(
    input clk,
    input [31:0] npc,
    input wire wpcir,              // Write enable (used for stalls)
    output reg [31:0] pc
);
    initial begin
        pc = 32'd0;
    end

    always @(posedge clk) begin
        if (wpcir)
            pc <= npc;
    end
endmodule