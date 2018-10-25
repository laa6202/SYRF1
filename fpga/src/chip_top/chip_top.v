//chip_top.v


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
//data debug
uart_data,
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
//data debug
output uart_data;
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
input rst_n;
//--------------------------------------
//--------------------------------------


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
//cfg
.cfg_path_sel(cfg_path_sel),
.cfg_chip_th(cfg_chip_th),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);

endmodule