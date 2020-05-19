open_project BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE/BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE.xpr
reset_run synth_size
launch_runs synth_size
wait_on_run synth_size
open_run synth_size -name synth_size
report_utilization -cells [get_cells top/target/boom_tile] -hierarchical -file BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE/BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE_size.txt
report_power -hier all -file BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE/BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE_power.txt
exit
