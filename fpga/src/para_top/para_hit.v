//para_hit.v

module para_hit(
//data path
sm_data,
sm_vld,
//register
cfg_th,
cfg_hdt,
cfg_ldt,
stu_now_hit,
stu_now_lock,
stu_hit_id,
stu_ring,
//para 
ph_ring,
ph_vld,
//clk rst
clk_sys,
rst_n
);
//data path
input [15:0]	sm_data;
input					sm_vld;
//register
input [15:0]	cfg_th;
input [15:0]	cfg_hdt;
input [15:0]	cfg_ldt;
output stu_now_hit;
output stu_now_lock;
output [15:0] stu_hit_id;
output [15:0] stu_ring;
//para 
output [15:0]	ph_ring;
output 				ph_vld;
//clk rst
input clk_sys;
input rst_n;
//--------------------------------
//--------------------------------

hit_main u_hit_main(
//data path
.sm_data(sm_data),
.sm_vld(sm_vld),
//register
.cfg_th(cfg_th),
.cfg_hdt(cfg_hdt),
.cfg_ldt(cfg_ldt),
.stu_now_hit(stu_now_hit),
.stu_now_lock(stu_now_lock),
.stu_hit_id(stu_hit_id),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


hit_ring u_hit_ring(
//data path
.sm_data(sm_data),
.sm_vld(sm_vld),
//register
.cfg_th(cfg_th),
.stu_now_hit(stu_now_hit),
.stu_now_lock(stu_now_lock),
.stu_ring(stu_ring),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


endmodule

