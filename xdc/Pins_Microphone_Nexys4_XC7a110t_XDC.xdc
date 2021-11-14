# Microphone
set_property PACKAGE_PIN J5 [get_ports CLK]
set_property IOSTANDARD LVCMOS33 [get_ports CLK]

set_property PACKAGE_PIN F5 [get_ports L_R_SEL]
set_property IOSTANDARD LVCMOS33 [get_ports L_R_SEL]

set_property PACKAGE_PIN H5 [get_ports DATA]
set_property IOSTANDARD LVCMOS33 [get_ports DATA]


# PMOD - JA1
set_property PACKAGE_PIN B13 [get_ports CLK_pmod]
set_property IOSTANDARD LVCMOS33 [get_ports CLK_pmod]

# PMOD - JA2
set_property PACKAGE_PIN F14 [get_ports Right_channel]
set_property IOSTANDARD LVCMOS33 [get_ports Right_channel]

# PMOD - JA3
set_property PACKAGE_PIN D17 [get_ports Left_channel]
set_property IOSTANDARD LVCMOS33 [get_ports Left_channel]


# Crystal Oscillator
set_property IOSTANDARD LVCMOS33 [get_ports Clock_100MHz]
set_property PACKAGE_PIN E3 [get_ports Clock_100MHz]

# Slide switches
set_property PACKAGE_PIN U9 [get_ports Reset_n]
set_property IOSTANDARD LVCMOS33 [get_ports Reset_n]