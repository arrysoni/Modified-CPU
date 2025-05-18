`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:24:24 PM
// Design Name: 
// Module Name: MEM_WB_Pipeline
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

module MEM_WB_Pipeline(
    input clk,      
    input mwreg,      
    input mm2reg,      
    input [4:0] mdestReg,
    input [31:0] mr,  
    input [31:0] mdo,  
   
    output reg wwreg,    
    output reg wm2reg,    
    output reg [4:0] wdestReg,
    output reg [31:0] wr,  
    output reg [31:0] wdo
);
    always @(posedge clk) begin
        wwreg    <= mwreg;
        wm2reg   <= mm2reg;
        wdestReg <= mdestReg;
        wr       <= mr;
        wdo      <= mdo;
    end
endmodule
