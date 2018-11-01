//chip_path.v

`define LEN_CHIP 20'd4000

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
buf_rdy,
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
input					buf_rdy;
//cfg
input [7:0]		cfg_path_sel;
input [15:0]	cfg_chip_th;
//clk rst
input clk_sys;
input rst_n;
//--------------------------------------
//--------------------------------------
`ifdef SIM
wire [19:0] cfg_len = 20'd10;
`else
wire [19:0] cfg_len = `LEN_CHIP;
`endif

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


reg [19:0] cnt_th;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_th <= 20'h0;
	else if((cnt_th != 20'h0) & d0_vld & buf_rdy)
		cnt_th <= cnt_th - 20'h1;
	else if((d0_data >= cfg_chip_th ) & d0_vld & buf_rdy)
		cnt_th <= cfg_len - 20'h1;
	else ;
end

wire [15:0]	d1_data;
wire				d1_vld;
assign d1_data = (cnt_th != 20'h0) ? d0_data : 16'h0;
assign d1_vld = (cnt_th != 20'h0) ? d0_vld : 16'h0;


endmodule

