//pkg_mux.v

module pkg_mux(
//pkg data
pkg_d,
pkg_vld,
pkg_done,
//pchip data
pchip_d,
pchip_vld,
pchip_done,
//papp data
papp_d,
papp_vld,
papp_done,
//clk rst
clk_sys,
rst_n
);
//pkg data
output [15:0]	pkg_d;
output				pkg_vld;
input					pkg_done;
//pchip data
input [15:0]pchip_d;
input				pchip_vld;
output			pchip_done;
//papp data
input [15:0]papp_d;
input				papp_vld;
output			papp_done;
//clk rst
input clk_sys;
input rst_n;
//-----------------------------
//-----------------------------

//pkg data
wire [15:0]	pkg_d;
wire				pkg_vld;
assign pkg_d = pchip_d | papp_d;
assign pkg_vld = pchip_vld | papp_vld;


wire pchip_done = pkg_done;
wire papp_done  = pkg_done;


endmodule
