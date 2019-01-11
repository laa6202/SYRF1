//fx_bus.v

module fx_bus(
//fx bus for salve
fx_waddr,
fx_wr,
fx_data,
fx_rd,
fx_raddr,
con_fx_q,
app_fx_q,
ad1_fx_q,
ad2_fx_q,
ad3_fx_q,
ad4_fx_q,
ad5_fx_q,
ad6_fx_q,
ad7_fx_q,
ad8_fx_q,
dsp1_fx_q,
dsp2_fx_q,
dsp3_fx_q,
dsp4_fx_q,
dsp5_fx_q,
dsp6_fx_q,
dsp7_fx_q,
dsp8_fx_q,
p1_fx_q,
p2_fx_q,
p3_fx_q,
p4_fx_q,
p5_fx_q,
p6_fx_q,
p7_fx_q,
p8_fx_q,
ast1_fx_q,
ast2_fx_q,
ast3_fx_q,
ast4_fx_q,
ast5_fx_q,
ast6_fx_q,
ast7_fx_q,
ast8_fx_q,
chip_fx_q,
pkg_fx_q,
//fx bus for uart maseter
ufx_waddr,
ufx_wr,
ufx_data,
ufx_rd,
ufx_raddr,
ufx_q
);

//fx_bus for salve
output 				fx_wr;
output [7:0]	fx_data;
output [21:0]	fx_waddr;
output [21:0]	fx_raddr;
output 				fx_rd;
input  [7:0]	con_fx_q;
input  [7:0]	app_fx_q;
input  [7:0]	ad1_fx_q;
input  [7:0]	ad2_fx_q;
input  [7:0]	ad3_fx_q;
input  [7:0]	ad4_fx_q;
input  [7:0]	ad5_fx_q;
input  [7:0]	ad6_fx_q;
input  [7:0]	ad7_fx_q;
input  [7:0]	ad8_fx_q;
input  [7:0] dsp1_fx_q;
input  [7:0] dsp2_fx_q;
input  [7:0] dsp3_fx_q;
input  [7:0] dsp4_fx_q;
input  [7:0] dsp5_fx_q;
input  [7:0] dsp6_fx_q;
input  [7:0] dsp7_fx_q;
input  [7:0] dsp8_fx_q;
input  [7:0] p1_fx_q;
input  [7:0] p2_fx_q;
input  [7:0] p3_fx_q;
input  [7:0] p4_fx_q;
input  [7:0] p5_fx_q;
input  [7:0] p6_fx_q;
input  [7:0] p7_fx_q;
input  [7:0] p8_fx_q;
input  [7:0] ast1_fx_q;
input  [7:0] ast2_fx_q;
input  [7:0] ast3_fx_q;
input  [7:0] ast4_fx_q;
input  [7:0] ast5_fx_q;
input  [7:0] ast6_fx_q;
input  [7:0] ast7_fx_q;
input  [7:0] ast8_fx_q;
input  [7:0] chip_fx_q;
input  [7:0] pkg_fx_q;
//fx bus for uart maseter
input 				ufx_wr;
input [7:0]		ufx_data;
input [21:0]	ufx_waddr;
input [21:0]	ufx_raddr;
input 				ufx_rd;
output  [7:0]	ufx_q;
//--------------------------------------
//--------------------------------------

//-------- from master to slave --------
wire 				fx_wr;
wire [7:0]	fx_data;
wire [21:0]	fx_waddr;
wire [21:0]	fx_raddr;
wire 				fx_rd;
assign fx_wr = ufx_wr;
assign fx_data = ufx_data;
assign fx_waddr = ufx_waddr;
assign fx_raddr = ufx_raddr;
assign fx_rd = ufx_rd;



//-------- from salve to master --------
wire  [7:0]	ufx_q;
assign ufx_q = 	con_fx_q | app_fx_q | 
								chip_fx_q | pkg_fx_q |
								ad1_fx_q | ad2_fx_q | ad3_fx_q | ad4_fx_q|
								ad5_fx_q | ad6_fx_q | ad7_fx_q | ad8_fx_q|
								dsp1_fx_q|dsp2_fx_q |dsp3_fx_q |dsp4_fx_q|
								dsp5_fx_q|dsp6_fx_q |dsp7_fx_q |dsp8_fx_q|
								p1_fx_q | p2_fx_q | p3_fx_q | p4_fx_q |
								p5_fx_q | p6_fx_q | p7_fx_q | p8_fx_q |
								ast1_fx_q|ast2_fx_q |ast3_fx_q |ast4_fx_q|
								ast5_fx_q|ast6_fx_q |ast7_fx_q |ast8_fx_q;


endmodule
