onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/syrf1_top/ast1_top/fx_wr
add wave -noupdate /tb/syrf1_top/ast1_top/fx_data
add wave -noupdate /tb/syrf1_top/ast1_top/fx_waddr
add wave -noupdate /tb/syrf1_top/ast1_top/fx_raddr
add wave -noupdate /tb/syrf1_top/ast1_top/fx_rd
add wave -noupdate /tb/syrf1_top/ast1_top/fx_q
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_regs/stu_sensor
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_regs/cfg_pol
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_regs/cfg_width
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_regs/cmd_ast
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4941 ns} 0}
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
WaveRestoreZoom {5490 ns} {5574 ns}
