`timescale 1ns /1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Aarya Soni 
// 
// Create Date: 05/02/2025 03:24:10 PM
// Design Name: 
// Module Name: testbench
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


module testbench();
reg clk_tb;
wire [31:0] pc;
wire [31:0] dinstOut;
wire [31:0] ealu;
wire [31:0] mr;
wire [31:0] wbData;


DataPath dp(
    .clk(clk_tb),
    .pc(pc),
    .dinstOut(dinstOut),
    .ealu(ealu),
    .mr(mr),
    .wbData(wbData)
);

initial begin
    clk_tb = 0;
end
always begin
    #1 clk_tb = !clk_tb;
end

endmodule