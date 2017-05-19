//ad_top.v

module ad_top(
//ad interface
cs_n,
sclk,
sdata,
//data path
ad_data,
ad_vld,
//clk rst
clk_sys,
rst_n
);
//ad interface
output cs_n;
output sclk;
input  sdata;
//data path
output [15:0]	ad_data;
output ad_vld;
//clk rst
input clk_sys;
input rst_n;
//-----------------------------------------


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
ad_s2p u_ad_s2p(
//ad interface
.cs_n(cs_n),
.sclk(sclk),
.sdata(sdata),
//data path
.ad_data(ad_data),
.ad_vld(ad_vld),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


endmodule

