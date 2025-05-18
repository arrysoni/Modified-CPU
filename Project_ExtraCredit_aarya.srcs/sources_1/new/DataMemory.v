`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:23:09 PM
// Design Name: 
// Module Name: DataMemory
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

module DataMemory (
    input clk,                   // clock 
    input [31:0] addr,           // ram address 
    input [31:0] datain,         // data in (to memory) 
    input we,                    // write enable 
    output reg [31:0] dataout    // data out (from memory) 
);
    reg [31:0] ram [0:31];       // ram cells: 32 words * 32 bits

    integer i;
    initial begin                // ram initialization
        for (i = 0; i < 32; i = i + 1)
            ram[i] = 0;

        // Initialize test values
        ram[5'h14] = 32'h000000a3;  // (50) data[0]
        ram[5'h15] = 32'h00000027;  // (54) data[1]
        ram[5'h16] = 32'h00000079;  // (58) data[2]
        ram[5'h17] = 32'h00000115;  // (5c) data[3]
    end

    always @(*) begin
        dataout = ram[addr[6:2]];  // use 5-bit word address
    end

    always @(posedge clk) begin
        if (we)
            ram[addr[6:2]] <= datain;  // write ram
    end
endmodule

