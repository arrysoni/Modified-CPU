`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 03:11:11 PM
// Design Name: 
// Module Name: fwd_b_mux
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


module fwd_b_mux(
    input wire [1:0] fwdb,
    input wire [31:0] qb,
    input wire [31:0] r,
    input wire [31:0] mr,
    input wire [31:0] mdo,
    output reg [31:0] dqb
);
    always @(*) begin
        if(fwdb==0) begin dqb = qb; end
        if(fwdb==1) begin dqb = r; end
        if(fwdb==2) begin dqb = mr; end
        if(fwdb==3) begin dqb = mdo; end
    end
endmodule
