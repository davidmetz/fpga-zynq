open_project BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE/BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE.xpr
wait_on_run synth_size
open_run synth_size -name synth_size
report_timing -cells [get_cells top/target/boom_tile] -file BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE/BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE_timing.txt
exit
