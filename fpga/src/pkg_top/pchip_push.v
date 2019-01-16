//pchip_push.v

module pchip_push(
//control 
fire_pcpush,
done_pcpush,
chip_len,
//pkg data
pchip_d,
pchip_vld,
pchip_done,
//pcbuf port
chip_sel,
pcbuf_rdreq,
pcbuf_q,
//clk rst
clk_sys,
rst_n
);
//control 
input 	fire_pcpush;
output 	done_pcpush;
input [19:0] chip_len;
//pkg data
output [15:0]	pchip_d;
output				pchip_vld;
input					pchip_done;
//pcbuf port
input [6:0]		chip_sel;
output 				pcbuf_rdreq;
input [15:0]	pcbuf_q;
//clk rst
input clk_sys;
input rst_n;
//-----------------------------------
//-----------------------------------


//-------- main FSM ---------
parameter S_IDLE = 4'h0;
parameter S_FH1 = 4'h1;
parameter S_WH1 = 4'h2;
parameter S_FH2 = 4'h3;
parameter S_WH2 = 4'h4;
parameter S_FH3 = 4'h5;
parameter S_WH3 = 4'h6;
parameter S_FDA = 4'h7;
parameter S_WDA = 4'h8;
parameter S_CHK = 4'h9;
parameter S_DONE = 4'hf;
reg [3:0] st_pchip_push;
wire finish_push;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		st_pchip_push <= S_IDLE;
	else begin
		case(st_pchip_push)
			S_IDLE : st_pchip_push <= fire_pcpush ? S_FH1 : S_IDLE;
			S_FH1  : st_pchip_push <= S_WH1;
			S_WH1  : st_pchip_push <= pchip_done ? S_FH2 : S_WH1;
			S_FH2  : st_pchip_push <= S_WH2;
			S_WH2  : st_pchip_push <= pchip_done ? S_FH3 : S_WH2;
			S_FH3  : st_pchip_push <= S_WH3;
			S_WH3  : st_pchip_push <= pchip_done ? S_FDA : S_WH3;
			S_FDA  : st_pchip_push <= S_WDA;
			S_WDA  : st_pchip_push <= pchip_done ? S_CHK : S_WDA;
			S_CHK  : st_pchip_push <= finish_push ? S_DONE : S_FDA;
			S_DONE : st_pchip_push <= S_IDLE;
			default: st_pchip_push <= S_IDLE;
		endcase
	end
end
wire done_pcpush = (st_pchip_push == S_DONE) ? 1'b1 : 1'b0;


//------- FSM swith condtion --------
reg [11:0] cnt_push;
always @(posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_push <= 12'h0;
	else if(st_pchip_push == S_IDLE)
		cnt_push <= 12'h0;
	else if(st_pchip_push == S_FDA)
		cnt_push <= cnt_push + 12'h1;
	else ;
end
assign finish_push = (cnt_push == chip_len[11:0]) ? 1'b1 : 1'b0;
reg [15:0] pkg_index;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		pkg_index <= 16'h0;
	else if(st_pchip_push == S_DONE)
		pkg_index <= pkg_index + 16'h1;
	else ;
end

//-------- push head ----------
wire now_h1 = (st_pchip_push == S_FH1) | (st_pchip_push == S_WH1);
wire now_h2 = (st_pchip_push == S_FH2) | (st_pchip_push == S_WH2);
wire now_h3 = (st_pchip_push == S_FH3) | (st_pchip_push == S_WH3);
wire [15:0]	pchead_d;
wire 				pchead_vld;
assign pchead_d = now_h1 ? 16'h5331 : 
									now_h2 ? {9'h0,chip_sel} :
									now_h3 ? pkg_index : 16'h0;
assign pchead_vld = (st_pchip_push == S_FH1) | 
										(st_pchip_push == S_FH2) | 
										(st_pchip_push == S_FH3);


//--------- push data ----------
wire now_dat = 	(st_pchip_push == S_FDA) |
								(st_pchip_push == S_WDA) |
								(st_pchip_push == S_CHK);
wire pcbuf_rdreq = (st_pchip_push == S_CHK) ? 1'b1 : 1'b0;
wire [15:0] pcdat_d = now_dat ? pcbuf_q : 16'h0;
wire pcdat_vld = (st_pchip_push == S_FDA) ? 1'b1 : 1'b0;


//-------- pchip mux ---------
wire [15:0] pchip_d;
wire				pchip_vld;
assign pchip_d = pchead_d | pcdat_d;
assign pchip_vld = pchead_vld | pcdat_vld;



endmodule
