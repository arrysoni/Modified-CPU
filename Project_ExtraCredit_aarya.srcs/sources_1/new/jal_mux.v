`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 11:35:59 AM
// Design Name: 
// Module Name: jal_mux
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

module jal_mux(
    input wire [31:0] epc8,
    input wire [31:0] r,
    input ejal,
    output reg [31:0] ealu
);
    always @(*)
        begin
            if(ejal) begin ealu = epc8; end
            else begin ealu = r; end
        end
endmodule
