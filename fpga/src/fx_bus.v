//fx_bus.v

module fx_bus(
//fx bus for salve
fx_waddr,
fx_wr,
fx_data,
fx_rd,
fx_raddr,
fx_q,
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
input  [7:0]	fx_q;
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
assign ufx_q = fx_q;


endmodule
