`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:31:45 PM
// Design Name: 
// Module Name: BranchComparator
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

module BranchComparator(
    input [31:0] qa,
    input [31:0] qb,
    output reg rsrtequ
);
    always @(*) begin
        rsrtequ = (qa == qb);
    end
endmodule
