
set_property PACKAGE_PIN W5 [get_ports clk]							
	set_property IOSTANDARD LVCMOS33 [get_ports clk]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]
set_property PACKAGE_PIN V17 [get_ports {signal}]				
	set_property IOSTANDARD LVCMOS33 [get_ports {signal}]    
set_property PACKAGE_PIN U16 [get_ports {outedge}]	
	set_property IOSTANDARD LVCMOS33 [get_ports {outedge}]    
set_property PACKAGE_PIN U18 [get_ports reset]						
	set_property IOSTANDARD LVCMOS33 [get_ports reset]



