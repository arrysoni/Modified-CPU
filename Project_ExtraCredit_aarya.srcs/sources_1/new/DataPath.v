//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: Aarya Soni
//// 
//// Create Date: 05/02/2025 03:23:47 PM
//// Design Name: 
//// Module Name: DataPath
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////



module DataPath(
    input clk,
    output wire [31:0] pc,
    output wire [31:0] dinstOut,
    output wire [31:0] ealu,
    output wire [31:0] mr,
    output wire [31:0] wbData
 );

    // Wires for instruction decoding (breaking down the fetched instruction into its fields)
    wire [31:0] npc;
    wire [31:0] inst_out;
    wire [5:0] op;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] shamt;
    wire [5:0] funct;
    wire [15:0] imm;
    wire [25:0] address;    
    
    // Assign instruction fields from dinstOut
    assign op = dinstOut[31:26];
    assign rs = dinstOut[25:21];
    assign rt = dinstOut[20:16];
    assign rd = dinstOut[15:11];
    assign shamt = dinstOut[10:6];
    assign funct = dinstOut[5:0];
    assign imm = dinstOut[15:0];
    assign address = dinstOut[25:0];
   
    // Basic control and datapath wires for instruction decode and register file
    wire wreg;
    wire wmem;
    wire m2reg;
    wire [3:0] aluc;
    wire aluimm;
    wire regrt;
    wire [4:0] destReg;
    wire [31:0] qa;
    wire [31:0] qb;
    wire [31:0] dqa;
    wire [31:0] dqb;
    wire [31:0] imm32;
   
    // Wires for ID/EX pipeline registers and EX stage inputs
    wire [31:0] b;
    wire [31:0] a;
    wire [1:0] fwda;
    wire [1:0] fwdb;
    wire ewreg;
    wire em2reg;
    wire ewmem;
    wire [3:0] ealuc;
    wire ealuimm;
    wire [4:0] edestReg;
    wire [31:0] eqa;
    wire [31:0] eqb;
    wire [31:0] eimm32;
    wire [31:0] r;

    // Wires between EXE and MEM stages
    wire mwreg;
    wire mm2reg;
    wire mwmem;
    wire [4:0] mdestReg;
    wire [31:0] mqb;
    wire [31:0] mdo;

    // Wires between MEM and WB stages
    wire wwreg;
    wire wm2reg;
    wire [4:0] wdestReg;
    wire [31:0] wr;
    wire [31:0] wdo;
   
    // Control and data wires for branching, jumping, and extras (delayed branching, shift, jal)
    wire [1:0] pcsrc;
    wire wpcir;
    wire [31:0] bpc;
    wire [31:0] jpc;
    wire [31:0] pc4;
    wire [31:0] dpc4;
    wire [31:0] epc4;    
    wire [31:0] epc8;    
    wire rsrtequ;
    wire sext;
    wire shift;
    wire jal;
    wire ejal;
    wire eshift;
    wire [4:0] edestReg2;

    // PC MUX: Chooses next PC value based on pcsrc (jump, branch, jr, or sequential)
    npc_MUX npc_mux_inst(
        .pcsrc(pcsrc),
        .pc4(pc4),
        .bpc(bpc),
        .dqa(dqa),
        .jpc(jpc),
        .npc(npc)
    );

    // Extends jump address with PC upper bits
    Address_Extender address_extender_inst(
        .address(address),
        .dpc4(dpc4),
        .jpc(jpc)
    );

    // Branch target adder
    BCP_Adder bcp_adder_inst(
        .dpc4(dpc4),
        .imm(imm),
        .bpc(bpc)
    );
   
    // Compares register values for branch equality
    equality_comparer equality_comparer_inst(
        .dqa(dqa),
        .dqb(dqb),
        .rsrtequ(rsrtequ)
    );
   
    // Adds 8 to PC (used for jal return address)
    PC_EXE_Adder pc_exe_adder_inst(
        .epc4(epc4),
        .epc8(epc8)
    );
   
    // Selects ALU input A: either from register or shift amount
    alu_a_mux alu_a_mux_inst(
        .eqa(eqa),
        .eimm32(eimm32),
        .eshift(eshift),
        .a(a)
    );

    // Selects final result to write for jal instruction
    jal_mux jal_mux_inst(
        .epc8(epc8),
        .r(r),
        .ejal(ejal),
        .ealu(ealu)
    );

    // Selects register $ra (31) as destination in jal
    jal_f jal_f_inst(
        .edestReg(edestReg),
        .ejal(ejal),
        .edestReg2(edestReg2)
    );

    // Program Counter register
    ProgramCounter ProgramCounter_inst (
        .clk(clk),
        .wpcir(wpcir),
        .npc(npc),
        .pc(pc)
    );
   
    // PC + 4 adder
    PCAdder ProgramCounterAdder_inst (
        .pc(pc),
        .pc4(pc4)
    );

    // Instruction Memory (read-only)
    InstructionMemory InstructionMemory_inst (
        .pc(pc),
        .instOut(inst_out)
    );
       
    // IF/ID pipeline register
    IFID_PipelineRegister ifid_inst (
        .clk(clk),
        .wpcir(wpcir),
        .instOut(inst_out),
        .dinstOut(dinstOut),
        .pc4(pc4),
        .dpc4(dpc4)
    );

    // Main control unit for decoding instructions
    ControlUnit ControlUnit_inst (
        .op(op),
        .func(funct),
        .wreg(wreg),
        .m2reg(m2reg),
        .wmem(wmem),
        .aluc(aluc),
        .aluimm(aluimm),
        .regrt(regrt),
        .rs(rs),
        .rt(rt),
        .mdestReg(mdestReg),
        .mm2reg(mm2reg),
        .mwreg(mwreg),
        .edestReg(edestReg),
        .em2reg(em2reg),
        .ewreg(ewreg),
        .fwdb(fwdb),
        .fwda(fwda),
        .wpcir(wpcir),
        .pcsrc(pcsrc),
        .rsrtequ(rsrtequ),
        .sext(sext),
        .shift(shift),
        .jal(jal)
    );

    // Forwarding mux for ALU input A
    fwd_a_mux fwda_mux_inst(
        .fwda(fwda),
        .qa(qa),
        .r(r),
        .mr(mr),
        .mdo(mdo),
        .dqa(dqa)
    );

    // Forwarding mux for ALU input B
    fwd_b_mux fwdb_mux_inst(
        .fwdb(fwdb),
        .qb(qb),
        .r(r),
        .mr(mr),
        .mdo(mdo),
        .dqb(dqb)
    );

    // MUX to select destination register (rd or rt)
    Regrt_MUX Multiplexer_inst (
        .rt(rt),
        .rd(rd),
        .regrt(regrt),
        .destReg(destReg)
    );

    // Register file
    Register_File FileRegister_inst (
        .rs(rs),
        .rt(rt),
        .qa(qa),
        .qb(qb),
        .wdestReg(wdestReg),
        .wbData(wbData),
        .wwreg(wwreg),
        .clk(clk)
    );

    // Immediate value extender (sign or zero)
    Immediate_Extender SignExtender_inst (
        .imm(imm),
        .sext(sext),
        .imm32(imm32)
    );

    // ID/EX pipeline register
    ID_EXE_Pipeline id_exe_inst (
        .clk(clk),
        .wreg(wreg),
        .ewreg(ewreg),
        .m2reg(m2reg),
        .em2reg(em2reg),
        .wmem(wmem),
        .ewmem(ewmem),
        .aluc(aluc),
        .ealuc(ealuc),
        .aluimm(aluimm),
        .ealuimm(ealuimm),
        .destReg(destReg),
        .edestReg(edestReg),
        .dqa(dqa),
        .eqa(eqa),
        .dqb(dqb),
        .eqb(eqb),
        .imm32(imm32),
        .eimm32(eimm32),
        .dpc4(dpc4),
        .epc4(epc4),
        .jal(jal),
        .ejal(ejal),
        .shift(shift),
        .eshift(eshift)
    );

    // ALU input B multiplexer
    alu_b_mux Alu_Mux_inst (
        .eqb(eqb),
        .eimm32(eimm32),
        .ealuimm(ealuimm),
        .b(b)
    );

    // Arithmetic Logic Unit
    ALU Alu_inst (
        .a(a),
        .b(b),
        .ealuc(ealuc),
        .r(r)
    );

    // EXE/MEM pipeline register
    EXE_MEM_Pipeline exe_mem_inst(
        .clk(clk),
        .ewreg(ewreg),
        .em2reg(em2reg),
        .ewmem(ewmem),
        .edestReg2(edestReg2),
        .ealu(ealu),
        .eqb(eqb),
        .mwreg(mwreg),
        .mm2reg(mm2reg),
        .mwmem(mwmem),
        .mdestReg(mdestReg),
        .mr(mr),
        .mqb(mqb)
    );

    // Data Memory (RAM)
    DataMemory Data_Memory_inst(
        .clk(clk),
        .addr(mr),       
        .datain(mqb),    
        .we(mwmem),      
        .dataout(mdo)      
    );

    // MEM/WB pipeline register
    MEM_WB_Pipeline mem_wb_inst(
        .clk(clk),
        .mwreg(mwreg),
        .mm2reg(mm2reg),
        .mdestReg(mdestReg),
        .mr(mr),
        .mdo(mdo),
        .wwreg(wwreg),
        .wm2reg(wm2reg),
        .wdestReg(wdestReg),
        .wr(wr),
        .wdo(wdo)
    );

    // Final write-back multiplexer
    WB_Mux Wb_Mux_inst(
        .wr(wr),
        .wdo(wdo),
        .wm2reg(wm2reg),
        .wbData(wbData)
    );
   
endmodule