onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/tx_data
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/tx_vld
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/tx_done
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/d1_data
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/d1_vld
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/cfg_len
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/st_chip
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/done_buf
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/done_push
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/buf_vld
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/cnt_buf
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/cnt_push
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/word_push
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/wrreq
add wave -noupdate /tb/syrf1_top/u_chip_top/u_chip_main/wdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4509 ns} 0}
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
WaveRestoreZoom {5426 ns} {5697 ns}
