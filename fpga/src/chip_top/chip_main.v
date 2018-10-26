//chip_main.v

`define LEN_CHIP 20'd4000

module chip_main(
//uart out
tx_data,
tx_vld,
tx_done,
//data in
d1_data,
d1_vld,
//clk rst
clk_sys,
rst_n
);
//uart out
output [15:0]	tx_data;
output				tx_vld;
input					tx_done;
//data in
input [15:0]	d1_data;
input		d1_vld;
//clk rst
input clk_sys;
input rst_n;
//-----------------------------------
//-----------------------------------

`ifdef SIM
wire [19:0] cfg_len = 20'd10;
`else
wire [19:0] cfg_len = `LEN_CHIP;
`endif


//--------- main FSM ------------
parameter S_IDLE = 3'h0;
parameter S_BUF = 3'h1;
parameter S_PUSH = 3'h2;
parameter S_LOCK = 3'h3;
parameter S_DONE = 3'h7;
reg [2:0] st_chip;
wire done_buf;
wire done_push;
always @(posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		st_chip <= S_IDLE;
	else begin
		case(st_chip)
			S_IDLE : st_chip <= d1_vld ? S_BUF : S_IDLE;
			S_BUF  : st_chip <= done_buf ? S_PUSH : S_BUF;
			S_PUSH : st_chip <= done_push ? S_LOCK : S_PUSH;
			S_LOCK : st_chip <= S_DONE;
			S_DONE : st_chip <= S_IDLE;
			default : st_chip <= S_IDLE;
		endcase
	end
end


//--------- FSM switch ------------
wire buf_vld = ((st_chip == S_IDLE) | (st_chip == S_BUF)) & d1_vld;


reg [19:0] cnt_buf;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_buf <= 20'h0;
	else if(buf_vld)
		cnt_buf <= cnt_buf + 20'h1;
	else if(st_chip != S_BUF)
		cnt_buf <= 20'h0;
	else ;
end
assign done_buf = (cnt_buf == (cfg_len - 20'h1)) ? 1'b1 : 1'b0;


reg [19:0] cnt_push;
wire word_push;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_push <= 20'h0;
	else if(st_chip == S_PUSH)
		cnt_push <= word_push ? (cnt_push + 20'h1) : cnt_push;
	else if(st_chip != S_PUSH)
		cnt_push <= 20'h0;
	else ;
end
assign done_push = (cnt_push == (cfg_len - 20'h1)) ? 1'b1 : 1'b0;



//---------- buf path ------------

wire wrreq = d1_vld;
wire [15:0] wdata = d1_data;


wire rdreq;						
fifo16x4096 u_fifo16x4096 (
.clock(clk_sys),
.data(wdata),
.rdreq(rdreq),
.wrreq(wrreq),
.empty(),
.full(),
.q(tx_data),
.usedw()
);


//------------ data push ----------
reg tx_vld;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		tx_vld <= 1'b0;
	else if(done_push)
		tx_vld <= 1'b1;
	else 
		tx_vld <= 1'b0;
end


endmodule

