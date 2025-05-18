`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2025 03:10:56 PM
// Design Name: 
// Module Name: fwd_a_mux
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


module fwd_a_mux(
    input wire [1:0] fwda,
    input wire [31:0] qa,
    input wire [31:0] r,
    input wire [31:0] mr,
    input wire [31:0] mdo,
    output reg [31:0] dqa
);

    always @(*) begin
        if(fwda==0) begin dqa = qa; end
        if(fwda==1) begin dqa = r; end
        if(fwda==2) begin dqa = mr; end
        if(fwda==3) begin dqa = mdo; end
    end
endmodule

