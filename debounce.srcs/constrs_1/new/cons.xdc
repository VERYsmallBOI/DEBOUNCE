## On-board Slide Switches
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports {in1_0}]
#set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports {rst}]


##set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports {in[2]}]
##set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports {in[3]}]



## On-board LEDs
#set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports {out1}]

#set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS33} [get_ports {q[1]}]
#set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {q[0]}]

set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports {clk_0}]
