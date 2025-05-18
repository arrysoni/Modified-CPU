`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:33:05 PM
// Design Name: 
// Module Name: JumpControl
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

module JumpControl(
    input [5:0] op,
    input rsrtequ,             // 1 if rs == rt, used for beq
    output reg [1:0] pcsrc     // 00 = PC+4, 01 = branch, 10 = jump
);

    always @(*) begin
        case (op)
            6'b000100: begin // beq
                if (rsrtequ)
                    pcsrc = 2'b01; // branch target
                else
                    pcsrc = 2'b00; // PC + 4
            end
            6'b000010: begin // j
                pcsrc = 2'b10; // jump target
            end
            6'b000011: begin // jal
                pcsrc = 2'b10; // jump target
            end
            default: begin
                pcsrc = 2'b00; // default to PC + 4
            end
        endcase
    end

endmodule