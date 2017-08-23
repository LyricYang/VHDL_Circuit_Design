create_clock -period 10.000 -name clk -waveform {0.000 3.333} [get_ports clkin]

set_input_delay -clock [get_clocks -of_objects [get_pins clk_wiz_inst/inst/clkout2_buf/O]] 4.000 [get_ports {fifo_data_in[*]}]
set_output_delay -clock [get_clocks -of_objects [get_pins clk_wiz_inst/inst/clkout1_buf/O]] 1.000 [get_ports {data_out[*]}]

