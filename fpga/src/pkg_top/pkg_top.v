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
chip_len,
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
input [19:0]chip_len;
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

//--------- regs ---------
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


//----------- pkg_main -----------
//control signal
wire fire_pchip;
wire done_pchip;
wire fire_papp;
wire done_papp;
//buf satus
wire pcbuf_full;
wire pcbuf_empty;
wire pabuf_full;
wire pabuf_empty;
pkg_main u_pkg_main(
//control
.fire_pchip(fire_pchip),
.done_pchip(done_pchip),
.fire_papp(fire_papp),
.done_papp(done_papp),
//buf satus
.pcbuf_full(pcbuf_full),
.pcbuf_empty(pcbuf_empty),
.pabuf_full(pabuf_full),
.pabuf_empty(pabuf_empty),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);
//no logic
assign done_papp = 1'b1;
assign pabuf_full = 1'b0;
assign pabuf_empty = 1'b1;


//----------- pchip path----------
wire fire_pcpush;
wire done_pcpush;
pchip_main u_pchip_main(
//control in
.fire_pchip(fire_pchip),
.done_pchip(done_pchip),
//control out
.fire_pcpush(fire_pcpush),
.done_pcpush(done_pcpush),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);



wire pcbuf_rdreq;
wire [15:0]	pcbuf_q;
pchip_buf u_pchip_buf(
//chip path
.chip_d(chip_d),
.chip_vld(chip_vld),
.chip_sel(chip_sel),
.chip_rdy(chip_rdy),
.chip_len(chip_len),
//buf status
.pcbuf_full(pcbuf_full),
.pcbuf_empty(pcbuf_empty),
.pcbuf_rdreq(pcbuf_rdreq),
.pcbuf_q(pcbuf_q),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


wire [15:0] pchip_d;
wire pchip_vld;
wire pchip_done;
pchip_push u_pchip_push(
//control 
.fire_pcpush(fire_pcpush),
.done_pcpush(done_pcpush),
.chip_len(chip_len),
//pkg data
.pchip_d(pchip_d),
.pchip_vld(pchip_vld),
.pchip_done(pchip_done),
//pcbuf port
.chip_sel(chip_sel),
.pcbuf_rdreq(pcbuf_rdreq),
.pcbuf_q(pcbuf_q),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);



//-------- pkg_mux ----------
pkg_mux u_pkg_mux(
//pkg data
.pkg_d(pkg_d),
.pkg_vld(pkg_vld),
.pkg_done(pkg_done),
//pchip data
.pchip_d(pchip_d),
.pchip_vld(pchip_vld),
.pchip_done(pchip_done),
//papp data
.papp_d(16'h0),
.papp_vld(1'b0),
.papp_done(),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


endmodule

