onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/syrf1_top/u_chip_top/chip_d
add wave -noupdate /tb/syrf1_top/u_chip_top/chip_vld
add wave -noupdate /tb/syrf1_top/u_chip_top/chip_sel
add wave -noupdate /tb/syrf1_top/u_chip_top/chip_rdy
add wave -noupdate /tb/syrf1_top/u_chip_top/d1_data
add wave -noupdate /tb/syrf1_top/u_chip_top/d1_vld
add wave -noupdate /tb/syrf1_top/u_chip_top/sel_path
add wave -noupdate /tb/syrf1_top/u_chip_top/buf_rdy
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9759 ns} 0}
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
WaveRestoreZoom {0 ns} {42 us}
