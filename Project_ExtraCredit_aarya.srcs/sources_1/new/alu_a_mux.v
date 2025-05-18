`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 11:40:10 AM
// Design Name: 
// Module Name: alu_a_mux
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

module alu_a_mux(
    input wire [31:0] eqa,
    input wire [31:0] eimm32,
    input wire eshift,
    output reg [31:0] a
);
    always @(*)
        begin
            if(eshift) begin a = {27'b0, eimm32[10:6]};  end
            else begin a = eqa; end
        end
endmodule
