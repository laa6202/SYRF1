onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/syrf1_top/p1_top/u_para_time/sm_data
add wave -noupdate /tb/syrf1_top/p1_top/u_para_time/sm_vld
add wave -noupdate /tb/syrf1_top/p1_top/u_para_time/clk_sys
add wave -noupdate /tb/syrf1_top/p1_top/u_para_time/rst_n
add wave -noupdate /tb/syrf1_top/p1_top/u_para_time/cnt_vld
add wave -noupdate /tb/syrf1_top/p1_top/u_para_time/finish_period
add wave -noupdate /tb/syrf1_top/p1_top/u_para_time/a
add wave -noupdate /tb/syrf1_top/p1_top/u_para_time/sum_data
add wave -noupdate /tb/syrf1_top/p1_top/u_para_time/sum_temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2970 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 321
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {2755 ns} {4595 ns}
