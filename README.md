# SUSTech-CS214-Computer-Organization-Project

## Introduction

This is the final project for the course CS214 Computer Organization at SUSTech. The project is to implement a simple 5-stage pipelined CPU in Verilog. The CPU is based on the RISC-V instruction set architecture (ISA). The CPU is capable of executing the RV32I base integer instruction set except `sb`, `sh`, `ecall` and `ebreak` instructions.

This project runs on Minisys board, not EGO-1 board. Please make sure you have the correct board before running the project.

## Repository Contents

This repository contains the following contents:
- Pipelined CPU source code
- Assembly files and COE files for testing
- Useful tools: RARS(a RISC-V assembly code simulator), UARTCoe_v3.0.exe(a UART transmit tool). The tools can be found under SUSTech-CS214-Computer-Organization-Project/Assembly

## Project Feature

- **5-stage pipeline**: The CPU is implemented with a 5-stage pipeline, including Instruction Fetch (IF), Instruction Decode (ID), Execute (EX), Memory Access (MEM), and Write Back (WB).
  - **Forwarding Unit**: The CPU is equipped with a forwarding unit to handle data hazards.
  - **Hazard Detection Unit**: The CPU is equipped with a hazard detection unit to handle load-use hazards.
- **Branch Prediction**: The CPU is equipped with a simple branch prediction module to predict the program counter value.
- **`lui` and `auipc` Instructions**: The CPU is capable of executing `lui` and `auipc` instructions.
- **Bug-free**: During our testing, the CPU is bug-free for its hardware implementation. We are confident that any program that runs on the RARS simulator will run correctly on our CPU. If you find any bugs, please let us know.
- **Well documented**: Each module is documented in detail, we hope this can help you understand the code, because this helped us a lot :)

## Project Structure
Please refer to the report for detailed information about the project structure.

## How to Run

### From Pre-built Bitstream
1. Download the project to your local machine.
2. Open Vivado and connect your FPGA board to your computer.
3. Program the FPGA with the pre-built bitstream `Top.bit`.

### From Scratch
1. Download the project to your local machine.
2. Open `Pipeline_CPU.xpr` in Vivado.
3. Import design files `Pipeline_CPU.srcs/sources_1` to the project (please make sure you have `uart_bmpg_0` IP core, which is a custom IP core provided by the instructor and does not exist in Vivado by default).
4. Import constraints file `Pipeline_CPU.srcs/constrs_1/new/Constraint.xdc` to the project.
5. Run generate bitstream.
   
## How to Load Program

### Write and assemble your program
1. Write your program in RARS.
2. Set Memory Configuration to `Compact, Text at Address 0` under `Settings/ Memory Configuration`.
3. Assemble your program.
4. Dump your instructions to `inst.txt` and data to `data.txt` using the `File/Dump Memory` function, set dump format to `Hexadecimal Text`.

### Load your program by `.coe` file (Not Recommended)
1. Copy and paste your `inst.txt` and `data.txt` to the same directory as `GenUBit_RISC_V.bat`, `rars2coe.exe` and `UARTCoe_v3.0.exe` (provided under `/Assembly`).
2. Run `GenUBit_RISC_V.bat` to generate `prgmip32.coe` and `dmem32.coe`.
3. Set `prgmip32.coe` and `dmem32.coe` as the initial memory content in the `Instruction Memory` and `Data Memory` respectively.
4. Run generate bitstream.

### Load your program by UART (Recommended)
1. Copy and paste your `inst.txt` and `data.txt` to the same directory as `GenUBit_RISC_V.bat`, `rars2coe.exe` and `UARTCoe_v3.0.exe` (provided under `/Assembly`).
2. Run `GenUBit_RISC_V.bat` to generate `out.txt`.
3. Run `UartAssist.exe` (provided under `/Assembly`), set the baud rate to 128000, and load `out.txt`.
4. Run generate bitstream and program the FPGA.
5. Press P2 on the FPGA board to enter the UART communication mode.
6. Send the program to the FPGA by clicking `Send` in `UartAssist.exe`.
7. Wait until `Program Done` is displayed in `UartAssist.exe`.
8. Press S6 (Reset) on the FPGA board to start the program.

## Code Conventions
For the sake of code quality, we have some regulations for the code:
1. **Naming**: 
    - **Variable**: Use `snake_case` for variable names. Example: `read_data`
      - **value**: No special requirements
      - **flag**: Use **_flag** as the suffix. Example: `mem_read_flag`
      - **data**: For data from/to memory/register, use **_data** as the suffix. Example: `write_data`
      - **constant**: Use all uppercase with underscore for constants. Example: `HALF_PERIOD` (should be defined in a separate parameter file under `/Parameters`)
    - **stage**: If the variable is present in multiple stages, put stage name as the final suffix. Example: `instruction_IF`
    - **Module**: Use `snake_case` with uppercase for module names. Example: `Decoder`
    - **Instance**: Use `<module_name> + _ + Instance` for instance names. Example: `Decoder_Instance`
    - **Ip Core**: Use `snake_case` with suffix `_ip` for IP core names. Example: `CPU_Main_Clock_ip`
2. **Constants**: For all constants, please put them in the `Parameters.v` and reference them in the code. An example is shown in ``Instruction_Fetch.v``.
3. **Instantiation**: When instantiating a module, please use the following format:
    ```verilog
        <module_name> <module_name> + _ + Instance(
            .<port_name>(<port_name>)
        );
    ```
    For example:
    ```verilog
        Controller Controller_Instance(
            .inst(inst),
            .branch_flag(branch_flag),
            .ALU_Operation(ALU_Operation),
            .ALU_src_flag(ALU_src_flag),
            .mem_read_flag(mem_read_flag),
            .mem_write_flag(mem_write_flag),
            .mem_to_reg_flag(mem_to_reg_flag),
            .reg_write_flag(reg_write_flag)
        );
    ```
        
