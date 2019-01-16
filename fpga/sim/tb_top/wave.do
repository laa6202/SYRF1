onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_buf/chip_d
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_buf/chip_vld
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_buf/chip_sel
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_buf/chip_rdy
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pkg_main/fire_pchip
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pkg_main/done_pchip
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pkg_main/pcbuf_full
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pkg_main/pcbuf_empty
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pkg_main/st_pkg_main
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_push/fire_pcpush
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_push/done_pcpush
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_push/pchip_d
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_push/pchip_vld
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_push/pchip_done
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_push/pcbuf_rdreq
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_push/pcbuf_q
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_push/st_pchip_push
add wave -noupdate /tb/syrf1_top/u_pkg_top/u_pchip_push/finish_push
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {81377 ns} 0}
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
WaveRestoreZoom {0 ns} {231 us}
