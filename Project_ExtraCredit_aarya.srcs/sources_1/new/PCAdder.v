`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:06:11 PM
// Design Name: 
// Module Name: PCAdder
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


module PCAdder(
    input wire [31:0] pc,
    output reg [31:0] pc4
);
     always @(*) begin
        pc4 = pc + 32'd4;
    end 
endmodule