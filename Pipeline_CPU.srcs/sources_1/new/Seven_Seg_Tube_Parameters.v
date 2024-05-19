// Seven_Seg_Tube_Parameters.v

// Digit Shape
`define DIGIT_SHAPE_0 7'b0111111
`define DIGIT_SHAPE_1 7'b0000110
`define DIGIT_SHAPE_2 7'b1011011
`define DIGIT_SHAPE_3 7'b1001111
`define DIGIT_SHAPE_4 7'b1100110
`define DIGIT_SHAPE_5 7'b1101101
`define DIGIT_SHAPE_6 7'b1111101
`define DIGIT_SHAPE_7 7'b0100111
`define DIGIT_SHAPE_8 7'b1111111
`define DIGIT_SHAPE_9 7'b1101111
`define DIGIT_SHAPE_A 7'b1110111
`define DIGIT_SHAPE_B 7'b1111100
`define DIGIT_SHAPE_C 7'b0111001
`define DIGIT_SHAPE_D 7'b1011110
`define DIGIT_SHAPE_E 7'b1111001
`define DIGIT_SHAPE_F 7'b1110001

// Clock Divider
`define half_period 50000 // if you wish to debug, set it to 2