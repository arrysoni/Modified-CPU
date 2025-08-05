# CMPEN 331 Final Project – 5-Stage Pipelined MIPS CPU

## 📚 Overview
This project implements a 5-stage pipelined MIPS CPU using Verilog on the Zybo board (Device: XC7Z010-1CLG400C). It supports essential MIPS instructions, internal data forwarding, stall handling, and delayed branching. The design is synthesized and simulated using Xilinx Vivado.

## 🛠️ Pipeline Architecture
The CPU follows the standard 5-stage MIPS pipeline:
1. **IF (Instruction Fetch)**: Fetches instruction from ROM and increments PC.
2. **ID (Instruction Decode)**: Decodes instruction, reads registers, calculates branch conditions.
3. **EXE (Execute)**: Performs ALU operations, calculates jump/branch addresses.
4. **MEM (Memory Access)**: Accesses RAM for `lw` and `sw`.
5. **WB (Write Back)**: Writes back results to the register file.

## ✅ Key Features
- **Hazard Detection** and pipeline **Stall Logic**
- **Internal Forwarding** to resolve data hazards
- **Delayed Branch** mechanism for control hazards
- Implements `jal`, `jr`, `beq`, `bne`, `lw`, `sw`, `addi`, `sll`, `sra`, `srl`, etc.
- Testbench verifies correctness with a subroutine summing memory values

## 🧪 Test Program
A test instruction sequence (based on `instruction_memory.v`) checks all major CPU functionalities, including:
- Subroutine call via `jal`
- Pipeline stalls via `lw` followed by `add`
- Control hazards with delayed branching
- Storing final results to data memory using `sw`


## 🖥️ Tools Used
- **Vivado Design Suite** (for simulation, synthesis, and bitstream generation)
- **Zybo Board** (XC7Z010-1CLG400C)
- **Verilog HDL**
- **ModelSim/Vivado Simulator** (for waveform analysis)

## 📷 Screenshots

### 🔹 Waveforms verifying the `lw` and `add` instructions
![Waveform](https://github.com/arrysoni/Modified-CPU/blob/main/images/waveform_extra_credit.png?raw=true)

### 🔹 Synthesized design schematics
![Schematic](https://github.com/arrysoni/Modified-CPU/blob/main/images/schematic_extra_credit.png?raw=true)

### 🔹 I/O Planning Visual
![IO Planning](https://github.com/arrysoni/Modified-CPU/blob/main/images/IO_extra_credit.png?raw=true)

### 🔹 Floor Planning Visual
![Floor Planning](https://github.com/arrysoni/Modified-CPU/blob/main/images/floorplanning_extra_credit.png?raw=true)


## 📝 Report Includes
- Verilog design & testbench code
- Project abstract and introduction with architectural diagram
- Simulation waveforms (Figure 7 equivalent)
- Synthesis schematics and planning snapshots
- Free of syntax/synthesis errors

---


