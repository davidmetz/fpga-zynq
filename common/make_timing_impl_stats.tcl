open_project BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE/BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE.xpr
wait_on_run impl_1
open_run impl_1 -name impl_1
report_timing -cells [get_cells top/target/boom_tile] -file BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE/BOARD_NAME_HERE_rocketchip_CHISEL_CONFIG_HERE_timing_impl.txt
exit
