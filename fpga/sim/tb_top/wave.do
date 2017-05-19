onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/syrf1_top/u_ad_top/cs_n
add wave -noupdate /tb/syrf1_top/u_ad_top/sclk
add wave -noupdate /tb/syrf1_top/u_ad_top/sdata
add wave -noupdate /tb/syrf1_top/u_ad_top/ad_data
add wave -noupdate /tb/syrf1_top/u_ad_top/ad_vld
add wave -noupdate /tb/syrf1_top/ch1_cs_n
add wave -noupdate /tb/syrf1_top/ch1_sclk
add wave -noupdate /tb/syrf1_top/ch1_sdata
add wave -noupdate /tb/syrf1_top/u_commu_top/u_phy_utx/uart_tx
add wave -noupdate /tb/syrf1_top/u_commu_top/u_phy_utx/tx_data
add wave -noupdate /tb/syrf1_top/u_commu_top/u_phy_utx/tx_vld
add wave -noupdate /tb/syrf1_top/u_commu_top/u_phy_utx/pluse_us
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5342 ns} 0}
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
WaveRestoreZoom {0 ns} {7350 ns}
