onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/syrf1_top/u_commu_top/u_phy_utx/uart_tx
add wave -noupdate /tb/syrf1_top/u_commu_top/u_phy_utx/tx_data
add wave -noupdate /tb/syrf1_top/u_commu_top/u_phy_utx/tx_vld
add wave -noupdate /tb/syrf1_top/u_commu_top/u_phy_utx/pluse_us
add wave -noupdate /tb/syrf1_top/u_control_top/fx_q
add wave -noupdate /tb/syrf1_top/u_control_top/u_cfg_reg/fx_wr
add wave -noupdate /tb/syrf1_top/u_control_top/u_cfg_reg/fx_data
add wave -noupdate /tb/syrf1_top/u_control_top/u_cfg_reg/fx_waddr
add wave -noupdate /tb/syrf1_top/u_control_top/u_cfg_reg/fx_raddr
add wave -noupdate /tb/syrf1_top/u_control_top/u_cfg_reg/fx_rd
add wave -noupdate /tb/syrf1_top/u_control_top/u_cfg_reg/fx_q
add wave -noupdate /tb/syrf1_top/u_control_top/u_cfg_reg/cfg_dbg5
add wave -noupdate /tb/syrf1_top/u_control_top/u_cfg_reg/q0
add wave -noupdate /tb/syrf1_top/ad1_top/u_ad_regs/now_rd
add wave -noupdate /tb/syrf1_top/ad1_top/u_ad_regs/dev_id
add wave -noupdate /tb/syrf1_top/ad1_top/u_ad_regs/q0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6239 ns} 0}
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
