`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:21:05 PM
// Design Name: 
// Module Name: ALU
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

module ALU(
    input [31:0] a,
    input [31:0] b,
    input [3:0] ealuc,
    output reg [31:0] r
);
   always @(*)
    begin
      case (ealuc)
        4'b0010: r = a + b;                
        4'b0110: r = a - b;                  
        4'b0000: r = a & b;                  
        4'b0001: r = a | b;              
        4'b0011: r = a ^ b;                  
        4'b1010: r = b << a[4:0];        
        4'b1100: r = b >> a[4:0];            
        4'b1011: r = $signed(b) >>> a[4:0];  
        4'b0100: r = b << 16;                
        default: r = 32'b0;                
      endcase
    end
endmodule

