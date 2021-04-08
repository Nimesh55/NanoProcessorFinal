# Clock signal
set_property PACKAGE_PIN W5 [get_ports Clk]
set_property IOSTANDARD LVCMOS33 [get_ports Clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports Clk]

#Buttons
set_property PACKAGE_PIN U18 [get_ports Reset]
set_property IOSTANDARD LVCMOS33 [get_ports Reset]

# LEDs
set_property PACKAGE_PIN U16 [get_ports {Reg7[0]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Reg7[0]}]
set_property PACKAGE_PIN E19 [get_ports {Reg7[1]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Reg7[1]}]
set_property PACKAGE_PIN U19 [get_ports {Reg7[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Reg7[2]}]
set_property PACKAGE_PIN V19 [get_ports {Reg7[3]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Reg7[3]}]

set_property PACKAGE_PIN P3 [get_ports {Negative_Flag}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Negative_Flag}]
set_property PACKAGE_PIN N3 [get_ports {Overflow_Flag}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Overflow_Flag}]
set_property PACKAGE_PIN P1 [get_ports {Zero_Flag}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Zero_Flag}]
set_property PACKAGE_PIN L1 [get_ports {Carry_Flag}]
    set_property IOSTANDARD LVCMOS33 [get_ports {Carry_Flag}]

#7 segment display
set_property PACKAGE_PIN W7 [get_ports {SD_7_display[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SD_7_display[0]}]
set_property PACKAGE_PIN W6 [get_ports {SD_7_display[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SD_7_display[1]}]
set_property PACKAGE_PIN U8 [get_ports {SD_7_display[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SD_7_display[2]}]
set_property PACKAGE_PIN V8 [get_ports {SD_7_display[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SD_7_display[3]}]
set_property PACKAGE_PIN U5 [get_ports {SD_7_display[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SD_7_display[4]}]
set_property PACKAGE_PIN V5 [get_ports {SD_7_display[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SD_7_display[5]}]
set_property PACKAGE_PIN U7 [get_ports {SD_7_display[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SD_7_display[6]}]