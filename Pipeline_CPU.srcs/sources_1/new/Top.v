`timescale 1ns / 1ps

module Top(
    input             raw_clk,
    input             rst,
    input  [23:0]     switch,
    input  [4:0]      button,
    output [23:0]     led,
    output [7:0]      tube_select_onehot,
    output [7:0]      tube_shape
);

wire [31:0] seven_seg_tube;

CPU_Top CPU_Top_Instance(
    .raw_clk(raw_clk),
    .rst(rst),
    .switch(switch),
    .button(button),
    .led(led),
    .seven_seg_tube(seven_seg_tube)
);

Seven_Seg_Tube_Driver Seven_Seg_Tube_Driver_Instance(
    .raw_clk(raw_clk),
    .rst(rst),
    .data(seven_seg_tube),
    .tube_select_onehot(tube_select_onehot),
    .tube_shape(tube_shape)
);
endmodule
