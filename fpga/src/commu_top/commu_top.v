//commu_top.v

module commu_top(
//uart slave
uart_tx,
uart_rx,
//fx bus
fx_waddr,
fx_wr,
fx_data,
fx_rd,
fx_raddr,
fx_q,
//clk rst
clk_sys,
rst_n
);
//uart slave
input 	uart_tx;
output 	uart_rx;
//fx_bus
output 				fx_wr;
output [7:0]	fx_data;
output [31:0]	fx_waddr;
output [31:0]	fx_raddr;
output 				fx_rd;
input  [7:0]	fx_q;
//clk rst
input clk_sys;
input rst_n;
//-----------------------------------------
//-----------------------------------------



endmodule
