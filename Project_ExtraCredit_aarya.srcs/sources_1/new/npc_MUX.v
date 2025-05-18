`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 11:30:22 AM
// Design Name: 
// Module Name: npc_MUX
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

module npc_MUX(
    input wire [1:0] pcsrc,
    input wire [31:0] pc4,
    input wire [31:0] bpc,
    input wire [31:0] dqa,
    input wire [31:0] jpc,
    output reg [31:0] npc
);
    always @(*) begin
        if(pcsrc==0) begin npc = pc4; end
        if(pcsrc==1) begin npc = bpc; end
        if(pcsrc==2) begin npc = dqa; end
        if(pcsrc==3) begin npc = jpc; end
        end
endmodule

