onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_send/ast
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_send/cfg_pol
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_send/cfg_width
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_send/cmd_ast
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_send/fire_ast
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_send/st_ast
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_send/finish_send
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_send/cnt_send_us
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_send/pluse_us
add wave -noupdate /tb/syrf1_top/ast1_top/u_ast_send/pluse_us_here
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
