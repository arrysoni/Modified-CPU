`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 03:11:29 PM
// Design Name: 
// Module Name: equality_comparator
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

module equality_comparer(
    input wire [31:0] dqa,
    input wire [31:0] dqb,
    output reg rsrtequ
);
    always @(*)
        begin
            if(dqa == dqb) begin rsrtequ = 1; end
            else begin rsrtequ = 0; end
        end
endmodule

