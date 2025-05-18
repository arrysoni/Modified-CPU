`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:17:29 PM
// Design Name: 
// Module Name: Regrt_MUX
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

module Regrt_MUX(
    input wire [4:0] rt,
    input wire [4:0] rd,
    input wire regrt,
    output reg [4:0] destReg
);

    always @(*) begin
        if(regrt==0)
            begin
                destReg = rd;
            end
        if(regrt==1)
            begin
                destReg = rt;
            end
    end    
endmodule
