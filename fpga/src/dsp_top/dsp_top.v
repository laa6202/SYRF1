//dsp_top.v

`define NO_FIR

module dsp_top(
ad_data,
ad_vld,
sm_data,
sm_vld,
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
input [15:0]	ad_data;
input ad_vld;
output [15:0]	sm_data;
output sm_vld;
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

//------------------------------------
//------------------------------------


//----------- register --------
dsp_regs u_dsp_regs( 
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


//no logic
wire [15:0] sm_data;
wire	sm_vld;
`ifdef NO_FIR
assign sm_data = ad_data;
assign sm_vld = ad_vld;

`else

fir2 u_fir1 (
		.clk(clk_sys),              //                     clk.clk
		.reset_n(rst_n),          //                     rst.reset_n
		.ast_sink_data(ad_data),    //   avalon_streaming_sink.data
		.ast_sink_valid(ad_vld),   //                        .valid
		.ast_sink_error(2'h0),   //                        .error
		.ast_source_data(sm_data),  // avalon_streaming_source.data
		.ast_source_valid(sm_vld), //                        .valid
		.ast_source_error()  //                        .error
	);
	
`endif

endmodule
