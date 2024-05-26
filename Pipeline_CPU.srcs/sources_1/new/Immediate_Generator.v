`timescale 1ns / 1ps

/// Module: Immediate_Generator
/// #Description: generate the immediate value based on the instruction
/// #Inputs: inst
/// #Outputs: imme
/// #Note: 
///   - immediate is signed exteneded from 12/20 bits to 32 bits
///   - immediate from branch is left shifted by 1 bit

module Immediate_Generator(
    input wire [31:0] inst,
    output reg [31:0] imme
);

always @(*) 
begin
    case(inst[6:0])
    7'b0110011: // R
    begin
        imme = 32'b0;
    end
    7'b0010011, 7'b0000011, 7'b1100111: // I
    begin
        imme = {{20{inst[31]}}, inst[31:20]};
    end
    7'b0100011: // S
    begin
        imme = {{20{inst[31]}}, inst[31:25], inst[11:7]};
    end
    7'b1100011: // B
    begin
        imme = {{19{inst[31]}}, inst[31], inst[7], inst[30:25], inst[11:8], 1'b0};
    end
    7'b0110111, 7'b0010111: // U
    begin
        imme = {inst[31:12], 12'b0};
    end
    7'b1101111: // J
    begin
        imme = {{11{inst[31]}}, inst[31], inst[19:12], inst[20], inst[30:21], 1'b0};
    end
    default:
    begin
        imme = 32'b0;
    end
    endcase
end

endmodule
