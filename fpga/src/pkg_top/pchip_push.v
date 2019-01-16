//pchip_push.v

module pchip_push(
//pkg data
pchip_d,
pchip_vld,
pchip_done,
//pcbuf port
pcbuf_rdreq,
pcbuf_q,
//clk rst
clk_sys,
rst_n
);

//pkg data
output [15:0]	pchip_d;
output				pchip_vld;
input					pchip_done;
//pcbuf port
output 				pcbuf_rdreq;
input [15:0]	pcbuf_q;
//clk rst
input clk_sys;
input rst_n;
//-----------------------------------
//-----------------------------------


wire pcbuf_rdreq = 1'b0;

endmodule
