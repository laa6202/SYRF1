//para_top.v

module para_top(

//fx bus
fx_waddr,
fx_wr,
fx_data,
fx_rd,
fx_raddr,
fx_q,
//clk rst
clk_sys,
dev_id,
rst_n
);

//fx_bus
input 				fx_wr;
input [7:0]		fx_data;
input [21:0]	fx_waddr;
input [21:0]	fx_raddr;
input 				fx_rd;
output  [7:0]	fx_q;
//clk rst
input [7:0] dev_id;
input clk_sys;
input rst_n;
//--------------------------------------
//--------------------------------------