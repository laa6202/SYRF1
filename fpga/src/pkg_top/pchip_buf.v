//pchip_buf.v

module pchip_buf(
//chip path
chip_d,
chip_vld,
chip_sel,
chip_rdy,
chip_len,
//buf status
pcbuf_full,
pcbuf_empty,
pcbuf_rdreq,
pcbuf_q,
//clk rst
clk_sys,
rst_n
);
//chip path
input [15:0]chip_d;
input				chip_vld;
input [6:0]	chip_sel;
output			chip_rdy;
input [19:0]chip_len;
//buf status
output	pcbuf_full;
output	pcbuf_empty;
input 	pcbuf_rdreq;
output [15:0]	pcbuf_q;
//clk rst
input clk_sys;
input rst_n;
//-----------------------------------
//-----------------------------------


wire [11:0] usedw;
wire empty;
wire rdreq;
wire [15:0] q;
fifo16x4096 u_fifo16x4096 (
.clock(clk_sys),
.data(chip_d),
.rdreq(rdreq),
.wrreq(chip_vld),
.empty(empty),
.full(),
.q(q),
.usedw(usedw)
);

//assign rdreq = 1'b0;
assign rdreq = pcbuf_rdreq;
wire [15:0] pcbuf_q = q;

//--------- chip_rdy ----------
//wire chip_rdy = (usedw < chip_len[11:0]) ? 1'b1 : 1'b0;
reg chip_rdy;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		chip_rdy <= 1'b1;
	else if(empty)
		chip_rdy <= 1'b1;
	else if(usedw >= chip_len[11:0])
		chip_rdy <= 1'b0;
	else ;
end


//--------- buf status ----------
wire pcbuf_full = (usedw >= chip_len[11:0]) ? 1'b1 : 1'b0;
wire pcbuf_empty = empty;

endmodule
