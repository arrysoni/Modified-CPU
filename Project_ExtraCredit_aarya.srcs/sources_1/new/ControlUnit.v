`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2025 06:13:26 PM
// Design Name: 
// Module Name: ControlUnit
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

module ControlUnit(
input wire [5:0] op,
    input wire [5:0] func,
    output reg wreg,
    output reg m2reg,
    output reg wmem,
    output reg [3:0]aluc,
    output reg aluimm,
    output reg regrt,
    input wire [4:0] rs,
    input wire [4:0] rt,
    input wire [4:0] mdestReg,
    input wire mm2reg,
    input wire mwreg,
    input wire [4:0] edestReg,
    input wire em2reg,
    input wire ewreg,
    output reg [1:0] fwdb,
    output reg [1:0] fwda,
    output reg wpcir,
    output reg [1:0] pcsrc,
    input wire rsrtequ,
    output reg jal,
    output reg shift,
    output reg sext
);
    initial begin wpcir = 1'b1; pcsrc = 2'b00; end
    reg stall = 1'b0;
    reg i_rs = 1'b0;
    reg i_rt = 1'b0;
    always @(*) begin
        wpcir = 1'b1;
        shift = 0;
        if(op == 6'b000000) begin i_rs = 1'b1; i_rt = 1'b1; end
        if(op == 6'b100011) begin i_rs = 1'b1; i_rt = 1'b0; end
        stall = ewreg & em2reg & (edestReg!=0) & (i_rs & (edestReg == rs) | i_rt & (edestReg == rt));
        if(stall) begin
            wpcir = 1'b0;
            wreg = 0;
            m2reg = 0;
            wmem = 0;
            aluc = 4'b0000;
        end
        else begin
        case(op)
            6'b000000: begin
                wreg = 1;  
                m2reg = 0;
                wmem = 0;
                aluimm = 0;
                regrt = 0;
                jal = 0;
                pcsrc = 2'b00;
                case(func)
                    6'b100000: aluc = 4'b0010;
                    6'b100010: aluc = 4'b0110;
                    6'b100100: aluc = 4'b0000;
                    6'b100101: aluc = 4'b0001;
                    6'b100110: aluc = 4'b0011;
                    6'b000000: begin aluc = 4'b1010; shift = 1; end
                    6'b000010: begin aluc = 4'b1100; shift = 1; end
                    6'b000011: begin aluc = 4'b1011; shift = 1; end
                    6'b001000: pcsrc = 2'b10;
                   
                endcase
            end

            6'b001000:
            begin
                wreg = 1;
                regrt = 1;
                m2reg = 0;
                wmem = 0;
                aluc = 4'b0010;
                aluimm = 1;
                sext = 1;
                jal = 0;
                pcsrc = 2'b00;
            end
            6'b001100:
            begin
                wreg = 1;
                regrt = 1;
                wmem = 0;
                m2reg = 0;
                aluc = 4'b0000;
                aluimm = 1;
                sext = 0;    
                jal = 0;  
                pcsrc = 2'b00;                          
            end  
            6'b001101:
            begin
                wreg = 1;
                regrt = 1;
                wmem = 0;
                m2reg = 0;
                aluc = 4'b0001;
                aluimm = 1;
                sext = 0;    
                jal = 0;
                pcsrc = 2'b00;                
            end      
            6'b001110:
            begin
                wreg = 1;
                regrt = 1;
                wmem = 0;
                m2reg = 0;
                aluc = 4'b0011;
                aluimm = 1;
                sext = 0;  
                jal = 0;
                pcsrc = 2'b00;                  
            end                                
            6'b100011:
            begin
                wreg = 1;
                regrt = 1;
                m2reg = 1;
                wmem = 0;
                aluc = 4'b0010;
                aluimm = 1;
                sext = 1;
                jal = 0;
                pcsrc = 2'b00;                
            end
            6'b101011:
            begin
                wreg = 0;
                regrt = 1;
                m2reg = 0;
                wmem = 1;
                aluc = 4'b0010;
                aluimm = 1;
                sext = 1;
                jal = 0;
                pcsrc = 2'b00;                
            end
            6'b000100:
            begin
                wreg = 0;
                m2reg = 0;
                wmem = 0;
                aluc = 4'b0110;
                aluimm = 0;
                jal = 0;
                pcsrc = rsrtequ ? 2'b01 : 2'b00;        
            end  
            6'b000101:
            begin
                wreg = 0;
                m2reg = 0;
                wmem = 0;
                aluc = 4'b0110;
                aluimm = 0;
                jal = 0;
                pcsrc = rsrtequ ? 2'b00 : 2'b01;
            end          
            6'b001111:
            begin
                pcsrc = 2'b00;
                wreg = 1;
                m2reg = 0;
                wmem = 0;
                aluc = 4'b0100;
                aluimm = 1;
                sext = 0;
                jal = 0;
            end  
       
            6'b000010:
            begin
                wreg = 0;
                m2reg = 0;
                wmem = 0;
                aluimm = 0;
                aluc = 4'b0000;
                pcsrc = 2'b11;
                jal = 0;
            end  
            6'b000011:
            begin
                m2reg = 0;
                wmem = 0;
                aluimm = 0;
                aluc = 4'b0000;
                pcsrc = 2'b11;
                wreg = 1;
                jal = 1;
            end                              
         endcase end
    end    
 
    always @(*) begin

        fwda = 2'b00;
        fwdb = 2'b00;
       

        if (ewreg && (edestReg == rs) && !em2reg) begin

            fwda = 2'b01;
        end else if (mwreg && (mdestReg == rs) && !mm2reg) begin

            fwda = 2'b10;
        end else if (mwreg && (mdestReg == rs) && mm2reg) begin

            fwda = 2'b11;
        end
 

        if (ewreg && (edestReg == rt) && !em2reg) begin

            fwdb = 2'b01;
        end else if (mwreg && (mdestReg == rt) && !mm2reg) begin
 
            fwdb = 2'b10;
        end else if (mwreg && (mdestReg == rt) && mm2reg) begin

            fwdb = 2'b11;
        end
    end
endmodule
