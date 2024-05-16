# set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN Y19} [get_ports rx]
# set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V18} [get_ports tx]
 
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P2} [get_ports {button[4]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P4} [get_ports {button[3]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P5} [get_ports {button[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P1} [get_ports {button[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R1} [get_ports {button[0]}]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P20} [get_ports rst]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN Y18} [get_ports raw_clk]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K17} [get_ports {led[23]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L13} [get_ports {led[22]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M13} [get_ports {led[21]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K14} [get_ports {led[20]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K13} [get_ports {led[19]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M20} [get_ports {led[18]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN N20} [get_ports {led[17]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN N19} [get_ports {led[16]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M17} [get_ports {led[15]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M16} [get_ports {led[14]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M15} [get_ports {led[13]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K16} [get_ports {led[12]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L16} [get_ports {led[11]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L15} [get_ports {led[10]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L14} [get_ports {led[9]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J17} [get_ports {led[8]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN F21} [get_ports {led[7]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN G22} [get_ports {led[6]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN G21} [get_ports {led[5]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN D21} [get_ports {led[4]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN E21} [get_ports {led[3]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN D22} [get_ports {led[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN E22} [get_ports {led[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN A21} [get_ports {led[0]}]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN Y9} [get_ports {switch[23]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN W9} [get_ports {switch[22]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN Y7} [get_ports {switch[21]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN Y8} [get_ports {switch[20]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN AB8} [get_ports {switch[19]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN AA8} [get_ports {switch[18]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V8} [get_ports {switch[17]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V9} [get_ports {switch[16]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN AB6} [get_ports {switch[15]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN AB7} [get_ports {switch[14]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V7} [get_ports {switch[13]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN AA6} [get_ports {switch[12]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN Y6} [get_ports {switch[11]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T6} [get_ports {switch[10]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R6} [get_ports {switch[9]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V5} [get_ports {switch[8]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U6} [get_ports {switch[7]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN W5} [get_ports {switch[6]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN W6} [get_ports {switch[5]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U5} [get_ports {switch[4]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T5} [get_ports {switch[3]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T4} [get_ports {switch[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R4} [get_ports {switch[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN W4} [get_ports {switch[0]}]

# Credit: https://github.com/2catycm/SUSTech-CS202_214-Computer_Organization-Project
# Seven-segment digital tube binding - which among the eight
# set_property -dict {PACKAGE_PIN A18 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeNotEnable[7]}]
# set_property -dict {PACKAGE_PIN A20 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeNotEnable[6]}]
# set_property -dict {PACKAGE_PIN B20 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeNotEnable[5]}]
# set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeNotEnable[4]}]
# set_property -dict {PACKAGE_PIN F18 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeNotEnable[3]}]
# set_property -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeNotEnable[2]}]
# set_property -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeNotEnable[1]}]
# set_property -dict {PACKAGE_PIN C19 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeNotEnable[0]}]

# # From 0 to 7, it represents the A, B, C, D, E, F, G, DP segments of the standard seven-segment digital tube - which segments in the tube
# set_property -dict {PACKAGE_PIN E13 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeShape[7]}]
# set_property -dict {PACKAGE_PIN C15 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeShape[6]}]
# set_property -dict {PACKAGE_PIN C14 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeShape[5]}]
# set_property -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeShape[4]}]
# set_property -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeShape[3]}]
# set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeShape[2]}]
# set_property -dict {PACKAGE_PIN F13 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeShape[1]}]
# set_property -dict {PACKAGE_PIN F15 IOSTANDARD LVCMOS33} [get_ports {oDigitalTubeShape[0]}]