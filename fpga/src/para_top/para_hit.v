//para_hit.v

module para_hit(
//data path
sm_data,
sm_vld,
//register
cfg_th,
cfg_hdt,
cfg_ldt,
cfg_swt,
cfg_hwt,
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
input [31:0]	cfg_hdt;
input [31:0]	cfg_ldt;
input [15:0]	cfg_swt;	
input [15:0]	cfg_hwt;	
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


wire force_end;
hit_main u_hit_main(
//data path
.sm_data(sm_data),
.sm_vld(sm_vld),
//register
.cfg_th(cfg_th),
.cfg_hdt(cfg_hdt),
.cfg_ldt(cfg_ldt),
.cfg_swt(cfg_swt),
.cfg_hwt(cfg_hwt),
.stu_now_hit(stu_now_hit),
.stu_now_lock(stu_now_lock),
.stu_hit_id(stu_hit_id),
.force_end(force_end),
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
.force_end(force_end),
//para
.ph_ring(ph_ring),
.ph_vld(ph_vld),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


endmodule

