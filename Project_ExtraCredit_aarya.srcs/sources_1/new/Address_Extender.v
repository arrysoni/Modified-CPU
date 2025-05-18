`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 11:33:16 AM
// Design Name: 
// Module Name: Address_Extender
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

module Address_Extender(
    input wire [25:0] address,
    input wire [31:0] dpc4,
    output reg [31:0] jpc
);
    always @(*)
        begin
             jpc = {dpc4[31:28], address[25:0], 2'b00};
        end
endmodule
