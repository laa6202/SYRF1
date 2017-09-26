//app_top.v

module app_top(
//para input 
ph1_ring,
ph1_vld,
ph2_ring,
ph2_vld,
ph3_ring,
ph3_vld,
ph4_ring,
ph4_vld,
ph5_ring,
ph5_vld,
ph6_ring,
ph6_vld,
ph7_ring,
ph7_vld,
ph8_ring,
ph8_vld,
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
//para input 
input [15:0]	ph1_ring;
input 				ph1_vld;
input [15:0]	ph2_ring;
input 				ph2_vld;
input [15:0]	ph3_ring;
input 				ph3_vld;
input [15:0]	ph4_ring;
input 				ph4_vld;
input [15:0]	ph5_ring;
input 				ph5_vld;
input [15:0]	ph6_ring;
input 				ph6_vld;
input [15:0]	ph7_ring;
input 				ph7_vld;
input [15:0]	ph8_ring;
input 				ph8_vld;
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
//-----------------------------------------
//-----------------------------------------


//---------- configuration register ------
//rsgister 
wire [15:0]	cfg_ring_th;
wire [7:0]	stu_fracture;
wire [7:0]	clr_fracture;
app_reg u_app_reg(
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(fx_q),
//rsgister 
.cfg_ring_th(cfg_ring_th),
.stu_fracture(stu_fracture),
.clr_fracture(clr_fracture),
//clk rst
.dev_id(dev_id),
.clk_sys(clk_sys),
.rst_n(rst_n)

);



endmodule
