`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 11:36:16 AM
// Design Name: 
// Module Name: jal_f
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

module jal_f(

    input wire [4:0] edestReg,
    input wire ejal,
    output reg [4:0] edestReg2
);
    always @(*)
        begin
            if(ejal) begin edestReg2 = 5'd31; end
            else begin edestReg2 = edestReg; end
           
        end
endmodule
