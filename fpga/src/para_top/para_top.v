//para_top.v

module para_top(
//data path
sm_data,
sm_vld,
//para 
ph_ring,
ph_vld,
//fx bus
fx_waddr,
fx_wr,
fx_data,
fx_rd,
fx_raddr,
fx_q,
//clk rst
dev_id,
clk_sys,
rst_n
);
//data path
input [15:0]	sm_data;
input					sm_vld;
//para 
output [15:0]	ph_ring;
output 				ph_vld;
//fx_bus
input 				fx_wr;
input [7:0]		fx_data;
input [21:0]	fx_waddr;
input [21:0]	fx_raddr;
input 				fx_rd;
output  [7:0]	fx_q;
//clk rst
input [5:0] dev_id;
input clk_sys;
input rst_n;
//--------------------------------------
//--------------------------------------


wire [15:0]	cfg_th;
wire [31:0]	cfg_hdt;
wire [31:0]	cfg_ldt;
wire [15:0]	stu_hit_id;
wire [15:0] stu_ring;


//----------- register --------
wire [15:0] sta_para_ave;
para_regs u_para_regs( 
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(fx_q),
//register 
.sta_para_ave(sta_para_ave),
.cfg_th(cfg_th),
.cfg_hdt(cfg_hdt),
.cfg_ldt(cfg_ldt),
.stu_hit_id(stu_hit_id),
.stu_ring(stu_ring),
//clk rst
.dev_id(dev_id),
.clk_sys(clk_sys),
.rst_n(rst_n)
);


//--------- para_time --------
para_time u_para_time(
//data path
.sm_data(sm_data),
.sm_vld(sm_vld),
//para output
.sta_para_ave(sta_para_ave),

//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


//---------- para_hit --------
para_hit u_para_hit(
//data path
.sm_data(sm_data),
.sm_vld(sm_vld),
//register
.cfg_th(cfg_th),
.cfg_hdt(cfg_hdt),
.cfg_ldt(cfg_ldt),
.stu_now_hit(),
.stu_now_lock(),
.stu_hit_id(stu_hit_id),
.stu_ring(stu_ring),
//para 
.ph_ring(ph_ring),
.ph_vld(ph_vld),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);



endmodule

