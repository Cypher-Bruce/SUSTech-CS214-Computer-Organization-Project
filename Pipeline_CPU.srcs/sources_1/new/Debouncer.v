`timescale 1ns / 1ps
`include "Debouncer_Parameters.v"

module Debouncer(
    input cpu_clk,
    input rst,
    input [4:0] button,
    output     [4:0] debounced_button,
    output reg [4:0] push_button_flag,
    output reg [4:0] release_button_flag
);

reg [31:0] clock_divider_counter;
reg clk;

always @(posedge cpu_clk or posedge rst) begin
    if (rst) begin
        clock_divider_counter <= 32'b0;
        clk <= 1'b0;
    end
    else begin
        if (clock_divider_counter == `DEBOUNCER_HALF_PERIOD - 1) begin
            clock_divider_counter <= 32'b0;
            clk <= ~clk;
        end
        else begin
            clock_divider_counter <= clock_divider_counter + 1;
        end
    end
end

reg [4:0] button_current;
reg [4:0] button_previous;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        button_current <= 5'b00000;
        button_previous <= 5'b00000;
    end
    else begin
        button_current <= button;
        button_previous <= button_current;
    end
end

// to be noted: we want to make sure the two flags
// are only 1 cpu_clk wide, so the assignment should
// be done in a cpu_clk synchronous way

assign debounced_button = button_current & button_previous;

always @(posedge cpu_clk or posedge rst) begin
    if (rst) begin
        push_button_flag <= 5'b00000;
        release_button_flag <= 5'b00000;
    end
    else begin
        push_button_flag <= (button_current & ~button_previous);
        release_button_flag <= (~button_current & button_previous);
    end
end
endmodule