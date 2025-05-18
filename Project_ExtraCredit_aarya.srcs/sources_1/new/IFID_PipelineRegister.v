`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:06:11 PM
// Design Name: 
// Module Name: IFID_PipelineRegister
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


module IFID_PipelineRegister(
    input clk,
    input wire wpcir,
    input wire [31:0] pc4,
    input wire [31:0] instOut,
    output reg [31:0] dinstOut,
    output reg [31:0] dpc4
);
     always @(posedge clk) begin
        if (wpcir) begin
            dinstOut <= instOut;
            dpc4 <= pc4;
        end
    end

endmodule