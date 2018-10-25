//chip_path.v

module chip_path(
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
//data output 
d1_data,
d1_vld,
//cfg
cfg_path_sel,
cfg_chip_th,
//clk rst
clk_sys,
rst_n
);
//data path input 
input [15:0]sm1_data;
input [15:0]sm2_data;
input [15:0]sm3_data;
input [15:0]sm4_data;
input [15:0]sm5_data;
input [15:0]sm6_data;
input [15:0]sm7_data;
input [15:0]sm8_data;
input				sm_vld;
//data path output
output [15:0]	d1_data;
output				d1_vld;
//cfg
input [7:0]		cfg_path_sel;
input [15:0]	cfg_chip_th;
//clk rst
input clk_sys;
input rst_n;
//--------------------------------------
//--------------------------------------

wire [15:0]	d0_data;
wire d0_vld;
assign d0_data = 	(cfg_path_sel == 7'h0) ? sm1_data :
									(cfg_path_sel == 7'h1) ? sm2_data :
									(cfg_path_sel == 7'h2) ? sm3_data :
									(cfg_path_sel == 7'h3) ? sm4_data :
									(cfg_path_sel == 7'h4) ? sm5_data :
									(cfg_path_sel == 7'h5) ? sm6_data :
									(cfg_path_sel == 7'h6) ? sm7_data :
									(cfg_path_sel == 7'h7) ? sm8_data : sm1_data;
assign d0_vld = sm_vld;


endmodule

