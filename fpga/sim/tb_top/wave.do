onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/syrf1_top/u_ad_top/cs_n
add wave -noupdate /tb/syrf1_top/u_ad_top/sclk
add wave -noupdate /tb/syrf1_top/u_ad_top/sdata
add wave -noupdate /tb/syrf1_top/u_ad_top/ad_data
add wave -noupdate /tb/syrf1_top/u_ad_top/ad_vld
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {952 ns} 0}
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
WaveRestoreZoom {917 ns} {1005 ns}
