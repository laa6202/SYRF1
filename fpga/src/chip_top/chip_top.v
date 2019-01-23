//chip_top.v
`define LEN_CHIP 20'd4000

module chip_top(
//data path
sm1_data,
sm2_data,
sm3_data,
sm4_data,
sm5_data,
sm6_data,
sm7_data,
sm8_data,
sm_vld,
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
//data path
input [15:0]sm1_data;
input [15:0]sm2_data;
input [15:0]sm3_data;
input [15:0]sm4_data;
input [15:0]sm5_data;
input [15:0]sm6_data;
input [15:0]sm7_data;
input [15:0]sm8_data;
input				sm_vld;
//chip path
output [15:0]	chip_d;
output				chip_vld;
output [6:0]	chip_sel;
input					chip_rdy;
output [19:0]	chip_len;
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
//--------------------------------------
//--------------------------------------

`ifdef SIM
wire [19:0] cfg_len = 20'd10;
`else
wire [19:0] cfg_len = `LEN_CHIP;
`endif

wire [19:0] chip_len = cfg_len;


wire [7:0] cfg_path_sel;
wire [15:0] cfg_chip_th;
chip_regs u_chip_regs(
.cfg_path_sel(cfg_path_sel),
.cfg_chip_th(cfg_chip_th),
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


wire [15:0] d1_data;
wire 				d1_vld;
wire [6:0]	sel_path;
wire				buf_rdy;
chip_path u_chip_path(
//data path
.sm1_data(sm1_data),
.sm2_data(sm2_data),
.sm3_data(sm3_data),
.sm4_data(sm4_data),
.sm5_data(sm5_data),
.sm6_data(sm6_data),
.sm7_data(sm7_data),
.sm8_data(sm8_data),
.sm_vld(sm_vld),
//data output 
.d1_data(d1_data),
.d1_vld(d1_vld),
.sel_path(sel_path),
.buf_rdy(buf_rdy),
.cfg_len(chip_len),
//cfg
.cfg_chip_th(cfg_chip_th),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


wire [15:0]	tx_data;
wire tx_vld;
wire	tx_done;
chip_main u_chip_main(
//uart out
.tx_data(tx_data),
.tx_vld(tx_vld),
.tx_done(tx_done),
//data in
.d1_data(d1_data),
.d1_vld(d1_vld),
.buf_rdy(),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


//-------- chip path -------
//chip path
wire [15:0]	chip_d;
wire 				chip_vld;
wire [6:0]	chip_sel;
assign chip_d = d1_data;
assign chip_vld = d1_vld;
assign chip_sel = sel_path;
assign buf_rdy = chip_rdy;

endmodule
