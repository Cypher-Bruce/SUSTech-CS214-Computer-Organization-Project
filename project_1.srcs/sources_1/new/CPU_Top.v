`timescale 1ns / 1ps

/// Module: CPU_Top
/// #Description: This module is the top module of the CPU. 
///              It connects all the other modules together.
/// #Inputs: raw_clk, rst, switch
/// #Outputs: led
/// #Signals
///             clk: adjusted clock signal, 
///             inst: 32-bit instruction from inst. memory

///             branch_flag: flag indicates branch inst
///             ALU_Operation: 2-bit ALU operation code
///             ALU_src_flag: flag indicates ALU source
///             mem_read_flag: flag indicates memory read
///             mem_write_flag: flag indicates memory write
///             mem_to_reg_flag: flag indicates memory to register
///             reg_write_flag: flag indicates register write
///             zero_flag: flag indicates zero result

///             imme: 32-bit immediate value extracted from instruction
///             reg_data_1: 32-bit data from register file
///             reg_data_2: 32-bit data from register file
///             write_data: 32-bit data to be written to register file

///             ALU_result: 32-bit result from ALU
///             data_memory_data: 32-bit data from data memory

module CPU_Top(
    input         raw_clk,
    input         rst,
    input  [23:0] switch,
    input  [4:0]  button,
    output [23:0] led
);

////////////////////////// Clock divisions //////////////////////////
wire clk;
CPU_Main_Clock_ip CPU_Main_Clock_Instance( 
    .clk_in1(raw_clk), 
    .clk_out1(clk) 
);

////////////////////////// Controller //////////////////////////
wire [31:0]     inst;
wire            branch_flag;
wire [1:0]      ALU_Operation;
wire            ALU_src_flag;
wire            mem_read_flag;
wire            mem_write_flag;
wire            mem_to_reg_flag;
wire            reg_write_flag;
wire            jal_flag;
wire            jalr_flag;
wire            lui_flag;
wire            auipc_flag;
Controller Controller_Instance(
    .inst(inst),
    .branch_flag(branch_flag),
    .ALU_Operation(ALU_Operation),
    .ALU_src_flag(ALU_src_flag),
    .mem_read_flag(mem_read_flag),
    .mem_write_flag(mem_write_flag),
    .mem_to_reg_flag(mem_to_reg_flag),
    .reg_write_flag(reg_write_flag),
    .jal_flag(jal_flag),
    .jalr_flag(jalr_flag),
    .lui_flag(lui_flag),
    .auipc_flag(auipc_flag)
);

////////////////////////// Instruction Decode //////////////////////////
wire [31:0] reg_data_1;
wire [31:0] reg_data_2;
reg  [31:0] write_data;
wire [31:0] imme;
Decoder Decoder_Instance(
    .write_data(write_data),
    .reg_write_flag(reg_write_flag),
    .inst(inst),
    .clk(clk),
    .rst(rst),
    .read_data_1(reg_data_1),
    .read_data_2(reg_data_2),
    .imme(imme)
);

////////////////////////// Instrustion Fetch //////////////////////////
wire        zero_flag;
wire [31:0] program_counter;
Instruction_Fetch Instruction_Fetch_Instance(
    .clk(clk),
    .rst(rst),
    .branch_flag(branch_flag),
    .jal_flag(jal_flag),
    .jalr_flag(jalr_flag),
    .zero_flag(zero_flag),
    .imme(imme),
    .read_data_1(reg_data_1),
    .inst(inst),
    .program_counter(program_counter)
);

////////////////////////// Execution //////////////////////////
wire [31:0] ALU_result;
ALU ALU_Instance(
    .read_data_1(reg_data_1),
    .read_data_2(reg_data_2),
    .imme(imme),
    .ALU_Operation(ALU_Operation),
    .ALU_src_flag(ALU_src_flag),
    .inst(inst),
    .ALU_result(ALU_result),
    .zero_flag(zero_flag)
);

////////////////////////// Memory //////////////////////////
wire [31:0] data_memory_data;
Data_Memory Data_Memory_Instance(
    .clk(clk),
    .inst(inst),
    .address(ALU_result),
    .write_data(reg_data_2),
    .switch(switch),
    .mem_read_flag(mem_read_flag),
    .mem_write_flag(mem_write_flag),
    .read_data(data_memory_data),
    .led(led)
);

////////////////////////// WB //////////////////////////
always @*
begin
    if (jal_flag || jalr_flag)
    begin
        write_data = program_counter + 4;
    end 
    else if (lui_flag)
    begin
        write_data = imme;
    end
    else if (auipc_flag)
    begin
        write_data = program_counter + imme;
    end
    else if (mem_to_reg_flag)
    begin
        write_data = data_memory_data;
    end
    else
    begin
        write_data = ALU_result;
    end
end

endmodule
