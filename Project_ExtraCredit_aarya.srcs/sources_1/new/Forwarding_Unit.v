`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:26:57 PM
// Design Name: 
// Module Name: Forwarding_Unit
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

module ForwardingUnit(
    input [4:0] rs,        // Source register 1 from ID/EX stage
    input [4:0] rt,        // Source register 2 from ID/EX stage
    input [4:0] edestReg,  // Destination register from EX/MEM stage
    input [4:0] mdestReg,  // Destination register from MEM/WB stage
    input [4:0] wdestReg,  // Destination register from WB stage
    input ewreg,           // Register write enable from EX/MEM stage
    input mwreg,           // Register write enable from MEM/WB stage
    input wwreg,           // Register write enable from WB stage

    output reg [1:0] fwda, // Forward control for operand A
    output reg [1:0] fwdb  // Forward control for operand B
);

always @(*) begin
    // Default no forwarding
    fwda = 2'b00;
    fwdb = 2'b00;

    // Forward A
    if (ewreg && (edestReg != 0) && (edestReg == rs))
        fwda = 2'b01;  // Forward from EX stage
    else if (mwreg && (mdestReg != 0) && (mdestReg == rs))
        fwda = 2'b10;  // Forward from MEM stage
    else if (wwreg && (wdestReg != 0) && (wdestReg == rs))
        fwda = 2'b11;  // Forward from WB stage

    // Forward B
    if (ewreg && (edestReg != 0) && (edestReg == rt))
        fwdb = 2'b01;
    else if (mwreg && (mdestReg != 0) && (mdestReg == rt))
        fwdb = 2'b10;
    else if (wwreg && (wdestReg != 0) && (wdestReg == rt))
        fwdb = 2'b11;
end

endmodule
