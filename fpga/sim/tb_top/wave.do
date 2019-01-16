onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_buf/chip_d
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_buf/chip_vld
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_buf/chip_sel
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_buf/chip_rdy
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_buf/chip_len
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_buf/pchip_full
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_buf/pchip_empty
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_buf/usedw
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
