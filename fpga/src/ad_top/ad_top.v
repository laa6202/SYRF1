//ad_top.v

module ad_top(
//ad interface
cs_n,
sclk,
sdata,
//data path
ad_data,
ad_vld,
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
//ad interface
output cs_n;
output sclk;
input  sdata;
//data path
output [15:0]	ad_data;
output 				ad_vld;
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


//----------- register --------
wire [7:0]	cfg_ave;
wire [15:0] ad_data_s1;
wire [15:0]	ad_data_s2;
ad_regs u_ad_regs( 
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(fx_q),
//reg 
.cfg_ave(cfg_ave),
.stu_data_s1(ad_data_s1),
.stu_data_s2(ad_data_s2),
//clk rst
.dev_id(dev_id),
.clk_sys(clk_sys),
.rst_n(rst_n)
);


//--------- sclk gen ----------
wire sclk;
wire pluse;
wire [3:0] step;
sclk_gen u_sclk_gen(
.sclk(sclk),
.pluse(pluse),
.step(step),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


//---------- cs_n gen -------
wire cs_n;
csn_gen u_csn_gen(
.cs_n(cs_n),
.pluse(pluse),
.step(step),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


//-------- ad s2p ---------
//wire [15:0] ad_data_s1;	
wire 				ad_vld_s1;
ad_s2p u_ad_s2p(
//ad interface
.cs_n(cs_n),
.sclk(sclk),
.sdata(sdata),
//data path
.ad_data(ad_data_s1),
.ad_vld(ad_vld_s1),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


//---------- ad_filter -------
//wire [15:0] ad_data_s2;	
wire 				ad_vld_s2;
ad_filter u_ad_filter(
.ad_data_i(ad_data_s1),
.ad_vld_i(ad_vld_s1),
.ad_data_o(ad_data_s2),
.ad_vld_o(ad_vld_s2),
//cfg regs
.cfg_ave(cfg_ave),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


wire [15:0]	ad_data;
wire				ad_vld;
assign ad_data = ad_data_s2;
assign ad_vld = ad_vld_s2;
endmodule

