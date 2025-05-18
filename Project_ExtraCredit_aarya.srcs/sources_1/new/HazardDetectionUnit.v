`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:30:53 PM
// Design Name: 
// Module Name: HazardDetectionUnit
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

module HazardDetectionUnit(
    input [4:0] rs,
    input [4:0] rt,
    input [4:0] edestReg,
    input ewreg,
    input em2reg,

    output reg stall
);
    always @(*) begin
    if (ewreg && em2reg && (edestReg != 0) && 
       ((edestReg == rs && rs !== 5'bx) || (edestReg == rt && rt !== 5'bx)))
        stall = 1;
    else
        stall = 0;
end
endmodule
