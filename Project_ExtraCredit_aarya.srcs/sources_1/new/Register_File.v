`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:11:45 PM
// Design Name: 
// Module Name: Register_File
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

module Register_File(
    input wire [4:0] rs,
    input wire [4:0] rt,
    output reg [31:0] qa,
    output reg [31:0] qb,
    input [4:0] wdestReg,
    input [31:0] wbData,
    input wwreg,
    input clk
);  
    reg [31:0] register [0:31];
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            register[i] = 32'h00000000;
        end
    end
    always @(*)
        begin
            qa = register[rs];
            qb = register[rt];
        end
    always @(negedge clk)
     begin
        if(wwreg == 1) begin
            register[wdestReg] = wbData;
        end
     end
endmodule


