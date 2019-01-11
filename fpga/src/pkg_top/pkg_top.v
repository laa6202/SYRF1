//pkg_top.v

module pkg_top(
//pkg data
pkg_d,
pkg_vld,
pkg_done,
//chip path
chip_d,
chip_vld,
chip_sel,
chip_rdy,
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
pluse_us,
rst_n
);
//pkg data
output [15:0]	pkg_d;
output				pkg_vld;
input					pkg_done;
//chip path
input [15:0]chip_d;
input				chip_vld;
input [6:0]	chip_sel;
output			chip_rdy;
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
input pluse_us;
input rst_n;
//-----------------------------------
//-----------------------------------


pkg_regs u_pkg_regs(
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(fx_q),
//clk rst
.dev_id(dev_id),
.clk_sys(clk_sys),
.rst_n(rst_n)
);


wire chip_rdy = 1'b1;

endmodule

